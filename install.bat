@echo off

rem Use sh instead of bash to prevent calling Windows Subsystem for Linux bash, which comes first in PATH.
sh %~dp0\install.sh %*
