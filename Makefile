HTML_FILES := $(patsubst %.Rmd, %.html, $(wildcard *.Rmd))

all: html

%.html: %.Rmd
    R --slave -e "set.seed(100);rmarkdown::render('$<', encoding = 'UTF-8')"

.PHONY: clean

clean:
    $(RM) -r _cache $(HTML_FILES)
