################################################################################
#
# LoRa-TX
#
################################################################################

LORA_TX_VERSION = 1.0
LORA_TX_SITE = $(BR2_EXTERNAL_LINUX_LORA_PATH)/src/lora-tx
LORA_TX_SITE_METHOD = local
LORA_TX_LICENSE = GPL-2.0
LORA_TX_DEPENDENCIES = \
	linux

LORA_TX_MAKE_OPTS = \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	ARCH="$(KERNEL_ARCH)" \
	KDIR="$(LINUX_DIR)"

define LORA_TX_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(LORA_TX_MAKE_OPTS) -C $(@D) all
endef

define LORA_TX_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/lora-tx $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
