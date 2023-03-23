all:
	dune build --root .

start:
	./_build/default/server/main.exe

tests:
	./_build/default/test/test.exe

tests-update:
	./_build/default/test/test.exe -u

pui:
	npm run res:build
	./node_modules/.bin/wrup browser -r ./UI/index.bs.js | ./node_modules/.bin/terser --compress --mangle > server/JS/min.js
