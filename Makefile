tags:
	vim -c ':helptags . | :q'

sumtxt: sumv.txt sumvc.txt sumcv.txt sumcvc.txt sumvcv.txt

%.txt: sumerian.org/%.htm htm2txt.vim
	cat <$< >$@
	vim -c ":source htm2txt.vim" $@

.PHONY: tags
