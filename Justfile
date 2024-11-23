set quiet := true

# streaming
deploy-update:
    #!/usr/bin/env zsh
    git add --all
    if [[ $? -ne 0 ]] ; then
        echo "No changes to commit."
        return 1
    fi
    git commit --message="content: update" && 
        git push --no-progress &&
        ./.report-deployment-status.sh

#───────────────────────────────────────────────────────────────────────────────

[macos]
open-website:
    open "https://chris-grieser.de/sitemap"
    open "https://chris-grieser.de/"

[macos]
jekyll-docs:
    open "https://jekyllrb.com/docs/front-matter/"
