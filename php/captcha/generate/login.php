<?php
/*
*ǰ��ҳ����ж���֤���Ƿ���ͬ
*login.php = form.php + post.php
*/
session_start();

if($_POST[check]) {
//�ж���֤���Ƿ���ͬ
    if($_POST[check]==$_SESSION[check_pic]) {
        echo "��֤�ɹ���";
    } else {
        echo "��֤�����";
    }
}
?>

<form action="login.php" method="POST">
�û�����<input type="text" name="user"/><br>
���룺<input type="password" name="pwd"/><br>
��֤�룺<input type="text" name="check"/><img src="checkcode.php"><br>
<input type="submit" value="submit"/>
</form>


