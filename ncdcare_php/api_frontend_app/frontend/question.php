<?php include('../class_conn.php'); ?>
<?php
    session_start();
    include('../config.php');
?>
<?php
    $id = $_GET['id'];

    $cls_conn = new class_conn;

    if ($_SESSION['user_id'] == null) {
        echo $cls_conn->goto_page(0, 'logout.php');

    }
    $user_id = $_SESSION['user_id'];

    $sql = "select * from tb_user where user_id='$user_id'";
    $result = $cls_conn->select_base($sql);
    $row = $result->fetch_assoc();

    $user_id = $row['user_id'];
    $user_username = $row['user_name'];
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NCDs CARE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymAous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #D5F5E3;
        }

        .row-left {
            margin-left: 100px;
        }

        .row-right {
            margin-top: -100px;
            margin-left: 461px;
        }

        a {
            text-align: center;
        }

        .footer {
            display: block;
            text-align: center;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 65px;
            text-align: center;
            color: #ffffff;
            font-weight: bold;
        }

        .container {
            background-color: #fff;
            margin-left: 10vw;
            margin-right: 10vw;
            margin-bottom: 10vh;
            margin-top: 10vh;
            display: flex;
            align-items: center;
            width: auto;
            height: auto;
            justify-content: space-around;
            flex-direction: column;
            border-radius: 10px;
            border: 5px solid #F8C86C;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <nav class="navbar bg-success">
                <div class="container-fluid">
                    <a class="navbar-brand" style="color: whitesmoke;">
                        <img src="image/logo.PNG" alt="" width="43" height="35" class="d-inline-block align-text-top">
                        <b>NCDs CARE HEALTH SERVICE</b>
                    </a>
                </div>
            </nav>
        </div>
    </div>

    <form action="" method="post">
        <?php
            $sql = " SELECT * from tb_assessmentquestions inner join tb_type on tb_assessmentquestions.type_id =tb_type.type_id where aq_id ='$id'";
            $result = $cls_conn->select_base($sql);
            while ($row = mysqli_fetch_array($result)) {
        ?>
            <div class="container">
                <div style="height:5vh;"></div>
                <h3><?php
                        $type = $row['type_id'];
                        echo $row['type_id'].'.&emsp;'; 
                        echo $row['type_name'];
                    ?>
                </h3>
                <br><br>
                <h5><b>คำถาม</b> : <?php echo $row['aq_question'] ?> </h5>
                <br><br>
                <div class="col">
                    <input type="radio" id="html" name="ar_score" value="3">
                    <label for="html"> 1. <?php echo $row['aq_answer1'] ?> </label><br><br>

                    <input type="radio" id="html" name="ar_score" value="2">
                    <label for="html"> 2. <?php echo $row['aq_answer2'] ?> </label><br><br>

                    <input type="radio" id="html" name="ar_score" value="1">
                    <label for="html"> 3. <?php echo $row['aq_answer3'] ?> </label><br><br>

                    <input type="radio" id="html" name="ar_score" value="0">
                    <label for="html"> 4. <?php echo $row['aq_answer4'] ?> </label><br><br><br>

                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="float:center;width:160px">
                            <button type="submit" name="submit" class="btn btn-success">บันทึกข้อมูล</button>
                        </div>
                    </div>
                </div>
                <p style="text-align:center"></p>
                </p><?php
                        if (isset($_POST['ar_score'])) {
                            $ar_core = $_POST['ar_score'];
                            // echo $ar_core . " " . "คะแนน";
                        }
                    ?>
                </p>
                <div style="height:5vh;"></div>
            </div>
        <?php
        }
        ?>
    </form>
    <div style="height:5vh;"></div>
    <div class="footer">
        <div class="col-md-12 mt-3">
            <footer class="bg-success text-center text-lg-start">
                <div class="text-center p-3" style="color:white">
                    © 2020 Copyright:
                    <a class="text-white" href="https://www.bpksamutprakan.com/care_blog/view/84">NCDs CARE HEALTH SERVICE</a>
                </div>
            </footer>
        </div>
    </div>
</body>
</html>
<?php
    if(isset($_POST['submit']))
    {
        $ar_score=$_POST['ar_score'];
        $type_id=$_POST['type'];
        $user_id=$_SESSION['user_id'];
        $aq_id=$_POST['id'];
                                                                
        $sql=" insert into `tb_assessmentrespondent` (`ar_score`, `type_id`, `user_id`, `aq_id`)";
        $sql.=" values ('$ar_score','$type','$user_id','$id')";
                                
        if($cls_conn->write_base($sql)==true)
        {
            echo $cls_conn->show_message('บันทึกข้อมูลสำเร็จ');
            echo $cls_conn->goto_page(1,'header.php');
        }else{
            echo $cls_conn->show_message('บันทึกข้อมูลไม่สำเร็จ');
            echo $sql;
        }
    }
?>