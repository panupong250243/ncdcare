<?php session_start(); ?>
<?php include('../../class_conn.php'); ?>
<?php 
    $cls_conn = new class_conn; 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NCDs CARE</title>
    <link rel="icon" type="image/x-icon" href="../image/logo.png">

    <!-- Bootstrap -->
    <link href="../template/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../template/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- NProgress -->
    <link href="../template/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../template/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="../template/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../template/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
    <!-- bootstrap-daterangepicker -->
    <link href="../template/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../template/build/css/custom.min.css" rel="stylesheet">
    <!-- bootstrap-icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/ec837941fe.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body class="nav-md" style="background-color:#424242">
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view" style="border: 0;background-color:#424242">
                    <div class="navbar nav_title" style="border: 0;background-color:#424242"><a href="index.php" class="site_title"><img src="../template/image/LOGO.png" width="30px" height="30px" alt=""> ระบบจัดการข้อมูล</a></div>
                    <div class="clearfix"></div>

                    <!-- menu profile quick info -->
                    <div class="profile clearfix">
                        <div class="profile_info" style="text-align:center;"><span><b style="font-size:16px;color:gainsboro">&nbsp;Welcome Admin</b></span></div>
                    </div>
                    <!-- /menu profile quick info -->
                    <hr>

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section">
                            <ul class="nav side-menu">
                                <li><a href="index.php"><i class="bi bi-speedometer2" style="font-size:medium"></i> &nbsp; &nbsp;Dashboard</a></li>

                                <li><a href="show_admin.php"><i class="bi bi-person-fill-gear" style="font-size:medium"></i> &nbsp; &nbsp;ผู้ดูแลระบบ</a></li>

                                <li><a href="show_user.php"><i class="bi bi-people" style="font-size:medium"></i> &nbsp; &nbsp;จัดการผู้ใช้งาน</a></li>
                               
                                <li><a  href="show_allergy.php"><i class="bi bi-info-circle" style="font-size:medium"></i> &nbsp; &nbsp;แพ้ยา</a></li>

                                <li><a  href="show_adisease.php"><i class="bi bi-info-circle" style="font-size:medium"></i> &nbsp; &nbsp;โรคประจำตัว</a></li>

                                <li><a href="show_content.php"><i class="bi bi-file-earmark-text" style="font-size:medium"></i> &nbsp; &nbsp;บทความ</a></li>

                                <li><a href="show_disease.php"><i class="bi bi-clipboard2-plus" style="font-size:medium"></i> &nbsp; &nbsp;ข้อมูลโรค</a></li>

                                <li><a href="show_advice.php"><i class="bi bi-file-earmark-check" style="font-size:medium"></i> &nbsp; &nbsp;คำแนะนำ</a></li>

                                <li><a href="show_knowledgebase.php"><i class="bi bi-youtube" style="font-size:medium"></i> &nbsp; &nbsp;คลังความรู้</a></li>

                                <li><a href="show_sourceknowledge.php"><i class="bi bi-globe-asia-australia" style="font-size:medium"></i> &nbsp; &nbsp;แหล่งความรู้</a></li>

                                <!-- <li><a  href="show_diseasequestion.php"><i class="bi bi-question-diamond" style="font-size:medium"></i> &nbsp; &nbsp;คำถามโรค</a></li> -->
                                <li><a href="show_type.php"><i  class="bi bi-archive" style="font-size:medium"></i> &nbsp; &nbsp;ประเภทโรค</a></li>

                                <li><a href="show_assessmentquestions.php"><i class="bi bi-virus2" style="font-size:medium"></i> &nbsp; &nbsp;แบบประเมินความเสี่ยงโรค</a></li>

                                <li><a href="show_assessmentrespondent.php"><i  class="bi bi-archive" style="font-size:medium"></i> &nbsp; &nbsp;ผลการตอบแบบประเมินความเสี่ยงโรค</a></li>

                                <li><a  href="show_contactus.php"><i class="bi bi-info-circle" style="font-size:medium"></i> &nbsp; &nbsp;เกี่ยวกับ</a></li>

                                <li><a href="show_emergency.php"><i class="bi bi-telephone-inbound" style="font-size:medium"></i> &nbsp; &nbsp;ฉุกเฉิน</a></li>

                                <li><a href="show_suggestion.php"><i class="bi bi-window-plus" style="font-size:medium"></i> &nbsp; &nbsp;ข้อเสนอแนะ</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu">
                    <nav>
                        <div class="nav toggle"><a id="menu_toggle"><i class="fa fa-bars" style="font-size:large;color:black"></i></a></div>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="logout.php"><i class="bi bi-box-arrow-right" style="font-size:large"></i> &nbsp;Logout</a></li>
                            <li><a href=""><i class="bi bi-bell" style="font-size:large"></i></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>
