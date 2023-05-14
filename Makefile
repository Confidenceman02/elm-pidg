Y=yarn -s --prefer-offline

.PHONY: run-example
run-example:
	${Y} parcel --dist-dir=dist-example --open --port=8086 examples/index.html

.PHONY: transpile-pidg
transpile-pidg:
	${Y} rollup -c --bundleConfigAsCjs

.PHONY: extract
extract:
	${Y} lingui extract

.PHONY: compile
compile:
	${Y} lingui compile
