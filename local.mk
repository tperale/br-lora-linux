do_override = $(1)_OVERRIDE_SRCDIR = $$(BR2_EXTERNAL_LINUX_LORA_PATH)/src/$(2)
$(foreach override,$(notdir $(wildcard $(call qstrip,$(BR2_EXTERNAL_LINUX_LORA_PATH))/src/*)),\
	$(eval $(call do_override,$(call UPPERCASE,$(override)),$(override))))
