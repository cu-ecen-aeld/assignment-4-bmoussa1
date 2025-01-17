
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = cdc3bc65600290402cabd5030f99d5dbd4de8c28
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-bmoussa1.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Use a local source directory for faster rebuilds if specified
ifeq ($$(AESD_ASSIGNMENTS_OVERRIDE_SCRDIR),)
AESD_ASSIGNMENTS_SRCDIR = $(@D)
else
AESD_ASSIGNMENTS_SRCDIR = $$(AESD_ASSIGNMENTS_OVERRIDE_SCRDIR)
endif

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(AESD_ASSIGNMENTS_SRCDIR)finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(AESD_ASSIGNMENTS_SRCDIR)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(AESD_ASSIGNMENTS_SRCDIR)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(AESD_ASSIGNMENTS_SRCDIR)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(AESD_ASSIGNMENTS_SRCDIR)finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(AESD_ASSIGNMENTS_SRCDIR)finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(AESD_ASSIGNMENTS_SRCDIR)finder-app/writer $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
