:: Installer for Tiny Webcasts for the Windows platform.
::
:: This installer is relying on docker being installed on the system.
:: 
:: The installer builds the docker image and afterwards copies the 
:: "run.bat" file from the "./docker" subdirectory to %SYSTEMROOT%,
:: therefore asking for administrator rights, as %SYSTEMROOT% is
:: usually only writable by administrators.
::
:: Installing the program in %SYSTEMROOT% is clearly not the best
:: option, but circumvents messing with the %PATH% variable.

@echo off
:: SETLOCAL

:: Name of the executable
set targetFile=twc.bat

set commandLineParameter=%1

if "%commandLineParameter%"=="" (
    call :greetingMessage
    call :waitForUser

    set "MISSING_REQUIREMENTS=false"

    call :checkRequirement docker Docker https://docs.docker.com/docker-for-windows/install/

    IF "%MISSING_REQUIREMENTS%"=="true" (
      pause
      exit /b
    )

    call :createDockerImage

    call :checkAdmin
)

pushd "%CD%"
CD /D "%~dp0"

call :copyExecutable

if "%commandLineParameter%"=="" (
    call :finalMessage
    echo.
    pause
)

exit /b %ERRORLEVEL%

:: --------------------------------------------------------------------------
:: END OF MAIN SCRIPT --- BELOW ARE "FUNCTIONS"
:: --------------------------------------------------------------------------

:greetingMessage

    echo.
    echo Welcome to the installer for
    echo.
    echo     "Tiny Webcasts for Lecture(r)s
    echo.
    echo This installer will perform the following steps:
    echo.
    echo   1) Check for necessary dependencies
    echo.
    echo   2) Build the docker image
    echo.
    echo   3) Install the command "twc" to %SYSTEMROOT%.
    echo.

    exit /B


:waitForUser

    IF "%WE_ARE_ADMIN%"=="" (
        pause
    )

    exit /B


:checkAdmin

    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

    if '%errorlevel%' NEQ '0' (
        echo.
        echo Requesting Admin access...
        echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
        set params = %*:"=""
        echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params% admin", "", "runas", 1 >> "%temp%\getadmin.vbs"
        "%temp%\getadmin.vbs"
        del "%temp%\getadmin.vbs"
    )

    set "WE_ARE_ADMIN=true"

    exit /B


:checkRequirement
    :: Ensure that the system has a specific program installed on the PATH.
    set "MISSING_REQUIREMENT=true"
    where %1 > NUL 2>&1 && set "MISSING_REQUIREMENT=false"

    IF "%MISSING_REQUIREMENT%"=="true" (
        echo Program "%2" could not be found on your system.
        echo.
        echo Please download and install %2 from %3.
        echo Afterwards, run this installer again.
        set "MISSING_REQUIREMENTS=true"
    ) else (
        echo Found "%2".
    )

    exit /b


:checkInstalled
    :: Ensure that the twc is installed on the path

    IF "%SUCCESSFULLY_INSTALLED%"=="true" (
        echo.
        echo Tiny Webcasts have been installed successfully on your system
        echo You may now create tiny webcasts by calling '%targetFile%' from anyhwere.
    ) else (
        echo.
        echo Tiny Webcasts could not be installed successfully on your system
        echo in a globally accessible fashion. Did you deny authorisation?
    )

    exit /b


:createDockerImage

    :: Build docker
    cd ../docker/
    call build.bat
 
    :: Change back to original directory
    cd ../webcasts/

    exit /b 0


:copyExecutable

    set "SUCCESSFULLY_INSTALLED"="false"
    >nul 2>&1 copy ..\docker\run.bat %SYSTEMROOT%\%targetFile%

    exit /b

:finalMessage

    echo.
    echo Tiny Webcasts should have been installed successfully on your system
    echo You may now create tiny webcasts by typing 'twc' into a command line
    echo from any directory.

    exit /b
