#!/bin/sh
# Rebuild the public page from ../prism-bench.html:
# - wraps it in a standalone document (head with title + share tags)
# - PUBLIC_DEMO on: menu balls only hop when clicked (no sections)
# - strips the reference bio copy (it is someone else's text; the public build never shows it)
cd "$(dirname "$0")" && python3 - <<'PY'
import re
src=open('../prism-bench.html').read().replace("<title>Prism Bench</title>","",1)
src=src.replace("const PUBLIC_DEMO=false;","const PUBLIC_DEMO=true;",1)
src=re.sub(r"I’m the founder[^']*?of our work","",src)
assert "HOVS" not in src and "PUBLIC_DEMO=true" in src
head=open('index.html').read().split('<body>\n')[0]+'<body>\n'
open('index.html','w').write(head+src+'\n</body>\n</html>\n')
PY
