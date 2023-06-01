<?php 

date_default_timezone_set('Asia/Bangkok');
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';
include("../conn.php");
$username = $_GET['username'];

$sql = "SELECT * from tb_user where user_name = '$username' || user_email = '$username'";
 $result = mysqli_query($conn,$sql);
 if ($result->num_rows > 0) {
    $data;
    $email;
    while ($row = mysqli_fetch_array($result)) {
        $id = $row['user_id'];
        $email = $row['user_email'];
        $data = $row;
    }
    $gen_otp = rand(100000,999999);
    $insertotp = mysqli_query($conn,"UPDATE tb_user set otp = $gen_otp where user_id  = '".$id."'");
    if($insertotp){

        $mail = new PHPMailer();
    
        //smtp settings
        $mail->isSMTP();
        $mail->SMTPDebug = 0;
        $mail->Debugoutput = 'html';
        $mail->Host = "smtp.gmail.com";
        $mail->SMTPAuth = true;
        $mail->Username = "heroofthegame81@gmail.com";
        $mail->Password = 'ejuxajyotxtizwnd';
        $mail->Port = 587;
        $mail->SMTPSecure = "tls";
    
        //email settings
        $mail->isHTML(true);
        $mail->setFrom($email, $data['user_name']);
        $mail->addAddress("$email");
        $mail->Subject = ("$email OTP");
        $mail->Body = "OTP : $gen_otp";
    
        if($mail->send()){
            echo json_encode($id);
        }
        else
        {
            // echo json_encode($mail->ErrorInfo);
            echo json_encode("0");
        }
    }else{
        echo json_encode("0");
    }
} else {
    echo json_encode("0");
}
?>

