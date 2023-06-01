<?php 
include("../conn.php");

$diseaseIdList = $_POST['diseaseId'];
$diseaseId = explode(",",$diseaseIdList);

$sql = "SELECT sum(isBMI) as BMI,sum(isAge) as Age,sum(isFootImage) as FootImage from `tb_disease_symbol` where disease_symbol_id IN (" . implode(',', $diseaseId) . ")";
$result = mysqli_query($conn,$sql);
$data = mysqli_fetch_assoc($result);  
   echo json_encode($data);
?>