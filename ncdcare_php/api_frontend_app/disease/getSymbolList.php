<?php 
include("../conn.php");

$symbolIdList = $_POST['symbolId'];
$symbolId = explode(",",$symbolIdList);

$sql = "SELECT * from `tb_symbol` join tb_bodypart on tb_symbol.bodypart_id = tb_bodypart.bodypart_id where disease_symbol_id IN (" . implode(',', $symbolId) . ")";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
 
   echo json_encode($data);
?>