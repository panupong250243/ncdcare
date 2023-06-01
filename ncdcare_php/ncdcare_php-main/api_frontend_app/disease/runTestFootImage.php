<?php 
	include("../conn.php");

	$userid = $_POST['user_id'];
	$disease_id = $_POST['disease_id'];
    $storeimg = "";
    $datetime=date("dmYHis");
    $file_name=substr($_FILES['img']['name'],-4);
    $storeimg = $datetime.'_p1'.$file_name;
    $imagePath = 'footImage/'.$storeimg;
    $tmp_name = $_FILES['img']['tmp_name'];
   
    move_uploaded_file($tmp_name,$imagePath);
    
	$sql = "INSERT INTO `tb_result_image`(`result_image_name`, `result_image_status`,disease_symbol_id) VALUES ('$storeimg','0','$disease_id')";
	$result = mysqli_query($conn,$sql);

	if($result){
        $id = mysqli_insert_id($conn);
		echo json_encode("$id");
	}else{
		echo json_encode('0');
	}
	
	
?>