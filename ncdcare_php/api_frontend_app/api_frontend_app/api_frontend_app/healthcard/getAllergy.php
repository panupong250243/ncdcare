<?php 
include("../conn.php");

$user_id = $_POST['user_id'];

$sql = "SELECT * from `tb_allergy` where user_id = '$user_id'";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
       
   echo json_encode($data);
?>