<?php
include("../conn.php");
$sug_rate = $_POST['sug_rate'];
$sug_detail = $_POST['sug_detail'];
$user_id = $_POST['user_id'];

$sqlSE = "SELECT `tb_user_user_id` FROM `tb_suggestion` WHERE `tb_user_user_id` = '$user_id'";

$result = mysqli_query($conn, $sqlSE);

if (mysqli_num_rows($result) > 0) {
  $sqlUP = "UPDATE `tb_suggestion` SET `sug_rate`='$sug_rate',`sug_detail`='$sug_detail' WHERE tb_user_user_id = '$user_id'";

  if (mysqli_query($conn, $sqlUP)) {
    echo json_encode(1);
  } else {
    echo json_encode(0);
  }
} else {

  $sqlIN = "INSERT INTO `tb_suggestion`(`sug_rate`, `sug_detail`, `tb_user_user_id`) VALUES ('$sug_rate','$sug_detail','$user_id')";
  if (mysqli_query($conn, $sqlIN)) {
    $lastID = mysqli_insert_id($conn);
    echo json_encode($lastID);
  } else {
    echo json_encode(0);
  }

}
