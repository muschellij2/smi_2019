all: index.html index.pdf README.md

index.html: index.Rmd
	- Rscript -e "rmarkdown::render('index.Rmd')"

index.pdf: index.html index.Rmd 
	electron-pdf index.html index.pdf --landscape

README.md: README.Rmd
	- Rscript -e "rmarkdown::render('README.Rmd')"
