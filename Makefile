MD_FILES := $(patsubst %.orig.Rmd, %.md, $(wildcard *.Rmd))

all: $(MD_FILES)

%.Rmd: %.orig.Rmd
	sed "/^<!--/d" $< > $@

%.md: %.Rmd
	R --slave -e "set.seed(100);rmarkdown::render('$<', encoding = 'UTF-8')"

.PHONY: clean

clean:
	$(RM) -r _cache $(MD_FILES)
