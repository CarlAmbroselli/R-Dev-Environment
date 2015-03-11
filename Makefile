LIVERELOAD_DIR ?= ./
LIVERELOAD_SRC ?= $(shell find $(LIVERELOAD_DIR) -name '*.css' -name '*.html' -o -name '*.js')
DEBUG ?= tinylr:cli
	DIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
TINYLR := "$(PWD)"/node_modules/.bin/tiny-lr

all:
	Rscript -e "library(knitr); knit('main.Rhtml')"
	curl --ipv4 http://localhost:35729/changed?files=main.html

clean:
	rm *.html

open:
	open "main.html"

livereload-start:
	@echo ... Starting server, running in background ...
	@echo ... Run: "make livereload-stop" to stop the server ...
	@DEBUG=$(DEBUG) $(TINYLR) &

# Alias livereload to the start target
livereload: livereload-start

livereload-stop:
	curl --ipv4 http://localhost:35729/kill

.PHONY: livereload livereload-start livereload-stop
