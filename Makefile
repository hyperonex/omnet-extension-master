#
# OMNeT++/OMNEST Makefile for libomnetpp41extension
#
# This file was generated with the command:
#  opp_makemake -f --deep --make-so -o omnetpp41extension -O out -Xout -I/home/achraf/Development/omnetpp-4.1/include/platdep -I/home/achraf/Development/omnetpp-4.1/src/common -I/home/achraf/Development/omnetpp-4.1/src/envir
#

# Name of target to be created (-o option)
TARGET = libomnetpp41extension$(SHARED_LIB_SUFFIX)

# C++ include paths (with -I)
INCLUDE_PATH = \
    -I/home/achraf/Development/omnetpp-4.1/include/platdep \
    -I/home/achraf/Development/omnetpp-4.1/src/common \
    -I/home/achraf/Development/omnetpp-4.1/src/envir \
    -I. \
    -Iinclude \
    -Isrc \
    -Isrc/common \
    -Isrc/envir \
    -Isrc/sim \
    -Isrc/xmlio \
    -Isrc/xmlio/cs240utils \
    -Isrc/xmlio/cs240utils/include \
    -Isrc/xmlio/cs240utils/src

# Additional object and library files to link with
EXTRA_OBJS =

# Additional libraries (-L, -l options)
LIBS =

# Output directory
PROJECT_OUTPUT_DIR = out
PROJECTRELATIVE_PATH =
O = $(PROJECT_OUTPUT_DIR)/$(CONFIGNAME)/$(PROJECTRELATIVE_PATH)

# Object files for local .cc and .msg files
OBJS = \
    $O/src/common/stdstringutils.o \
    $O/src/common/simunits.o \
    $O/src/common/StringIntKey.o \
    $O/src/envir/dynamicresultrecorders.o \
    $O/src/envir/dynamicresultrecorder.o \
    $O/src/sim/cobserver.o \
    $O/src/sim/cmessageeventobserver.o \
    $O/src/xmlio/XMLScanner.o \
    $O/src/xmlio/XMLEntity.o \
    $O/src/xmlio/XMLToken.o \
    $O/src/xmlio/XMLWriter.o \
    $O/src/xmlio/XMLText.o \
    $O/src/xmlio/XMLTag.o \
    $O/src/xmlio/cs240utils/src/HTTPInputStream.o \
    $O/src/xmlio/cs240utils/src/StringUtil.o \
    $O/src/xmlio/cs240utils/src/CommandRunner.o \
    $O/src/xmlio/cs240utils/src/FileSystem.o \
    $O/src/xmlio/cs240utils/src/URLInputStream.o \
    $O/src/xmlio/cs240utils/src/FileInputStream.o

# Message files
MSGFILES =

#------------------------------------------------------------------------------

# Pull in OMNeT++ configuration (Makefile.inc or configuser.vc)

ifneq ("$(OMNETPP_CONFIGFILE)","")
CONFIGFILE = $(OMNETPP_CONFIGFILE)
else
ifneq ("$(OMNETPP_ROOT)","")
CONFIGFILE = $(OMNETPP_ROOT)/Makefile.inc
else
CONFIGFILE = $(shell opp_configfilepath)
endif
endif

ifeq ("$(wildcard $(CONFIGFILE))","")
$(error Config file '$(CONFIGFILE)' does not exist -- add the OMNeT++ bin directory to the path so that opp_configfilepath can be found, or set the OMNETPP_CONFIGFILE variable to point to Makefile.inc)
endif

include $(CONFIGFILE)

# Simulation kernel and user interface libraries
OMNETPP_LIB_SUBDIR = $(OMNETPP_LIB_DIR)/$(TOOLCHAIN_NAME)
OMNETPP_LIBS = -L"$(OMNETPP_LIB_SUBDIR)" -L"$(OMNETPP_LIB_DIR)" -loppenvir$D $(KERNEL_LIBS) $(SYS_LIBS)

COPTS = $(CFLAGS)  $(INCLUDE_PATH) -I$(OMNETPP_INCL_DIR)
MSGCOPTS = $(INCLUDE_PATH)

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target
all: $(TARGET)

$(TARGET) : $O/$(TARGET)
	$(LN) $O/$(TARGET) .

