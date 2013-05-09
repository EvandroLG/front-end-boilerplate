install: install_node install_jshint install_yuiglify install_phantomjs

install_node:
	@brew install node

install_npm:
	@curl https://npmjs.org/install.sh | sudo sh

install_phantomjs:
	@brew install phantomjs
	@sudo npm install phantom-jasmine -g

install_jshint:
	@sudo npm install jshint -g

install_yuiglify:
	@sudo npm install yuglify -g

jshint:
	@jshint project/src/js/*.js

test:
	phantomjs project/test/lib/run_jasmine_test.coffee project/test/runner.html

compress_js:
	@yuglify -c project/src/js/default project/src/js/*.js

compress_css:
	@yuglify -c project/src/css/default project/src/css/*.css