@echo off

rem Requires MinGW-W64 based on GCC 8.1 or later

setlocal ENABLEDELAYEDEXPANSION

set echo_stat=on

set GCC_FOLDER_NAME=mingw64

set CurDir=%CD%
set CurDir2=%CurDir:\=/%

set PATH=%CD%\%GCC_FOLDER_NAME%\bin;%PATH%

rem Compile
@echo %echo_stat%
FOR %%f IN ("%CurDir2%/*.c") DO "%GCC_FOLDER_NAME%\bin\gcc.exe" -ffreestanding -march=skylake -mavx2 -fno-stack-protector -fno-stack-check -fno-strict-aliasing -fno-merge-all-constants -mno-stack-arg-probe -m64 -mno-red-zone -maccumulate-outgoing-args --std=gnu11 -O3 -g3 -Wall -Wextra -Wdouble-promotion -Wpedantic -fmessage-length=0 -ffunction-sections -c -MMD -MP -Wa,-adhln="%CurDir2%/%%~nf.out" -MF"%CurDir2%/%%~nf.d" -MT"%CurDir2%/%%~nf.o" -o "%CurDir2%/%%~nf.o" "%CurDir2%/%%~nf.c"
@echo off

rem Link
"%GCC_FOLDER_NAME%\bin\gcc.exe" -march=skylake -mavx2 -s -nostdlib -Wl,-Map=output.map -Wl,--gc-sections -o "Output.exe" memmove.o memcpy.o memset.o memcmp.o rem (Your file here, and remove the "rem" after memcmp.o).o

endlocal
