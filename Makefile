PACKAGES=$(shell ls -d */)

update:
	git pull
	for package in $(PACKAGES); do stow $$package; done

install_dep:
	./dependencies.sh

install: update install_dep
