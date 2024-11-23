set quiet := true

# streaming
deploy-update: && open-website
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
    open "https://chris-grieser.de/"

[macos]
sitemap:
    open "https://chris-grieser.de/sitemap"
