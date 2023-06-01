<?php 
	include("../conn.php");

	$userid = $_POST['user_id'];
	$newpassword = $_POST['newpassword'];

    $result =   mysqli_query($conn,"UPDATE tb_user SET user_passwd = '".$newpassword."' WHERE user_id = '".$userid."' ");
		
	if($result){
		echo json_encode($userid);
	}else{
		echo json_encode("0");
	}
	
	
?>