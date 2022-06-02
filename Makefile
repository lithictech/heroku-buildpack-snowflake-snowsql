
_test:
	@mkdir -p ./temp/cache
	@rm -rf ./temp/build
	@mkdir -p ./temp/build
	@bash ./bin/detect ./temp/build
	@bash ./bin/compile ./temp/build ./temp/cache ./temp/env

test-dryrun:
	@DRYRUN=true make _test

clean:
	@mkdir -p ./temp
	@rm -rf ./temp/cache
	@rm -rf ./temp/env

test-clean: clean test-dryrun

add-envs:
	@rm -rf ./temp/env
	@mkdir -p ./temp/env
	@echo "username=mybuildpack" > ./temp/env/SNOWSQL_BUILDPACK_CONFIG_CONTENTS
	@echo "mkdir -p ~/.snowsql; echo 'ran fake build'" > ./temp/fake-installer.bash
	@echo "file://${PWD}/temp/fake-installer.bash" > ./temp/env/SNOWSQL_BUILDPACK_DOWNLOAD_URL

test-env: clean add-envs _test
