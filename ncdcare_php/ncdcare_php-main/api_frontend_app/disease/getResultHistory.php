<?php 
include("../conn.php");

$user_id = $_POST['userId'];

$sql = "SELECT * from `tb_result` LEFT JOIN tb_result_image on tb_result.result_image_id = tb_result_image.result_image_id where tb_result.user_id = '$user_id'";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
       
   echo json_encode($data);
?>