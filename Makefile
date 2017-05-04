EXCLUDE		:= .DS_Store .git .gitmodules
CANDIDATES	:= $(wildcard .??*)
DOTFILES	:= $(filter-out $(EXCLUDE), $(CANDIDATES))
DOTPATH		:= $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

all: install

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init/init.sh

install: deploy init
