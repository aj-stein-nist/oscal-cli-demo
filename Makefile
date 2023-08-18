.PHONY: presentation
presentation:
	./node_modules/.bin/marp --allow-local-files --theme define --theme-set media/style -o generated -I presentations --pdf
	./node_modules/.bin/marp --allow-local-files --theme define --theme-set media/style -o generated -I presentations --html
.PHONY: clean
clean:
	rm -rf generated/*

.PHONY: all
all: clean presentation
