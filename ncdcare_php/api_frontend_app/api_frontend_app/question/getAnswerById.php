<?php 
include("../conn.php");

$questionId = $_POST['questionId'];

$sql = "SELECT * from `tb_answer` where question_id = '$questionId'";
$result = mysqli_query($conn,$sql);
$data = array();
while($row = mysqli_fetch_assoc($result)){
    $data[] = $row;
}
       
   echo json_encode($data);
?>