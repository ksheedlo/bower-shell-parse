.PHONY: all
all: dist/shell-parse.js dist/shell-parse.min.js dist/angular-shell-parse.js dist/angular-shell-parse.min.js

.PHONY: clean
clean: 
	rm dist/*.js parser.min.js

parser.min.js: node_modules/shell-parse/parser.js
	./node_modules/.bin/uglifyjs $^ -m -c >$@

dist/%.min.js: %.min.js parser.min.js
	./node_modules/.bin/browserify $< -o $@

dist/%.js: %.js
	./node_modules/.bin/browserify $< -o $@

