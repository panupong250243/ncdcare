<?php 
include("../conn.php");

$bodyPartId = $_POST['bodyPartId'];


$sql = "SELECT * from `tb_symbol` where symbol_status = '0'";
if($bodyPartId != 0){
    $sql.= " and bodypart_id = '$bodyPartId'";
}
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
       
   echo json_encode($data);
?>