#######################################################################################
.PHONY: help
help:
	@echo "Makefile Usage:"
	@echo ""
	@echo "  make all"
	@echo "      Command to build client, encoder and decoder."
	@echo ""
	@echo "  make clent"
	@echo "      Command to build client."
	@echo ""
	@echo "  make encoder "
	@echo "      Command to build encoder."
	@echo ""
	@echo "  make decoder "
	@echo "      Command to build decoder."
	@echo ""
	@echo "  make clean "
	@echo "      Command to remove the generated files."
	@echo ""
#######################################################################################

# compiler tools
#XILINX_VITIS ?= /media/lilbirb/research/Xilinx/Vitis/2020.2
#XILINX_VIVADO ?= /media/lilbirb/research/Xilinx/Vivado/2020.2
#XILINX_VIVADO_HLS ?= $(XILINX_VITIS)/Vivado_HLS

HOST_CXX ?= aarch64-linux-gnu-g++
VPP ?= ${XILINX_VITIS}/bin/v++
RM = rm -f
RMDIR = rm -rf

#PLATFORM_REPO_PATHS= /home/hans/Desktop/u96v2_sbc_base
VITIS_PLATFORM = u96v2_sbc_base
VITIS_PLATFORM_DIR = ${PLATFORM_REPO_PATHS}
VITIS_PLATFORM_PATH = $(VITIS_PLATFORM_DIR)/u96v2_sbc_base.xpfm

# host compiler global settings
CXXFLAGS += -march=armv8-a+simd+crypto -mtune=cortex-a53 -fno-tree-vectorize -std=c++11  -DVITIS_PLATFORM=$(VITIS_PLATFORM) -D__USE_XOPEN2K8 -I$(XILINX_VIVADO)/include/ -I include/ -I$(VITIS_PLATFORM_DIR)/sw/u96v2_sbc_base/PetaLinux/sysroot/aarch64-xilinx-linux/usr/include/xrt/ -O3 -g -Wall -c -DNDEBUG -pthread -fmessage-length=0 --sysroot=$(VITIS_PLATFORM_DIR)/sw/u96v2_sbc_base/PetaLinux/sysroot/aarch64-xilinx-linux
LDFLAGS += -lxilinxopencl -lwolfssl -lpthread -pthread -lrt -ldl -lcrypt -lstdc++ -L lib/ -L$(VITIS_PLATFORM_DIR)/sw/u96v2_sbc_base/PetaLinux/sysroot/aarch64-xilinx-linux/usr/lib/ --sysroot=$(VITIS_PLATFORM_DIR)/sw/u96v2_sbc_base/PetaLinux/sysroot/aarch64-xilinx-linux

# hardware compiler shared settings
VPP_OPTS = --target hw


#OpenCL kernel files

 XO := encoder.xo
 XCLBIN := encoder.xclbin
 ALL_MESSAGE_FILES = $(subst .xo,.mdb,$(XO)) $(subst .xclbin,.mdb,$(XCLBIN))

#
# host files
#
CLIENT_SOURCES = Client/client.cpp
CLIENT_EXE = client

SERVER_SOURCES = Server/encoder.cpp ./common/EventTimer.cpp ./common/Utilities.cpp Server/server.cpp Server/cdc.cpp Server/match.cpp  Server/SHA.cpp Server/sizing.cpp Server/lzw_test.cpp Server/lzw_sw.cpp  
SERVER_OBJECTS =$(SERVER_SOURCES:.cpp=.o)
SERVER_EXE = encoder

DECODER_SOURCES = Decoder/Decoder.cpp
DECODER_OBJECTS =$(DECODER_SOURCES:.cpp=.o)
DECODER_EXE = decoder

# CPU_SOURCES = cpu/Host.cpp ../../common/EventTimer.cpp ../../common/Utilities.cpp
# CPU_OBJECTS=$(CPU_SOURCES:.cpp=.o)
# CPU_EXE = mmult_cpu

