<?php include('header.php');?>
<?php
    session_destroy();
    echo $cls_conn->goto_page(1,'login.php');
?>