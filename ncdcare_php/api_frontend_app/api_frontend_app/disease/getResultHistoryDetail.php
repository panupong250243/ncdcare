<?php 
include("../conn.php");

$resultId = $_POST['resultId'];

$sql = "SELECT * from `tb_result_detail` join tb_disease_symbol on tb_result_detail.disease_symbol_id = tb_disease_symbol.disease_symbol_id  where tb_result_detail.result_id = '$resultId'";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
       
   echo json_encode($data);
?>