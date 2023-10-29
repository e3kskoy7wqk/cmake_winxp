@echo off
set VSCMD_START_DIR=.
call "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars32.bat"
lib /machine:"x86" %*
