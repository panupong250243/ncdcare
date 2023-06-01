<?php 
include("../conn.php");
$al_name = $_POST['al_name'];
$al_symptom = $_POST['al_symptom'];
$user_id = $_POST['user_id'];

$sql = "INSERT INTO `tb_allergy`(`al_name`, `al_symptom`, `user_id`) VALUES ('$al_name','$al_symptom','$user_id')";
 if(mysqli_query($conn,$sql)){

   $lastID = mysqli_insert_id($conn);

   echo json_encode($lastID);

 }else{

   echo json_encode(0);

 }
