<?php
/*
*ǰ��ҳ����ж���֤���Ƿ���ͬ
*login.php = form.php + post.php
*/
session_start();

if($_POST[check]) {
//�ж���֤���Ƿ���ͬ
    if($_POST[check]==$_SESSION[check_pic]) {
        echo "validate ok!";
    } else {
        echo "validate error!";
    }
}
?>

<form action="login.php" method="POST">
user: <input type="text" name="user"/><br>
pwd: <input type="password" name="pwd"/><br>
code: <input type="text" name="check"/><img src="checkcode.php"><br>
<input type="submit" value="submit"/>
</form>


