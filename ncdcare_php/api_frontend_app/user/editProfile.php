<?php 
	include("../conn.php");

	$userid = $_POST['user_id'];
    $user_fullname = $_POST['user_fullname'];
    $user_gender = $_POST['user_gender'];
    $user_email = $_POST['user_email'];
    $user_tel = $_POST['user_tel'];


	$sql = "UPDATE `tb_user` SET `user_fullname`='$user_fullname',`user_gender`='$user_gender',`user_email`='$user_email',`user_tel`='$user_tel' WHERE user_id = '$userid'";
	$result = mysqli_query($conn,$sql);

	if($result){
		echo json_encode($userid);

	}else{
		echo json_encode('0');
	}
	
	
?>