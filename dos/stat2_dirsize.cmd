:: 
:: DESC: ͳ�ƴμ�Ŀ¼�µ��ļ��������ܴ�С
:: NOTE: ��������������пո���Ҫ������չ������ȥ����

@ECHO OFF

:: IF [%1]==[] GOTO USAGE
:: if NOT exist "%1" (
:: ECHO "dirfile" path not exist & GOTO END
:: )

SET dirfile="F:\movie\��Ӱָ��.Viewing_Guide\AV_Guide\playbill����(AV)\�ձ�"
IF NOT [%1]==[] (
	SET dirfile=%1
)
ECHO [1]START...
:DIR_PATH
:: CD /D %dirfile%
DIR /ad /b %1 > 1.txt

SETlocal enabledelayedexpansion
SET fa=
:: FOR������չ��usebackq��tokens=*��delims=��tokens������ FOR, %%i���õڶ������ţ�%%j���õ��������ţ�%%k���õ��������ź������ʣ����š�
:: ȫ·��Ҫȥ����
	ECHO [2]START...
FOR /f "usebackq tokens=*" %%i IN (d:\project\1.txt) DO (
	REM ECHO [2-]DEBUG...
	REM SET fa=!dirfile:"=!\%%i
	REM ECHO [2-1]"!fa!"
	REM ECHO [2-2]"%~1\%%i"
	REM NOTE-BOTH OK~ "!dirfile!\%%i", "!fa!", "%~1\%%i"
	DIR /s  "!dirfile!\%%i" |findstr ���ļ� > 2.txt || ECHO. > 2.txt
	REM FOR /f "eol=0 tokens=1,3 " %%j in (2.txt) DO SET ll=%%k �ֽ� %dirfile%\%%i  %%j ���ļ� 
	FOR /f "eol=0 tokens=1,3 " %%j in (2.txt) DO SET ll=%%k & SET ll=!ll:~0,-9! MB %%i  %%j ���ļ� 
	ECHO  !ll!  
)
ECHO [3]END
CD /D "D:\PROJECT"

Endlocal

:CLEAN
DEL 1.txt 
DEL 2.txt
GOTO END

:USAGE
ECHO Usage: %0 dir_path
GOTO   END 

:END
:: PAUSE
