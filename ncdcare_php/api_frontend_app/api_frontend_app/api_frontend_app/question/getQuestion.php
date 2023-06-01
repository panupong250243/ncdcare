<?php 
include("../conn.php");

$symbolIdList = $_POST['symbolIdList'];
$symbolIdSet = explode(",",$symbolIdList);
$most = $_POST['most'];
$sql = "SELECT * from `tb_question` where disease_symbol_id IN (" . implode(',', $symbolIdSet) . ") order by symbol_id = '$most' DESC";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
   echo json_encode($data);
?>