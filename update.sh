#!/usr/bin/env bash
set -euo pipefail
# load vars.env
set -a; [ -f vars.env ] && source vars.env; set +a
# call starred
venv/bin/starred --username gmolveau --token ${GITHUB_TOKEN} --sort > README.md.new
echo -en '# A curated list of my GitHub stars!\n\nGenerated by [starred](https://github.com/maguowei/starred)' > README.md
awk 'NR > 4 { print }' README.md.new >> README.md
rm README.md.new
git add README.md; git commit -m "update starred repos"; git push