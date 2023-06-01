<?php 
include("../conn.php");
$userid = $_POST['user_id'];
$username = $_POST['username'];

$sql = "SELECT * from tb_user where user_id = '$userid' || user_name = '$username'";
 $result = mysqli_query($conn,$sql);
$data = mysqli_fetch_assoc($result);
echo json_encode($data);
?>