# https://blog.sneawo.com/blog/2017/06/13/makefile-help-target/

.PHONY : all resume build clean help
PDF_FILES = ./resume/Jack_Maney_Resume.pdf ./_site/resume/Jack_Maney_Resume.pdf
PANDOC = pandoc

help: ## show this help
	@echo 'usage: make [target] ...'
	@echo ''
	@echo 'targets:'
	@egrep '^(.+)\:\ .*##\ (.+)' ${MAKEFILE_LIST} | sed 's/:.*##/#/' | column -t -c 2 -s '#'

build: ## Build the static website. Advisable to do this before doing a `git push`.
	@/bin/echo -n "Building site..."
	@bundle exec jekyll build > /dev/null
	@/bin/echo "Done!"

resume: build ## Rebuilds the website, and then builds a PDF version of the resume (pandoc required).
	@/bin/echo -n "Building PDFs..."
	@${PANDOC} --read=html --write=latex -V title:"" -o ./resume/Jack_Maney_Resume.pdf ./_site/resume/printable/index.html && cp ./resume/Jack_Maney_Resume.pdf ./_site/resume/Jack_Maney_Resume.pdf
	@/bin/echo "Done!"

serve: ## Serve the site locally (for testing purposes).
	@/bin/echo "Serving the site locally..."
	@bundle exec jekyll serve

all: resume build ## Rebuild the static site and (re)build the PDF version of the resume.

clean: ## Clean up the resume PDF files.
	@rm -f $(PDF_FILES)

.DEFAULT_GOAL := all