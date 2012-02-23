all: geometric_tools

VERSION     = 5p7
TARBALL     = build/WildMagic$(VERSION).zip
TARBALL_URL = \
http://www.geometrictools.com/Downloads/WildMagic$(VERSION).zip
UNPACK_CMD  = unzip
SOURCE_DIR  = build/GeometricTools
TARBALL_PATCH =
MD5SUM_FILE = WildMagic$(VERSION).zip.md5sum

include $(shell rospack find mk)/download_unpack_build.mk

geometric_tools: $(SOURCE_DIR)/installed

$(SOURCE_DIR)/installed: $(SOURCE_DIR)/unpacked
	cd $(SOURCE_DIR)/WildMagic5	\
	&& CFG=ReleaseDLL make -f makefile.wm5
	touch $(SOURCE_DIR)/installed

clean:
	rm -rf $(SOURCE_DIR) $(INSTALL_DIR)

wipe: clean
	rm -rf build

.PHONY: geometric_tools
