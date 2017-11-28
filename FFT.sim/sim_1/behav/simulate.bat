@echo off
set xv_path=E:\\Softwares\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xsim TOP_behav -key {Behavioral:sim_1:Functional:TOP} -tclbatch TOP.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
