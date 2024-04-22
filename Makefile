export BR2_EXTERNAL := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BR2_EXTERNAL_LINUX_LORA_PATH = $(BR2_EXTERNAL)

BR2_DL_DIR = $(BR2_EXTERNAL_LINUX_LORA_PATH)/dl
export BR2_DL_DIR

OUTPUT_BASEDIR = $(BR2_EXTERNAL_LINUX_LORA_PATH)/output

CONFIGS = $(patsubst %_defconfig,%,$(notdir $(wildcard $(BR2_EXTERNAL_LINUX_LORA_PATH)/configs/*_defconfig)))

MAKE_BUILDROOT = $(MAKE) -C $(BR2_EXTERNAL_LINUX_LORA_PATH)/buildroot O=$(OUTPUT_BASEDIR)/$(CONFIG)

-include $(OUTPUT_BASEDIR)/currentconfig

# Build an existing configuration
.PHONY: $(CONFIGS)
$(CONFIGS): CONFIG=$*
$(CONFIGS): %: $(BR2_EXTERNAL_LINUX_LORA_PATH)/configs/%_defconfig
	@mkdir -p $(OUTPUT_BASEDIR)
	$(MAKE_BUILDROOT) $(CONFIG)_defconfig
	@echo "CONFIG ?= $(CONFIG)" > $(OUTPUT_BASEDIR)/currentconfig
	$(MAKE_BUILDROOT)

# Anything else is passed on to buildroot
all := $(filter-out $(CONFIGS) $(new_targets) $(REAL_TARGETS),$(MAKECMDGOALS))

.PHONY: $(all)
$(all):
	$(MAKE_BUILDROOT) $(all)
