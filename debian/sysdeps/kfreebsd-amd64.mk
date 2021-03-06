# build 32-bit (i386) alternative library
GLIBC_PASSES += i386

# multilib flavours
ifeq (,$(filter nobiarch, $(DEB_BUILD_PROFILES)))

DEB_ARCH_MULTILIB_PACKAGES += libc0.1-i386 libc0.1-dev-i386
libc0.1-i386_shlib_dep = libc0.1-i386 (>= $(shlib_dep_ver))

i386_add-ons = $(libc_add-ons)
i386_configure_target = i686-kfreebsd-gnu
i386_CC = $(CC) -m32 -march=pentium4 -mtune=generic
i386_CXX = $(CXX) -m32 -march=pentium4 -mtune=generic
i386_slibdir = /lib32
i386_libdir = /usr/lib32

define libc0.1-dev-i386_extra_pkg_install

$(call generic_multilib_extra_pkg_install,libc0.1-dev-i386)

mkdir -p debian/libc0.1-dev-i386/usr/include/x86_64-kfreebsd-gnu/gnu
cp -a debian/tmp-i386/usr/include/gnu/lib-names-32.h \
	debian/tmp-i386/usr/include/gnu/stubs-32.h \
	debian/libc0.1-dev-i386/usr/include/x86_64-kfreebsd-gnu/gnu

cp -a debian/tmp-i386/usr/include/sys/vm86.h \
        debian/libc0.1-dev-i386/usr/include/sys

endef

endif # multilib
