<?php 
include("../conn.php");

$diseaseIdList = $_POST['diseaseId'];
$diseaseId = explode(",",$diseaseIdList);

$sql = "SELECT disease_symbol_id from `tb_disease_symbol` where disease_symbol_id IN (" . implode(',', $diseaseId) . ") && isFootImage = '1'";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
   echo json_encode($data);
?>