set quiet := true

domain := "https://chris-grieser.de"

#───────────────────────────────────────────────────────────────────────────────

# streaming output
deploy-update:
    #!/usr/bin/env zsh
    git add --all
    if [[ $? -ne 0 ]] ; then
        echo "No changes to commit."
        return
    fi
    git commit --message="content: update" && 
        git push --no-progress &&
        ./report-deployment-status.sh

#───────────────────────────────────────────────────────────────────────────────

[macos]
open-website:
    open "{{ domain }}"

[macos]
sitemap:
    open "{{ domain }}/sitemap"
