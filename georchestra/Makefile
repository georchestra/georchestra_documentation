.PHONY: all
all: clone migrations docs
	touch html/.nojekyll

.PHONY: clone
clone:
	if [! -d georchestra ]; then git clone --depth=1 https://github.com/georchestra/georchestra.git ; fi

.PHONY: migrations
migrations: clone
	touch georchestra/migrations/index.md
	sphinx-build -c config/ georchestra/migrations html/migrations/

.PHONY: docs
docs: clone
	sphinx-build -c config/ georchestra/docs html/docs

.PHONY: clean
clean:
	rm -rf html/ georchestra/