$O/$(TARGET): $(OBJS)  $(wildcard $(EXTRA_OBJS)) Makefile
	@$(MKPATH) $O
	$(SHLIB_LD) -o $O/$(TARGET)  $(OBJS) $(EXTRA_OBJS) $(LIBS) $(OMNETPP_LIBS) $(LDFLAGS)
	$(SHLIB_POSTPROCESS) $O/$(TARGET)

.PHONY:

.SUFFIXES: .cc

$O/%.o: %.cc
	@$(MKPATH) $(dir $@)
	$(CXX) -c $(COPTS) -o $@ $<

%_m.cc %_m.h: %.msg
	$(MSGC) -s _m.cc $(MSGCOPTS) $?

msgheaders: $(MSGFILES:.msg=_m.h)

clean:
	-rm -rf $O
	-rm -f omnetpp41extension omnetpp41extension.exe libomnetpp41extension.so libomnetpp41extension.a libomnetpp41extension.dll libomnetpp41extension.dylib
	-rm -f ./*_m.cc ./*_m.h
	-rm -f include/*_m.cc include/*_m.h
	-rm -f src/*_m.cc src/*_m.h
	-rm -f src/common/*_m.cc src/common/*_m.h
	-rm -f src/envir/*_m.cc src/envir/*_m.h
	-rm -f src/sim/*_m.cc src/sim/*_m.h
	-rm -f src/xmlio/*_m.cc src/xmlio/*_m.h
	-rm -f src/xmlio/cs240utils/*_m.cc src/xmlio/cs240utils/*_m.h
	-rm -f src/xmlio/cs240utils/include/*_m.cc src/xmlio/cs240utils/include/*_m.h
	-rm -f src/xmlio/cs240utils/src/*_m.cc src/xmlio/cs240utils/src/*_m.h

cleanall: clean
	-rm -rf $(PROJECT_OUTPUT_DIR)

depend:
	$(MAKEDEPEND) $(INCLUDE_PATH) -f Makefile -P\$$O/ -- $(MSG_CC_FILES)  ./*.cc include/*.cc src/*.cc src/common/*.cc src/envir/*.cc src/sim/*.cc src/xmlio/*.cc src/xmlio/cs240utils/*.cc src/xmlio/cs240utils/include/*.cc src/xmlio/cs240utils/src/*.cc

# DO NOT DELETE THIS LINE -- make depend depends on it.
$O/src/common/simunits.o: src/common/simunits.cc \
	include/simunits.h
$O/src/common/StringIntKey.o: src/common/StringIntKey.cc \
	src/common/StringIntKey.h
$O/src/common/stdstringutils.o: src/common/stdstringutils.cc \
	src/common/stdstringutils.h
$O/src/envir/dynamicresultrecorders.o: src/envir/dynamicresultrecorders.cc \
	src/envir/dynamicresultrecorder.h \
	include/simunits.h \
	include/EnforceSingleClassInstanceDefs.h \
	include/DebugDef.h \
	include/DeleteSafeDefs.h \
	include/omnetppextension.h \
	src/envir/dynamicresultrecorders.h
$O/src/envir/dynamicresultrecorder.o: src/envir/dynamicresultrecorder.cc \
	src/envir/dynamicresultrecorder.h \
	include/simunits.h \
	include/EnforceSingleClassInstanceDefs.h \
	include/DebugDef.h \
	include/DeleteSafeDefs.h \
	include/omnetppextension.h
$O/src/sim/cmessageeventobserver.o: src/sim/cmessageeventobserver.cc \
	include/simunits.h \
	src/sim/cobserver.h \
	include/EnforceSingleClassInstanceDefs.h \
	include/DebugDef.h \
	src/sim/cmessageeventobserver.h \
	include/DeleteSafeDefs.h \
	include/omnetppextension.h
$O/src/sim/cobserver.o: src/sim/cobserver.cc \
	include/simunits.h \
	src/sim/cobserver.h \
	include/EnforceSingleClassInstanceDefs.h \
	include/DebugDef.h \
	include/DeleteSafeDefs.h \
	include/omnetppextension.h
$O/src/xmlio/XMLScanner.o: src/xmlio/XMLScanner.cc \
	src/xmlio/cs240utils/include/CS240Exception.h \
	src/xmlio/XMLScanner.h \
	src/xmlio/XMLText.h \
	src/xmlio/XMLToken.h \
	src/xmlio/Debug.h \
	src/xmlio/XMLTokenType.h \
	src/xmlio/XMLEntity.h \
	src/xmlio/XMLTag.h \
	src/xmlio/cs240utils/include/UnitTest.h \
	src/xmlio/XMLConstants.h \
	src/xmlio/XMLTagType.h
$O/src/xmlio/XMLToken.o: src/xmlio/XMLToken.cc \
	src/xmlio/XMLToken.h \
	src/xmlio/Debug.h \
	src/xmlio/XMLTokenType.h \
	src/xmlio/cs240utils/include/UnitTest.h
$O/src/xmlio/XMLText.o: src/xmlio/XMLText.cc \
	src/xmlio/XMLText.h \
	src/xmlio/XMLToken.h \
	src/xmlio/Debug.h \
	src/xmlio/XMLTokenType.h \
	src/xmlio/cs240utils/include/UnitTest.h
$O/src/xmlio/XMLTag.o: src/xmlio/XMLTag.cc \
	src/xmlio/cs240utils/include/CS240Exception.h \
	src/xmlio/XMLToken.h \
	src/xmlio/Debug.h \
	src/xmlio/XMLTokenType.h \
	src/xmlio/XMLTag.h \
	src/xmlio/cs240utils/include/UnitTest.h \
	src/xmlio/XMLConstants.h \
	src/xmlio/XMLTagType.h
$O/src/xmlio/XMLEntity.o: src/xmlio/XMLEntity.cc \
	src/xmlio/XMLToken.h \
	src/xmlio/Debug.h \
	src/xmlio/XMLTokenType.h \
	src/xmlio/XMLEntity.h \
	src/xmlio/cs240utils/include/StringUtil.h \
	src/xmlio/cs240utils/include/UnitTest.h
$O/src/xmlio/XMLWriter.o: src/xmlio/XMLWriter.cc \
	src/xmlio/cs240utils/include/CS240Exception.h \
	src/xmlio/XMLText.h \
	src/xmlio/XMLToken.h \
	src/xmlio/Debug.h \
	src/xmlio/XMLEntity.h \
	src/xmlio/XMLTokenType.h \
	src/xmlio/XMLTag.h \
	src/xmlio/cs240utils/include/StringUtil.h \
	src/xmlio/cs240utils/include/UnitTest.h \
	src/xmlio/XMLConstants.h \
	src/xmlio/XMLTagType.h \
	src/xmlio/XMLWriter.h
$O/src/xmlio/cs240utils/src/FileSystem.o: src/xmlio/cs240utils/src/FileSystem.cc \
	src/xmlio/cs240utils/include/CS240Exception.h \
	src/xmlio/cs240utils/include/FileSystem.h \
	src/xmlio/cs240utils/include/UnitTest.h
$O/src/xmlio/cs240utils/src/FileInputStream.o: src/xmlio/cs240utils/src/FileInputStream.cc \
	src/xmlio/cs240utils/include/InputStream.h \
	src/xmlio/cs240utils/include/CS240Exception.h \
	src/xmlio/cs240utils/include/FileInputStream.h
$O/src/xmlio/cs240utils/src/URLInputStream.o: src/xmlio/cs240utils/src/URLInputStream.cc \
	src/xmlio/cs240utils/include/InputStream.h \
	src/xmlio/cs240utils/include/CS240Exception.h \
	src/xmlio/cs240utils/include/HTTPInputStream.h \
	src/xmlio/cs240utils/include/StringUtil.h \
	src/xmlio/cs240utils/include/URLInputStream.h \
	src/xmlio/cs240utils/include/FileInputStream.h
$O/src/xmlio/cs240utils/src/StringUtil.o: src/xmlio/cs240utils/src/StringUtil.cc \
	src/xmlio/cs240utils/include/StringUtil.h
$O/src/xmlio/cs240utils/src/HTTPInputStream.o: src/xmlio/cs240utils/src/HTTPInputStream.cc \
	src/xmlio/cs240utils/include/InputStream.h \
	src/xmlio/cs240utils/include/CS240Exception.h \
	src/xmlio/cs240utils/include/HTTPInputStream.h \
	src/xmlio/cs240utils/include/StringUtil.h
$O/src/xmlio/cs240utils/src/CommandRunner.o: src/xmlio/cs240utils/src/CommandRunner.cc \
	src/xmlio/cs240utils/include/CommandRunner.h \
	src/xmlio/cs240utils/include/CS240Exception.h \
	src/xmlio/cs240utils/include/StringUtil.h

