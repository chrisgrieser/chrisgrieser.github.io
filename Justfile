set quiet := true

url := "https://chris-grieser.de"

#───────────────────────────────────────────────────────────────────────────────

# `report-deployment-status.sh` is streaming output
deploy-update:
    #!/usr/bin/env zsh
    git add --all
    if [[ $? -ne 0 ]] ; then
        echo "No changes to commit."
        return
    fi
    git commit --message="content: update" && 
        git push --no-progress &&
        ./report-deployment-status.sh &&
        afplay "/System/Library/Sounds/Hero.aiff" # `afplay` is macOS only

#───────────────────────────────────────────────────────────────────────────────

[macos]
open-website:
    open "{{ url }}"

[macos]
sitemap:
    open "{{ url }}/sitemap"
