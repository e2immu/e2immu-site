#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# The site needs Hugo 0.82.1 (the pinned version bundled via the hugo-bin npm package,
# in node_modules). The Homebrew-installed `hugo` on PATH is a much newer major version
# and has breaking changes against this site/theme -- do NOT swap this for a bare `hugo`.
HUGO="$(dirname "$0")/node_modules/.bin/hugo"

# Build the project.
"$HUGO"

# Go To Public folder (a submodule pointing at bnaudts.github.io, which auto-publishes
# on push to master via GitHub Pages -- no separate deploy action needed).
cd public

# Add changes to git.
git add .

# Commit changes, but don't fail if the rebuild produced nothing new.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
if ! git diff --cached --quiet; then
	git commit -m "$msg"
	# Push the build repo.
	git push origin master
else
	printf "Nothing changed in the built site; skipping commit/push.\n"
fi

# Record the new public/ submodule pointer in the source repo, if it moved.
cd ..
if ! git diff --quiet -- public; then
	git add public
	git commit -m "$msg"
	git push origin master
fi
