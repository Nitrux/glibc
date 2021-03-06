# configuration options for all flavours
extra_config_options = --enable-multi-arch

# multilib flavours
ifeq (,$(filter nobiarch, $(DEB_BUILD_PROFILES)))

# build hard-float (armhf) alternative library
#GLIBC_PASSES += armhf
#DEB_ARCH_MULTILIB_PACKAGES += libc6-armhf libc6-dev-armhf
#armhf_configure_target = arm-linux-gnueabihf
#armhf_CC = $(CC) -march=armv7-a -mfpu=vfpv3-d16 -mfloat-abi=hard
#armhf_CXX = $(CXX) -march=armv7-a -mfpu=vfpv3-d16 -mfloat-abi=hard
#armhf_slibdir = /lib/arm-linux-gnueabihf
#armhf_libdir = /usr/lib/arm-linux-gnueabihf
#
#define libc6-dev-armhf_extra_pkg_install
#
#$(call generic_multilib_extra_pkg_install,libc6-dev-armhf)
#
#mkdir -p debian/libc6-dev-armhf/usr/include/arm-linux-gnueabi/gnu
#cp -a debian/tmp-armhf/usr/include/gnu/lib-names-hard.h \
#	debian/tmp-armhf/usr/include/gnu/stubs-hard.h \
#	debian/libc6-dev-armhf/usr/include/arm-linux-gnueabi/gnu
#
#endef
#
#define libc6-armhf_extra_pkg_install
#mkdir -p debian/libc6-armhf$(armhf_slibdir)
#ln -sf ld-linux-armhf.so.3 debian/libc6-armhf$(armhf_slibdir)/ld-linux.so.3 
#endef

endif # multilib
