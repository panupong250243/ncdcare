<?php 
include("../conn.php");


$sql = "SELECT * from tb_content where content_status = '0' LIMIT 5";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
       
   echo json_encode($data);
?>