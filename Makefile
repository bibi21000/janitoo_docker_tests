# Makefile for janitoo
#

# You can set these variables from the command line.
ARCHBASE      = archive
BUILDDIR      = build
DISTDIR       = dists
NOSE          = $(shell which nosetests)
NOSEOPTS      = --verbosity=2
PYLINT        = $(shell which pylint)
PYLINTOPTS    = --max-line-length=140 --max-args=9 --extension-pkg-whitelist=zmq --ignored-classes=zmq --min-public-methods=0

ifndef PYTHON_EXEC
PYTHON_EXEC=python
endif

ifndef message
message="Auto-commit"
endif

ifdef VIRTUAL_ENV
python_version_full := $(wordlist 2,4,$(subst ., ,$(shell ${VIRTUAL_ENV}/bin/${PYTHON_EXEC} --version 2>&1)))
else
python_version_full := $(wordlist 2,4,$(subst ., ,$(shell ${PYTHON_EXEC} --version 2>&1)))
endif

janitoo_version := $(shell ${PYTHON_EXEC} _version.py 2>/dev/null)

python_version_major = $(word 1,${python_version_full})
python_version_minor = $(word 2,${python_version_full})
python_version_patch = $(word 3,${python_version_full})

PIP_EXEC=pip
ifeq (${python_version_major},3)
	PIP_EXEC=pip3
endif

MODULENAME   = $(shell basename `pwd`)
DOCKERNAME   = $(shell echo ${MODULENAME}|sed -e "s|janitoo_||g")
DOCKERVOLS   =
DOCKERPORT   = 8882
NOSEMODULES  = janitoo,janitoo_factory,janitoo_db
MOREMODULES  = janitoo_factory_ext

DEBIANDEPS := $(shell [ -f debian.deps ] && cat debian.deps)
BOWERDEPS := $(shell [ -f bower.deps ] && cat bower.deps)

TAGGED := $(shell git tag | grep -c v${janitoo_version} )

COVERALLS_REPO_TOKEN = 3XGlPDJ1miuq8vVeZkjq1PSxyCUnHGBMZ

-include Makefile.local

NOSECOVER     = --cover-package=${MODULENAME} --with-coverage --cover-inclusive --cover-html --cover-html-dir=${BUILDDIR}/docs/html/tools/coverage --with-html --html-file=${BUILDDIR}/docs/html/tools/nosetests/index.html
NOSEDOCKER     = --cover-package=${NOSEMODULES},${MODULENAME},${MOREMODULES} --with-coverage --cover-inclusive --with-xunit --xunit-testsuite-name=${MODULENAME}

.PHONY: help check-tag clean all build develop install uninstall clean-doc doc certification tests deps docker-tests coveralls

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build           : build the module"
	@echo "  develop         : install for developpers"
	@echo "  install         : install for users"
	@echo "  uninstall       : uninstall the module"
	@echo "  deps            : install dependencies for users"
	@echo "  doc   	    	 : make documentation"
	@echo "  tests           : launch tests"
	@echo "  clean           : clean the development directory"

clean-dist:
	-rm -rf $(DISTDIR)

clean: clean-doc
	-rm -rf $(ARCHBASE)
	-rm -rf $(BUILDDIR)
	-rm -f generated_doc
	-rm -f janidoc
	-@find . -name \*.pyc -delete

uninstall:
	-yes | ${PIP_EXEC} uninstall ${MODULENAME}
	-${PYTHON_EXEC} setup.py develop --uninstall
	-@find . -name \*.egg-info -type d -exec rm -rf "{}" \;

deps:
ifneq ('${DEBIANDEPS}','')
	sudo apt-get install -y ${DEBIANDEPS}
endif
	@echo
	@echo "Dependencies for ${MODULENAME} finished."

install:
	${PYTHON_EXEC} setup.py install
	@echo
	@echo "Installation of ${MODULENAME} finished."

develop:
	@echo
	@echo "Installation for developpers of ${MODULENAME} finished."

docker-image-pull:
	docker pull bibi21000/janitoo
	@echo
	@echo "Docker image pulled."

docker-image-tests:
	docker build -t 'bibi21000/janitoo_tests' .
	@echo
	@echo "Tests for docker finished."

