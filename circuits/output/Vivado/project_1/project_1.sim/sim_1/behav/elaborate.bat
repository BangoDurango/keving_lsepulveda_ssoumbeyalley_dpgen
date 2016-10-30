@echo off
set xv_path=E:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 9d0ae954dbe94210ac048cf8a83e0d5c -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot circuit4_behav xil_defaultlib.circuit4 xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
