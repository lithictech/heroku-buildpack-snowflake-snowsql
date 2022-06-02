
test:
	@mkdir -p ./temp/cache
	@rm -rf ./temp/build
	@mkdir -p ./temp/build
	@bash ./bin/detect ./temp/build
	@DRYRUN=true bash ./bin/compile ./temp/build ./temp/cache

clean:
	@mkdir -p ./temp
	@rm -rf ./temp/cache

test-clean: clean test
