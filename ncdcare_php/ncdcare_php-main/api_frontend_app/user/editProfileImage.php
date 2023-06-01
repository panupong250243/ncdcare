<?php 
	include("../conn.php");

	$userid = $_POST['user_id'];
    $storeimg = "";
    $datetime=date("dmYHis");
    $file_name=substr($_FILES['img']['name'],-4);
    $storeimg = $datetime.'_p1'.$file_name;
    $imagePath = '../../upload/'.$storeimg;
    $tmp_name = $_FILES['img']['tmp_name'];
   
    move_uploaded_file($tmp_name,$imagePath);
    


	$sql = "UPDATE `tb_user` SET user_image = '$storeimg' WHERE user_id = '$userid'";
	$result = mysqli_query($conn,$sql);

	if($result){
		echo json_encode($userid);

	}else{
		echo json_encode('0');
	}
	
	
?>