#!/bin/sh
# Rebuild index.html from ../prism-bench.html (wraps it in a standalone document). Then commit and push.
cd "$(dirname "$0")" && python3 - <<'PY'
src=open('../prism-bench.html').read().replace("<title>Prism Bench</title>","",1)
head=open('index.html').read().split('<body>\n')[0]+'<body>\n'
open('index.html','w').write(head+src+'\n</body>\n</html>\n')
PY
