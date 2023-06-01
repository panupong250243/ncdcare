<?php 
include("../conn.php");
$sug_rate = $_POST['sug_rate'];
$sug_detail = $_POST['sug_detail'];
$user_id = $_POST['user_id'];

$sql = "INSERT INTO `tb_suggestion`(`sug_rate`, `sug_detail`, `tb_user_user_id`) VALUES ('$sug_rate','$sug_detail','$user_id')";
 if(mysqli_query($conn,$sql)){

   $lastID = mysqli_insert_id($conn);

   echo json_encode($lastID);

   while ($row = mysqli_fetch_array($result)) {
         $id = $row['user_id'];
   }

   if ($id == $user_id){
      $sql = "UPDATE `tb_suggestion` SET `sug_rate`='$sug_rate',`sug_detail`='$sug_detail' WHERE tb_user_user_id = '$user_id'";
   }


 }else{

   echo json_encode(0);

 }
