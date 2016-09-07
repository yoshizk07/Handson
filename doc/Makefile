default: inputformat.pdf programs.pdf tutorial.pdf
#default: develop.pdf example-c6h12.pdf example-cu.pdf formalism.pdf inputformat.pdf programs.pdf tutorial.pdf

clean:
	rm -f *.aux *.dvi *.log *.toc *.pdf

develop.pdf:
	platex --kanji=euc develop.tex
	platex --kanji=euc develop.tex
	dvipdfmx -o develop.pdf develop.dvi

example-c6h12.pdf:
	platex --kanji=euc example-c6h12.tex
	platex --kanji=euc example-c6h12.tex
	dvipdfmx -o example-c6h12.pdf example-c6h12.dvi

example-cu.pdf:
	platex --kanji=euc example-cu.tex
	platex --kanji=euc example-cu.tex
	dvipdfmx -o example-cu.pdf example-cu.dvi

formalism.pdf:
	platex --kanji=sjis formalism.tex
	platex --kanji=sjis formalism.tex
	dvipdfmx -o formalism.pdf formalism.dvi

inputformat.pdf:
	platex --kanji=euc inputformat.tex
	platex --kanji=euc inputformat.tex
	dvipdfmx -o inputformat.pdf inputformat.dvi

programs.pdf:
	platex --kanji=euc programs.tex
	platex --kanji=euc programs.tex
	dvipdfmx -o programs.pdf programs.dvi

tutorial.pdf:
	platex --kanji=euc tutorial.tex
	platex --kanji=euc tutorial.tex
	dvipdfmx -o tutorial.pdf tutorial.dvi
