<?php 
include("../conn.php");

$symbolIdList = $_POST['symbolIdList'];
$symbolIdSet = explode(",",$symbolIdList);
$sql = "SELECT * from `tb_question` where disease_symbol_id  IN (" . implode(',', $symbolIdSet) . ")";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
       
   echo json_encode($data);
?>