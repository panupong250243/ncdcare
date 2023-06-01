<?php 
include("../conn.php");
$username = $_POST['username'];
$password = $_POST['password'];
$fullname = $_POST['fullname'];
$email = $_POST['email'];
$tel = $_POST['tel'];

$sql = "INSERT INTO `tb_user`(`user_fullname`, `user_email`, `user_tel`, `user_name`, `user_passwd`) VALUES ('$fullname','$email','$tel','$username','$password')";
 if(mysqli_query($conn,$sql)){

    $lastID = mysqli_insert_id($conn);

    echo json_encode($lastID);

 }else{

    echo json_encode(0);

 }
?>