.PHONY : all resume build clean
PDF_FILES = ./resume/Jack_Maney_Resume.pdf ./_site/resume/Jack_Maney_Resume.pdf

build:
	@/bin/echo -n "Building site..."
	@bundle exec jekyll build > /dev/null
	@/bin/echo "Done!"

resume: build
	@/bin/echo -n "Building PDFs..."
	@pandoc --read=html --write=latex -V title:"" -o ./resume/Jack_Maney_Resume.pdf ./_site/resume/printable/index.html && cp ./resume/Jack_Maney_Resume.pdf ./_site/resume/Jack_Maney_Resume.pdf
	@/bin/echo "Done!"

all: resume build

clean:
	@rm -f $(PDF_FILES)

.DEFAULT_GOAL := all