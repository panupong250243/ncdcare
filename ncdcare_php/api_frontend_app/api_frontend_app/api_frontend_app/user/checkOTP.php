<?php 
include("../conn.php");
$userId = $_POST['userId'];
$otp = $_POST['otp'];

$sql = "SELECT * from tb_user where user_id = '$userId' && otp = '$otp'";
 $result = mysqli_query($conn,$sql);
 if($result->num_rows > 0){
    $sql2 = "UPDATE tb_user set otp = null where user_id  = '".$userId."'";
 $result2 = mysqli_query($conn,$sql2);
 if($result2){
    echo json_encode($userId);
 }else{
    echo json_encode("0");
 }
 }else{
    echo json_encode("0");
 }
?>