directories:
	-sudo mkdir /opt/janitoo
	-sudo chown -Rf ${USER}:${USER} /opt/janitoo
	-for dir in cache cache/janitoo_manager home log run etc init; do mkdir /opt/janitoo/$$dir; done

travis-deps: deps
	sudo apt-get -y install libevent-2.0-5 mosquitto
	pip install git+git://github.com/bibi21000/janitoo_nosetests@master
	pip install coveralls
	@echo
	@echo "Travis dependencies for ${MODULENAME} installed."

docker-tests:
	@echo
	@echo "Docker tests for ${MODULENAME} start."
	[ -f tests/test_docker.py ] && $(NOSE) $(NOSEOPTS) $(NOSEDOCKER) tests/test_docker.py
	@echo
	@echo "Docker tests for ${MODULENAME} finished."

docker-local-pull:
	@echo
	@echo "Pull local docker for ${MODULENAME}."
	docker pull bibi21000/${MODULENAME}
	@echo
	@echo "Docker local for ${MODULENAME} pulled."

docker-local-store: docker-local-pull
	@echo
	@echo "Create docker local store for ${MODULENAME}."
	docker create -v /root/.ssh/ -v /opt/janitoo/etc/ ${DOCKERVOLS} --name ${DOCKERNAME}_store bibi21000/${MODULENAME} /bin/true
	@echo
	@echo "Docker local store for ${MODULENAME} created."

docker-local-running: docker-local-pull
	@echo
	@echo "Update local docker for ${MODULENAME}."
	-docker stop ${DOCKERNAME}_running
	-docker rm ${DOCKERNAME}_running
	docker create --volumes-from ${DOCKERNAME}_store -p ${DOCKERPORT}:22 --name ${DOCKERNAME}_running bibi21000/${MODULENAME}
	docker ps -a|grep ${DOCKERNAME}_running
	docker start ${DOCKERNAME}_running
	docker ps|grep ${DOCKERNAME}_running
	@echo
	@echo "Docker local for ${MODULENAME} updated."

coveralls:
	export COVERALLS_REPO_TOKEN=${COVERALLS_REPO_TOKEN} && coveralls
	@echo
	@echo "Coverage published."

tests:
	-mkdir -p ${BUILDDIR}/docs/html/tools/coverage
	-mkdir -p ${BUILDDIR}/docs/html/tools/nosetests
	#~ export NOSESKIP=False && $(NOSE) $(NOSEOPTS) $(NOSECOVER) tests ; unset NOSESKIP
	$(NOSE) $(NOSEOPTS) $(NOSECOVER) tests
	@echo
	@echo "Tests for ${MODULENAME} finished."

certification:
	$(NOSE) --verbosity=2 --with-xunit --xunit-file=certification/result.xml certification
	@echo
	@echo "Certification for ${MODULENAME} finished."

build:
	${PYTHON_EXEC} setup.py build --build-base $(BUILDDIR)

egg:
	-mkdir -p $(BUILDDIR)
	-mkdir -p $(DISTDIR)
	${PYTHON_EXEC} setup.py bdist_egg --bdist-dir $(BUILDDIR) --dist-dir $(DISTDIR)

tar:
	-mkdir -p $(DISTDIR)
	tar cvjf $(DISTDIR)/${MODULENAME}-${janitoo_version}.tar.bz2 -h --exclude=\*.pyc --exclude=\*.egg-info --exclude=janidoc --exclude=.git* --exclude=$(BUILDDIR) --exclude=$(DISTDIR) --exclude=$(ARCHBASE) .
	@echo
	@echo "Archive for ${MODULENAME} version ${janitoo_version} created"

commit:
	-git add rst/
	-cp rst/README.rst .
	-git add README.rst
	git commit -m "$(message)" -a && git push
	@echo
	@echo "Commits for branch master pushed on github."

pull:
	git pull
	@echo
	@echo "Commits from branch master pulled from github."

status:
	git status

tag: check-tag commit
	git tag v${janitoo_version}
	git push origin v${janitoo_version}
	@echo
	@echo "Tag pushed on github."

check-tag:
ifneq ('${TAGGED}','0')
	echo "Already tagged with version ${janitoo_version}"
	@/bin/false
endif

new-version: tag clean tar
	@echo
	@echo "New version ${janitoo_version} created and published"

debch:
	dch --newversion ${janitoo_version} --maintmaint "Automatic release from upstream"

deb:
	dpkg-buildpackage
