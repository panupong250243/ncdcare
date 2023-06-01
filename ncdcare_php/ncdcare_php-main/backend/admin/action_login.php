<?php session_start(); ?>
<?php include('../../class_conn.php'); ?>
<?php include('../../config.php') ?>
<?php
$cls_conn = new class_conn;
if (isset($_POST['login'])) {

    $email = $_POST['admin_email'];
    $password = $_POST['admin_passwd'];
    $sql = "select * from tb_admin where admin_email = '$email' and admin_passwd = '$password'";
    $num_rows = $cls_conn->select_numrows($sql);
    if ($num_rows >= 1) {
        $rs = $cls_conn->select_base($sql);
        while ($row = mysqli_fetch_array($rs)) {
            $admin_id = $row['admin_id'];
        }

        $_SESSION['admin_id'] = $admin_id;
      
        $word = "Welcome login";
        echo $cls_conn->show_message($word);
        echo $cls_conn->goto_page(0, 'index.php');
    } else {
        echo $cls_conn->show_message('Username/Password Incorrect');
        echo $cls_conn->goto_page(1, 'login.php');
    }
}

?>