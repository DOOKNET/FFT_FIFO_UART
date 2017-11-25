-makelib ies/xil_defaultlib -sv \
  "E:/Softwares/Vivado/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Softwares/Vivado/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "E:/Softwares/Vivado/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../Design/IP_Core/PLL/PLL/PLL_clk_wiz.v" \
  "../../../../Design/IP_Core/PLL/PLL/PLL.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

