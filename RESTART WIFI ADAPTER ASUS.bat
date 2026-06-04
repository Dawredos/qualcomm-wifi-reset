@echo off
:: Otomatis minta akses Administrator
:init
setlocal DisableDelayedExpansion
set cmdInvoke=1
set winSysFolder=%SystemRoot%\System32
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivences=%TEMP%\OEgetPriv_%batchName%.vbs"
outputAppLong>nul 2>&1
:checkPrivileges
NET FILE 1>%nul 2>%nul
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%cmdInvoke%'=='1' ( echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivences%" && echo UAC.ShellExecute "cmd.exe", "/c ""%batchPath%"" %*", "", "runas", 1 >> "%vbsGetPrivences%" && "%vbsGetPrivences%" && exit /B )
:gotPrivileges
setlocal & pushd "%~dp0"
if exist "%vbsGetPrivences%" ( del "%vbsGetPrivences%" )

:: =============================================================
:: PROSES UTAMA: FORCE DISABLE & ENABLE QUALCOMM ATHEROS (ASUS WIFI ADAPTER)
:: =============================================================
echo ===================================================
echo     MEMAKSA RESET HARDWARE QUALCOMM ATHEROS...
echo ===================================================
echo.

echo [1/2] Mematikan paksa Driver Qualcomm (Disable)...
powershell -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName '*Qualcomm Atheros*' | Disable-PnpDevice -Confirm:$false"
timeout /t 2 >nul

echo [2/2] Menghidupkan kembali Driver Qualcomm (Enable)...
powershell -ExecutionPolicy Bypass -Command "Get-PnpDevice -FriendlyName '*Qualcomm Atheros*' | Enable-PnpDevice -Confirm:$false"
timeout /t 2 >nul

echo.
echo Selesai! Tanda kuning harusnya sudah hilang. Cek Wi-Fi, Jika belum bisa ulang kembali jalankan program ini!
timeout /t 3 >nul
exit