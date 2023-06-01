<?php 
	include("../conn.php");

	$userid = $_POST['user_id'];
	$password = $_POST['user_password'];
	$newpassword = $_POST['newpassword'];

	$sql = "SELECT * FROM tb_user WHERE user_id = '".$userid."' AND user_passwd = '".$password."' ";
	$result = mysqli_query($conn,$sql);

	if($result->num_rows > 0){

		mysqli_query($conn,"UPDATE tb_user SET user_passwd = '".$newpassword."' WHERE user_id = '".$userid."' ");
		echo json_encode($userid);

	}else{
		echo json_encode("-1");
	}
	
	
?>