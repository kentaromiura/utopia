all:
	dune build --root .

start:
	./_build/default/server/main.exe

tests:
	./_build/default/test/test.exe

tests-update:
	./_build/default/test/test.exe -u

pui: BL/*.re
	for file in $^ ; do \
		npx rescript@9 convert $${file}; \
		git checkout HEAD $${file}; \
	done
	#npx rescript@9 convert BL/*.re
	npm run res:build
	./node_modules/.bin/wrup browser -r ./UI/index.bs.js | ./node_modules/.bin/terser --compress --mangle > server/JS/min.js
