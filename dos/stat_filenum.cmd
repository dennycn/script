:: 
:: DESC: ͳ�ƴμ�Ŀ¼�µ��ļ�����
:: NOTE:
::  1.������������ִ�Сд��������ͳһ��д����������Сд���С�
::  2.ע��,����ʹ��::��FORѭ��/IF�ڲ�ʹ��REM
::  3.���ո��·����FOR�ڲ�����չdelims����token, �ڲ�����ʹ����չ������ȡȫ·��
::  4.�ļ�Ϊȫ·��������DIRʱ�п��ܳ�·������
:: ������������ѣ�1) FORѭ��������·�����ո�ʹ��"%VAR%"; 2) DIR�ĳ�·����ʹ�ö�·��

@ECHO OFF

SET tmpname="d:\project\dir_tmp.txt"
SET filename="d:\project\dir_sort.txt"
SET fulldirlist="d:\project\dir.txt"

:: �����ӳ�
SETlocal enabledelayedexpansion

:: F:\Media\��Ӱָ��.Viewing_Guide\AV_Guide\playbill����(AV)\AVŮ��.Actress\����\����Ů��2 ����Ů��1 ��ѪŮ�� �˚�Ů��(2005��ǰ����)
:: F:\Media\��Ӱָ��.Viewing_Guide\AV_Guide\playbill����(AV)\�ձ�\CA - (ԭ����.Hokuto) !  
SET mydir="F:\movie\��Ӱָ��.Viewing_Guide\AV_Guide\playbill����(AV)\�ձ�\"
IF NOT [%1]==[] (
	REM if input argument is null, then reset mydir
	SET mydir=%1
)
SET yes=N
IF [%2]==[2] (
	SET yes=Y
)
ECHO [1]curdir=%mydir%
ECHO [1-0]2 dir: %2

CD /D %mydir%
CD > %tmpname%
ECHO filename	num >> %tmpname%	

:: get dir list: 2 level dirlist
:: ECHO. > %fulldirlist%
DEL %fulldirlist%
FOR /D %%a  IN (*.*) DO (
	ECHO [1.1]%%~fa
	ECHO %%~fa >> %fulldirlist%
	IF  [%yes%]==[Y] (
		CD %%~fa
		FOR /D %%b  IN (*.*) DO (
			ECHO [1.2]%%~fb
			ECHO %%~fb >> %fulldirlist%
		)
		CD ..
	)
)

:STAT
CD %mydir%
		ECHO	[2]start find dir
SET sum=0
SET dirnum=0
:: FOR������չ�����ո��·�� OK -"delims=" or "tokens=*"  && "usebackq"
:: COPY  %fulldirlist% .
:: FOR /F  "delims=" %%c  IN (dir.txt) DO (
FOR /F  "usebackq tokens=*" %%c  IN (%fulldirlist%) DO (
	SET n=0
	REM  %%~fc is necessay, else WRONG PATH
	REM ECHO	[3]%%c
	FOR /F "delims="  %%d IN ('DIR /a-d /b /s "%%~fc"') DO SET /A n+=1
	ECHO !n!	%%c 
	ECHO !n!	%%~nc >> %tmpname%
	SET /A sum+=n
	SET /A dirnum+=1
)
	ECHO !sum!	total 
	ECHO !sum!	total, [!dirnum!]dirs >> %tmpname%


:: list file and num, the same to "find | wc -l"
:: sort:  sort -n -k 2 -r 
:: OK 1: 
::  SET sum=0
::  FOR /D %%a  IN (*.*) DO (
::  	SET n=0
::  	FOR /F %%b IN ('DIR /a-d /b /s "%%a"') DO SET /A n+=1
::  	ECHO !n!	%%a
::  	ECHO !n!	%%a >> %tmpname%
::  	SET /A sum+=n
::  )
::  ECHO !sum!	 "total" >> %tmpname%

:: BAD 1: FOR /R too many directorys
::  FOR /R %mydir% %%c  IN (.) DO (
::  	REM ECHO %%c
::  	SET n=0
::  	FOR /F  %%d IN ('DIR /a-d /b /s "%%c"') DO SET /A n+=1
::  	ECHO !n!	%%c
::  	ECHO !n!	%%c >> %tmpname%
::  )

Endlocal

:SORT
ECHO [4]START SORT
:: SORT, �����ⲿ�������·�����ո�������Ȧ���������⣬ע������ӳ�
:: use linux_sort instead of windows_sort
"C:\Program Files (x86)\Git\bin\sort.exe" -n %tmpname%  
:: "C:\Program Files (x86)"\Git\bin\sort.exe -g %tmpname%  > %filename% 

:CLEAN
:: mv file to dirctory: mv -f, copy
:: COPY /Y %filename% d:\project
:: COPY /Y %tmpname% d:\project
:: DEL %fulldirlist%
:: DEL %tmpname%
:: DEL %fulldirlist%
GOTO   END 

:USAGE
ECHO Usage: %0 dir_path  level
GOTO   END 

:END
:: PAUSE

