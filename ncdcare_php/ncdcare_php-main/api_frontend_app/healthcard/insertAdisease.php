<?php
include("../conn.php");

$adis_name = $_POST['adis_name'];
$adis_detail = $_POST['adis_detail'];
$user_id = $_POST['user_id'];

$sql = "INSERT INTO `tb_adisease`(`adis_name`,`adis_detail`, `user_id`) VALUES ('$adis_name','$adis_detail','$user_id')";
if (mysqli_query($conn, $sql)) {

  $lastID = mysqli_insert_id($conn);

  echo json_encode($lastID);
} else {

  echo json_encode(0);
}
