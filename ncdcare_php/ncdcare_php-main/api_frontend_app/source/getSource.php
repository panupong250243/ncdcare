<?php 
include("../conn.php");


$sql = "SELECT * from tb_sourceknowledge where sourcek_status = '0'";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
       
   echo json_encode($data);
?>