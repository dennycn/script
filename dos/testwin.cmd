:: 
:: DESC: TEST
@ECHO OFF


:TEST1
REM TEST ������������ǿ����~�ַ����滻
SET a=hello world! 
ECHO �滻ǰ��ֵ: %a% 
ECHO �滻���ֵ��%a: =% 
ECHO �滻���ֵ��%a:llo= is her % 
ECHO �滻���ֵ��%a: =_% 
ECHO �滻���ֵ��%a:*lo=the% 
ECHO �滻���ֵ��%a:2,1% 
ECHO �滻���ֵ��%a:-2,1% 

:: GOTO END

 
:TEST2
REM TEST ������������ǿ����, ����%s��Ч
REM test.cmd "C:\Program Files (x86)\Git\bin\sort.exe"   
ECHO �������е����������
ECHO ԭ���ƣ�%1
ECHO ��ȫ·����%~f1
ECHO ȥ�����ţ�%~1
ECHO ���ڷ�����%~d1
ECHO ����·����%~p1
ECHO �ļ�����%~n1
ECHO ��չ����%~x1
ECHO �ļ����ԣ�%~a1
ECHO �޸�ʱ�䣺%~t1
ECHO �ļ���С��%~z1
ECHO ������%~s1
ECHO ��ȫ·���������%~fs1
ECHO �������DIR��%~ftza1

GOTO END

:TEST3
SETlocal enabledelayedexpansion
REM SET TMP=" �������е����������"
:: SET TMP=%1
SET dirfile="F:\movie\��Ӱָ��.Viewing_Guide\AV_Guide\playbill����(AV)\�ձ�"
:: SET dirfile="F:\movie\��Ӱָ��.Viewing_Guide\AV_Guie"
	 SET fa=%dirfile%\%TMP%
	 SET fb=!fa:"=!
	 ECHO [2-1]%dirfile%\%TMP%
	 ECHO [2-2]!fa!
	 ECHO [2-3]!fb!
Endlocal

GOTO END


:TEST-END
"C:\Program Files (x86)\Git\bin\sort.exe" -n dir_tmp.txt  
GOTO END

:END
:: PAUSE
