# MKW Switch — public build entry point.
# The port cannot be built from this repository alone (see docs/BUILDING.md). A full build needs
# the private runtime core checked out next to this repository (or MKW_CORE=<path>) and the code
# generated from your own copy of the game, which the core's build produces locally.
MKW_CORE ?= ../mkw-core
MKW_CORE_MK := $(MKW_CORE)/build/mkw_core.mk

ifeq ($(wildcard $(MKW_CORE_MK)),)
$(error MKW Switch private core not found: '$(MKW_CORE_MK)' does not exist. This public repository contains documentation only and cannot build the port; see docs/BUILDING.md)
endif

include $(MKW_CORE_MK)
