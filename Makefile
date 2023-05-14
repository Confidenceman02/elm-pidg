Y=yarn -s --prefer-offline

.PHONY: run-example
run-example:
	${Y} parcel --dist-dir=dist-example --open --port=8086 examples/index.html

