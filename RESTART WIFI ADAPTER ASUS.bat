@echo off
:: Automatically request Administrator access
:init
setlocal DisableDelayedExpansion
set cmdInvoke=1
set winSysFolder=%SystemRoot%\System32
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivences=%TEMP%\OEgetPriv_%batchName%.vbs"

:checkPrivileges
NET FILE 1>nul 2>nul
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%cmdInvoke%'=='1' ( echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivences%" && echo UAC.ShellExecute "cmd.exe", "/c ""%batchPath%"" %*", "", "runas", 1 >> "%vbsGetPrivences%" && "%vbsGetPrivences%" && exit /B )

:gotPrivileges
setlocal & pushd "%~dp0"
if exist "%vbsGetPrivences%" ( del "%vbsGetPrivences%" )

echo ==================================================================
echo ::   ____ _______        _       _    _       _     
echo ::  ^|  _ \__   __^|      ^| ^|     ^| ^|  ^| ^|     ^| ^|    
echo ::  ^| ^| ^| ^| ^| ^| ___  ___^| ^|__   ^| ^|__^| ^|_   _^| ^|__  
echo ::  ^| ^| ^| ^| ^| ^|/ _ \/ __^| '_ \  ^|  __  ^| ^| ^| ^| '_ \ 
echo ::  ^| ^|_^| ^| ^| ^|  __/ (__^| ^| ^| ^| ^| ^|  ^| ^| ^|_^| ^| ^|_) ^|
echo ::  ^|____/  ^|_^|\___^|\___^|_^| ^|_^| ^|_^|  ^|_^|\__,_^|_.__/ 
echo :: 
echo ::  MAIN PROCESS: QUALCOMM ATHEROS RESET TOOL
echo ::  PROJECT BY: DTech Hub
echo ================================================================== 
echo.
echo ==================================================================
echo FORCING HARDWARE RESET: QUALCOMM ATHEROS...
echo ==================================================================
echo.

echo [1/2] Forcefully disabling Qualcomm Driver...
powershell -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName '*Qualcomm Atheros*' | Disable-PnpDevice -Confirm:$false"
timeout /t 2 >nul

echo [2/2] Re-enabling Qualcomm Driver...
powershell -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName '*Qualcomm Atheros*' | Enable-PnpDevice -Confirm:$false"
timeout /t 2 >nul

echo.
echo Success! The yellow exclamation mark should be resolved. Please check your Wi-Fi connection. 
If the issue persists, run this program again.
echo.
echo Menutup jendela dalam 5 detik...
timeout /t 5
exit
