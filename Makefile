all:
	dune build --root .

start:
	./_build/default/server/main.exe

tests:
	./_build/default/test/test.exe

tests-update:
	./_build/default/test/test.exe -u
