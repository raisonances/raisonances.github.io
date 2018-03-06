#
#
#

timestamp=$(shell date +%Y%m%d%H%M%S)
release=r$(timestamp)
message?=""

all:
	@echo "make init : initialize project environment (git submodules)"
	@echo "make deploy : deploy to github pages with commit message"

init:
	(cd _site && git submodule init && git submodule update && git checkout master)
	bundle install

deploy:
	bundle exec jekyll build
	(cd _site && git add . && git commit -m "[deploy $(release)] $(message)" && git push)
	git add .
	git commit -m "[deploy $(release)] $(message)"
	git push
