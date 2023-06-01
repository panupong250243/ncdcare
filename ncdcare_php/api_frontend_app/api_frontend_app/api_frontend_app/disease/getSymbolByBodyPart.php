<?php 
include("../conn.php");

$bodyPartId = $_POST['bodyPartId'];
$search = $_POST['search'];


$sql = "SELECT * from `tb_symbol` where symbol_status = '0' and symbol_name like '%$search%'";
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