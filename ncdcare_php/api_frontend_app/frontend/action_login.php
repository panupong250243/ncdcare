<?php session_start(); ?>
<?php include('../class_conn.php'); ?>
<?php include('../config.php') ?>
<?php
$cls_conn = new class_conn;
if (isset($_POST['login'])) {

    $email = $_POST['user_email'];
    $password = $_POST['user_passwd'];
    $sql = "select * from tb_user where user_email = '$email' and user_passwd = '$password'";
    $num_rows = $cls_conn->select_numrows($sql);
    if ($num_rows >= 1) {
        $rs = $cls_conn->select_base($sql);
        while ($row = mysqli_fetch_array($rs)) {
            $user_id = $row['user_id'];
        }

        $_SESSION['user_id'] = $user_id;
      
        $word = "Welcome login";
        echo $cls_conn->show_message($word);
        echo $cls_conn->goto_page(0, 'header.php');
    } else {
        echo $cls_conn->show_message('Username/Password Incorrect');
        echo $cls_conn->goto_page(1, 'login.php');
    }
}

?>