<?php 
    session_start();
    $user_id = $_GET['user_id'];

    $_SESSION['user_id'] = $user_id;

    echo "<meta http-equiv='refresh' content='1;../../frontend/header.php' />"
?>