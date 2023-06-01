<?php include('header.php');?>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <script src="https://kit.fontawesome.com/ec837941fe.js" crossorigin="anonymous"></script>
        <style>
            .col-lg-3 {
                position: relative;
                min-height: 1px;
                margin-bottom: 10px;
                padding-right: 15px;
                padding-left: 15px;
            }
            img {
                margin-bottom: 5%;
            }
        </style>
	</head>
	<body>
        <?php
            $sql="SELECT COUNT(DISTINCT user_id) as sum FROM tb_user";
            $result=$cls_conn->select_base($sql);
            while($row=mysqli_fetch_array($result))
            {
        ?>
        <div class="right_col" role="main">
        <h3 style="border: 0;color:black"><b>Dashboard</b></h3><br>
            <div class="x_panel" style="color:black">
                <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-green">
                                <h3 style="text-align:center"><b>จำนวนผู้ใช้งาน <b> <?php echo $row['sum'];?></b> </h4>
                                <div class="inner">
                                    <center><img src="../../backend/template/image/people.png" style="width:80px; height:80px"></center>
                                </div>
                            </div> 
                        </div>
                    </p>
                </div>
            </div><br>
            <?php
               }
            ?>
                <h3 style="border: 0;color:black"><b>ผู้ใช้งาน</b></h3><br>
                    <div class="x_panel" style="color:black">
                        <div class="x_content">
                            <p class="text-muted font-13 m-b-30">
                                <table id="datatable-buttons" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="text-align:center;width:80px">ลำดับ</th>
                                            <th style="text-align:center">รูปภาพ</th>
                                            <th style="text-align:center">ชื่อ</th>
                                            <th style="text-align:center;width:80px">เพศ</th>
                                            <th style="text-align:center;width:80px">อายุ</th>
                                            <th style="text-align:center">อีเมล</th>
                                            <th style="text-align:center">เบอร์โทรศัพท์</th>
                                            <th style="text-align:center;width:80px">สถานะ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            $sql=" select * from tb_user";
                                            $item = 1;
                                            $result=$cls_conn->select_base($sql);
                                            while($row=mysqli_fetch_array($result))
                                            {
                                        ?>
                                        <tr style="text-align:center">
                                            <td>
                                                <?=$item?>
                                            </td>
                                            <td>
                                                <img src="../../upload/<?= $row['user_image'];?>" style="width:50px;height:50px;">
                                            </td>
                                            <td>
                                                <?=$row['user_name'];?>
                                            </td>
                                            <td>
                                                <?php
                                                    switch($row['user_gender']){
                                                        case '0':
                                                            echo '<span style="color:black;">ชาย</span>';
                                                            break;
                                                        case '1':
                                                            echo '<span style="color:black;">หญิง</span>';
                                                            break;
                                                        case '2':
                                                            echo '<span style="color:black;">ไม่ระบุ</span>';
                                                            break;
                                                    }
                                                ?>
                                            </td>
                                            <td>
                                                <?=$row['user_age'];?>
                                            </td>
                                            <td>
                                                <?=$row['user_email'];?>
                                            </td>
                                            <td>
                                                <?=$row['user_tel'];?>
                                            </td>
                                            <td>
                                                <?php
                                                    if ($row['user_status'] == 0) {
                                                ?>
                                                    <span style="color:green;">อนุมัติ</span>
                                                <?php
                                                    } else {
                                                ?>
                                                    <span style="color:red;">ไม่อนุมัติ</span>
                                                <?php
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                        <?php
                                            $item++; }
                                        ?>
                                    </tbody> 
                                </table>
                            </p>
                        </div>
                    </div>
        </div>
	</body>
</html>
<?php include('footer.php');?>