# .PHONY: cpu
# cpu: $(CPU_EXE)

# $(CPU_EXE): $(CPU_OBJECTS)
# 	$(HOST_CXX) -I./fpga/hls/ -o "$@" $(+) $(LDFLAGS)
all: $(CLIENT_EXE) $(SERVER_EXE) $(DECODER_EXE)

$(CLIENT_EXE):
	g++ -O3 $(CLIENT_SOURCES) -o "$@"

$(SERVER_EXE): $(SERVER_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)
#	-@echo $(VPP) --package --config fpga/package.cfg --package.kernel_image $(PLATFORM_REPO_PATHS)/sw/ese532_hw6_pfm/linux_domain/image/image.ub --package.rootfs $(PLATFORM_REPO_PATHS)/sw/ese532_hw6_pfm/linux_domain/rootfs/rootfs.ext4 $(XCLBIN)
#	-@$(VPP) --package --config fpga/package.cfg --package.sd_file "$@" --package.kernel_image $(PLATFORM_REPO_PATHS)/sw/ese532_hw6_pfm/linux_domain/image/image.ub --package.rootfs $(PLATFORM_REPO_PATHS)/sw/ese532_hw6_pfm/linux_domain/rootfs/rootfs.ext4 $(XCLBIN)

$(DECODER_EXE): $(DECODER_OBJECTS)
	$(HOST_CXX) -o "$@" $(+) $(LDFLAGS)

.cpp.o:
	$(HOST_CXX) $(CXXFLAGS) -I./server -I./common -o "$@" "$<"

#
# primary build targets
#

# .PHONY: fpga clean
fpga: package/sd_card.img

.NOTPARALLEL: clean

#clean:
#	-$(RM) $(SERVER_EXE) $(SERVER_OBJECTS) $(DECODER_EXE) $(DECODER_OBJECTS) $(CLIENT_EXE) 
#	-$(RM) *.log *.package_summary
#	-${RMDIR} _x .ipcache

# clean-cpu:
# 	-$(RM) $(CPU_EXE) $(CPU_OBJECTS) 

clean-host:
	-$(RM) $(SERVER_EXE) $(SERVER_OBJECTS) 

clean-accelerators:
	-$(RM) $(XCLBIN) $(ALL_MESSAGE_FILES)
	-$(RM) *.xclbin.sh *.xclbin.info *.xclbin.link_summary* *.compile_summary
	-$(RMDIR) .Xil fpga/hls/proj_mmult

clean-package:
	-${RMDIR} package
	-${RMDIR} package.build

clean:  clean-accelerators clean-package
	-$(RM) $(SERVER_EXE) $(SERVER_OBJECTS) $(DECODER_EXE) $(DECODER_OBJECTS) $(CLIENT_EXE) 
	-$(RM) *.log *.package_summary
	-${RMDIR} _x .ipcache

#
# binary container: kernel.xclbin
#

#$(XO): Server/LZW.cpp
#	-@$(RM) $@
#	$(VPP) $(VPP_OPTS) -k encoder --compile -I"$(<D)" --config fpga/design.cfg -o"$@" "$<"

$(XCLBIN): $(XO)
	$(VPP) $(VPP_OPTS) --link --config fpga/design.cfg -o"$@" $(+)
package/sd_card.img: $(SERVER_EXE) $(XCLBIN) ./fpga/xrt.ini
	$(VPP) --package $(VPP_OPTS) --config fpga/package.cfg $(XCLBIN) \
		--package.out_dir package \
		--package.sd_file $(SERVER_EXE) \
		--package.kernel_image $(PLATFORM_REPO_PATHS)/sw/$(VITIS_PLATFORM)/PetaLinux/image/image.ub \
		--package.rootfs $(PLATFORM_REPO_PATHS)/sw/$(VITIS_PLATFORM)/PetaLinux/rootfs/rootfs.ext4 \
		--package.sd_file $(XCLBIN) \
		--package.sd_file ./fpga/xrt.ini

