all:
	dune build --root .

start:
	./_build/default/server/main.exe

tests:
	./_build/default/test/test.exe

tests-update:
	./_build/default/test/test.exe -u

convert: BL/*.re
	for f in $^ ; do \
		base=$$(basename -s re $$f); \
		path=$$(dirname $$f); \
		./convert/node_modules/.bin/bsc -o "$${path}/$${base}res" -format $${f}; \
	done

convertrei: BL/*.rei
	for f in $^ ; do \
		base=$$(basename -s re $$f); \
		path=$$(dirname $$f); \
		./convert/node_modules/.bin/bsc -o "$${path}/$${base}res" -format $${f}; \
	done

pui:
	$(MAKE) convert
	#$(MAKE) convertrei
	npm run res:build
	./node_modules/.bin/wrup browser -r ./UI/index.bs.js | ./node_modules/.bin/terser --compress --mangle > server/JS/min.js
