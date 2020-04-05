@echo off
:: Name of the executable
set targetFile=twc.bat

:: Create directory for local binaries in user home
mkdir %HOMEPATH%\bin\

:: Copy executable to local bin dir
copy ..\docker\run.bat %HOMEPATH%\bin\%targetFile%

:: Build docker
cd ../docker/
call build.bat

:: Change back to original directory
cd ../webcasts/

path %PATH%;%HOMEPATH%\bin
setx path "%PATH%;%HOMEPATH%\bin"
echo.
echo Add %HOMEPATH%\bin to your PATH variable

echo.
echo Installing '%targetFile%' script to %HOMEPATH%/bin/ was successful.
echo You may now create tiny webcasts by calling '%targetFile%' from anyhwere.
