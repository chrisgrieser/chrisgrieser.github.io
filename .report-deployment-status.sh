#!/usr/bin/env zsh
# INFO
# checks the deployment status of the latest GitHub Action run and exits either
# after a timeout or with a non-zero exit code if the deployment failed.
# Requires the `$GITHUB_TOKEN`.
#───────────────────────────────────────────────────────────────────────────────
# CONFIG
spinner="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
timeout_secs=300 # = 5 minutes

#───────────────────────────────────────────────────────────────────────────────

repo=$(git remote --verbose | head -n1 | cut -d: -f2 | cut -d" " -f1)

for ((i = 1; i <= timeout_secs; i++)); do
	sleep 1
	last_run=$(
		curl --silent -L \
			-H "Accept: application/vnd.github+json" \
			-H "Authorization: Bearer $GITHUB_TOKEN" \
			-H "X-GitHub-Api-Version: 2022-11-28" \
			"https://api.github.com/repos/$repo/actions/runs?per_page=1"
	)
	run_status=$(echo "$last_run" | grep '"status":' | cut -d'"' -f4)
	[[ $i -eq 1 ]] && workflow_name=$(echo "$last_run" | grep '"display_title":' | cut -d'"' -f4)
	[[ "$run_status" == "completed" ]] && break
	pos=$((i % ${#spinner}))
	printf "\r[%s] %s %s" "$workflow_name" "${spinner:$pos:1}" "$run_status"
done
printf "\r" # progress message / spinner

conclusion=$(echo "$last_run" | grep '"conclusion":' | cut -d'"' -f4)
if [[ "$run_status" != "completed" ]]; then
	echo "⚠️ Timeout after $timeout_secs seconds."
elif [[ "$conclusion" != "success" ]]; then
	echo "❌ $conclusion"
else
	echo "✅ Success"
fi
