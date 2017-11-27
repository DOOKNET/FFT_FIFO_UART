set_property IOSTANDARD LVTTL [get_ports {AD[13]}]
set_property IOSTANDARD LVTTL [get_ports {AD[12]}]
set_property IOSTANDARD LVTTL [get_ports {AD[11]}]
set_property IOSTANDARD LVTTL [get_ports {AD[10]}]
set_property IOSTANDARD LVTTL [get_ports {AD[9]}]
set_property IOSTANDARD LVTTL [get_ports {AD[8]}]
set_property IOSTANDARD LVTTL [get_ports {AD[7]}]
set_property IOSTANDARD LVTTL [get_ports {AD[6]}]
set_property IOSTANDARD LVTTL [get_ports {AD[5]}]
set_property IOSTANDARD LVTTL [get_ports {AD[4]}]
set_property IOSTANDARD LVTTL [get_ports {AD[3]}]
set_property IOSTANDARD LVTTL [get_ports {AD[2]}]
set_property IOSTANDARD LVTTL [get_ports {AD[1]}]
set_property IOSTANDARD LVTTL [get_ports {AD[0]}]
set_property IOSTANDARD LVTTL [get_ports ad_clk]
set_property IOSTANDARD LVTTL [get_ports clk]
set_property IOSTANDARD LVTTL [get_ports DRY]
set_property IOSTANDARD LVTTL [get_ports ovr_in]
set_property IOSTANDARD LVTTL [get_ports rx_ready]
set_property IOSTANDARD LVTTL [get_ports tx]
set_property IOSTANDARD LVTTL [get_ports tx_ready]
set_property PACKAGE_PIN F3 [get_ports ad_clk]
set_property PACKAGE_PIN F4 [get_ports DRY]
set_property PACKAGE_PIN M4 [get_ports ovr_in]
set_property PACKAGE_PIN A7 [get_ports rx_ready]
set_property PACKAGE_PIN B6 [get_ports tx]
set_property PACKAGE_PIN B7 [get_ports tx_ready]
set_property PACKAGE_PIN L4 [get_ports {AD[0]}]
set_property PACKAGE_PIN K3 [get_ports {AD[1]}]
set_property PACKAGE_PIN J3 [get_ports {AD[2]}]
set_property PACKAGE_PIN H3 [get_ports {AD[3]}]
set_property PACKAGE_PIN H4 [get_ports {AD[4]}]
set_property PACKAGE_PIN H5 [get_ports {AD[5]}]
set_property PACKAGE_PIN L2 [get_ports {AD[6]}]
set_property PACKAGE_PIN L3 [get_ports {AD[7]}]
set_property PACKAGE_PIN J1 [get_ports {AD[8]}]
set_property PACKAGE_PIN K1 [get_ports {AD[9]}]
set_property PACKAGE_PIN H1 [get_ports {AD[10]}]
set_property PACKAGE_PIN H2 [get_ports {AD[11]}]
set_property PACKAGE_PIN G1 [get_ports {AD[12]}]
set_property PACKAGE_PIN G2 [get_ports {AD[13]}]
set_property PACKAGE_PIN N11 [get_ports clk]

connect_debug_port u_ila_0/probe0 [get_nets [list {AD_inst1/ad_reg2[0]} {AD_inst1/ad_reg2[1]} {AD_inst1/ad_reg2[2]} {AD_inst1/ad_reg2[3]} {AD_inst1/ad_reg2[4]} {AD_inst1/ad_reg2[5]} {AD_inst1/ad_reg2[6]} {AD_inst1/ad_reg2[7]} {AD_inst1/ad_reg2[8]} {AD_inst1/ad_reg2[9]} {AD_inst1/ad_reg2[10]} {AD_inst1/ad_reg2[11]} {AD_inst1/ad_reg2[12]} {AD_inst1/ad_reg2[13]}]]
connect_debug_port dbg_hub/clk [get_nets ad_clk_OBUF]


set_property MARK_DEBUG true [get_nets clk_100]
connect_debug_port u_ila_0/probe1 [get_nets [list clk_100]]
connect_debug_port dbg_hub/clk [get_nets clk_100]

