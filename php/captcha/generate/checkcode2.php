<?php
/*
* ����ͼƬ��֤��2: 
* NOte: ��bug�����
* and open the template in the editor.
*/
session_start();
for ($i=0; $i<4; $i++) {
    $rand.=dechex(rand(1,15)); //����4λ������ʮ�����Ƶ������
}
//������֤�뵽SESSION
$_SESSION[check_pic]=$rand;

$img=imagecreatetruecolor(100,30); //����ͼƬ
$bg=imagecolorallocate($img,0,0,0); //��һ�����ɵ��Ǳ�����ɫ
$fc=imagecolorallocate($img,255,255,255); //���ɵ�������ɫ
//��ͼƬ����
for ($i=0; $i<3; $i++) {
    $te=imagecolorallocate($img,rand(0,255),rand(0,255),rand(0,255));
    imageline($img,rand(0,15),0,100,30,$te);
}
//��ͼƬ����
for ($i=0; $i<200; $i++) {
    $te=imagecolorallocate($img,rand(0,255),rand(0,255),rand(0,255));
    imagesetpixel($img,rand()%100,rand()%30,$te);
}
//����Ҫ������ת����utf-8��ʽ
//$str=iconv("gb2312","utf-8","�ǺǺ�");
//�������ĵ���֤
//smkai.ttf��һ�������ļ���Ϊ���ڱ��˵ĵ�����Ҳ�����������ã����ļ��ŵ���Ŀ�ĸ�Ŀ¼���������أ����б���C:\WINDOWS\Fonts����
imagettftext($img,11,10,20,20,$fc,"simkai.ttf","������");
//���ַ���д��ͼƬ��
imagestring($img,rand(1,6),rand(3,70),rand(3,16),$rand,$fc);

// ���ͼ��
header("Content-type:image/jpeg");
imagejpeg($img);
?>




