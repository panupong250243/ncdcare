<?php 
include("../conn.php");
$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * from tb_user where user_name = '$username' and user_passwd = '$password'";
 $result = mysqli_query($conn,$sql);
 if ($result->num_rows > 0) {
    while ($row = mysqli_fetch_array($result)) {
        $id = $row['user_id'];
    }

    echo json_encode($id);
} else {
    echo json_encode(0);
}
