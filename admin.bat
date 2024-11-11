@echo off
REM Script to check for admin rights and save the result as a hidden .conf file on USB

REM Check if the current user has administrative rights
echo Checking for administrative rights...

REM Test if the current user can access a restricted directory (System32)
cd %windir%\system32

REM Create a temporary test file and immediately delete it to check for admin rights
echo > admin_test.tmp 2>nul

IF EXIST admin_test.tmp (
    REM Admin rights confirmed
    echo You have administrative rights.

    REM Delete the test file after confirming admin rights
    del admin_test.tmp

    REM Create a .conf file on the USB drive without a name prefix
    echo Admin rights: Yes > "%USB_DRIVE%\conf"
    echo %date% %time% >> "%USB_DRIVE%\conf"

    REM Make the .conf file hidden
    attrib +h "%USB_DRIVE%\conf"

    echo Admin rights confirmed and saved to hidden file %USB_DRIVE%\conf

) ELSE (
    REM No admin rights
    echo You do NOT have administrative rights.

    REM Create a .conf file on the USB drive without a name prefix
    echo Admin rights: No > "%USB_DRIVE%\conf"
    echo %date% %time% >> "%USB_DRIVE%\conf"

    REM Make the .conf file hidden
    attrib +h "%USB_DRIVE%\conf"

    echo Admin rights not confirmed and saved to hidden file %USB_DRIVE%\conf
)
exit
