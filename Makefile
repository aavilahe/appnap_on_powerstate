# Install appnap_on_powerstate.sh and corresponding launchAgent
#
# Author: Aram Avila-Herrera
# Date: July 27, 2015
# License: See LICENSE
#
# Usage:
#   make install  # install the bin and launchAgent
#   make install INSTALL_DIR="path/to/local/bin"  # specify install directory
#   make activate  # start the launchAgent
#
#   make uninstall  # uninstall

INSTALL_DIR ?= $(HOME)/bin
LAUNCHAGENT_DIR = $(HOME)/Library/LaunchAgents
plist = local.appnap_on_powerstate.plist
plist_gen = make_appnap_plist.sh
appnap_sh = appnap_on_powerstate.sh

plist: $(plist)

$(plist): $(plist_gen)
	./$(plist_gen) $(INSTALL_DIR) > $(plist)

install: $(appnap_sh) plist
	mkdir -p $(INSTALL_DIR)
	cp $(appnap_sh) $(INSTALL_DIR)/
	cp $(plist) $(LAUNCHAGENT_DIR)/

activate: $(LAUNCHAGENT_DIR)/$(plist)
	launchctl load $(LAUNCHAGENT_DIR)/$(plist)

uninstall: $(shell launchctl list -x appnap_on_powerstate | xmllint --xpath "/plist/dict/key[.='ProgramArguments']/following-sibling::array/string[1]/text()" -)
	- launchctl stop $(plist:.plist=)
	- launchctl remove $(plist:.plist=)
	- launchctl unload $(LAUNCHAGENT_DIR)/$(plist)
	- rm $(LAUNCHAGENT_DIR)/$(plist)
	- rm $<

