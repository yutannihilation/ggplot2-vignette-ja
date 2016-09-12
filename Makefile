MD_FILES := $(patsubst %.Rmd, %.nocomments.md, $(wildcard *.Rmd))

all: $(MD_FILES)

%.nocomments.Rmd: %.Rmd
	sed "/^<!--/d" $< > $@

%.nocomments.md: %.nocomments.Rmd
	R --slave -e "set.seed(100);rmarkdown::render('$<', encoding = 'UTF-8')"

.PHONY: clean

clean:
	$(RM) -r _cache $(MD_FILES)
