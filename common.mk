#
# Common stuff - packages, flags and configs for QC devices
#

# Default board flags for QC devices
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_HAS_QC_KERNEL_SOURCE := true
BOARD_USES_ADRENO := true
BOARD_USES_QCNE := true

# Enable media extensions
TARGET_USES_MEDIA_EXTENSIONS := true

# Allow building audio encoders
TARGET_USES_QCOM_MM_AUDIO := true

# SECCOMP Extension
BOARD_SECCOMP_POLICY += device/qcom/common/seccomp

# video seccomp policy files
PRODUCT_COPY_FILES += \
    device/qcom/common/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    device/qcom/common/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Advanced DPM
ifeq ($(TARGET_WANTS_EXTENDED_DPM_PLATFORM),true)
PRODUCT_BOOT_JARS += tcmclient
PRODUCT_BOOT_JARS += com.qti.dpmframework
PRODUCT_BOOT_JARS += dpmapi
PRODUCT_BOOT_JARS += com.qti.location.sdk
endif

# QCOM HW crypto
ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
    TARGET_CRYPTFS_HW_PATH ?= vendor/qcom/opensource/cryptfs_hw
endif
