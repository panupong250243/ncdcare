<?php include('../class_conn.php'); ?>
<?php
    session_start();
    include('../config.php');
?>
<?php
    $cls_conn = new class_conn;

    if ($_SESSION['user_id'] == null) {
        echo $cls_conn->goto_page(0, 'logout.php');

    }
    $_id = $_SESSION['user_id'];

    $sql = "select * from tb_user where user_id='$_id'";
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <title>NCDs CARE</title>
    <style>
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

        h3 {
            text-align: center;
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
                    <h5 style="color:white;">คุณ : <?php echo $user_username ?></h5>
                    <div>
                        <button style="border-radius:5px" class="btn btn-success" onclick="location.href='logout.php'">Log out</button>
                    </div>
                </div>
        </div>
        </nav>
    </div>
    <div class="container-fluid">
        <br>
        <h3>ผลการทำแบบประเมิน</h3>
        <a href="header.php" class="btn btn-warning" style="color:white">กลับ</a>
        <br>
        <div class="row">
            <table id="datatable-buttons" class="table table-striped table-bordered mt-3">
                <thead style="background-color:#1E8449;color:white">
                    <tr>
                        <th style="text-align:center;width:20px">ลำดับ</th>
                        <th style="text-align:center;width:180px">
                            <div class="btn-group">
                                <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">ประเภทโรค</button>
                                <ul class="dropdown-menu">
                                    <?php
                                        $sql = " SELECT * from  tb_type";
                                        $result = $cls_conn->select_base($sql);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                    ?>
                                            <li><a class="dropdown-item"><?php echo $row['type_name'] ?></a></li>
                                    <?php
                                        }
                                    } ?>
                                </ul>
                            </div>
                        </th>
                        <th style="text-align:center;width:30px">เปอร์เซ็นต์ความเสี่ยง</th>
                    </tr>
                </thead>
                <tbody style="background-color:#F8F9F9;text-align:center">
                    <?php
                        $item = 1;
                        $sql1 = "SELECT * , SUM(ar_score)/15 * 100 AS sum_score FROM tb_assessmentrespondent join tb_type on tb_assessmentrespondent.type_id = tb_type.type_id WHERE user_id = '$user_id' GROUP BY type_name";  
                        $result1 = $cls_conn->select_base($sql1);
                        while ($row = mysqli_fetch_array($result1)) {
                    ?>
                    
                    <tr>
                        <td>
                            <p> <?= $item ?></p>
                        </td>

                        <td style="text-align:left">
                            <p><?php 
                                echo $row['type_name'];?></p>
                        </td>
                        <td>
                            <p>
                                <?php 
                                    $sum_score = $row['sum_score'];
                                    echo $row['sum_score'];
                                ?>
                            </p>
                        </td>
                    </tr>
                    <?php
                        $item++;
                    } 
                    ?>
                </tbody>
            </table>
        </div>
        <div style="height:5vh;"></div>
    </div>
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