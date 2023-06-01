<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h3 style="border: 0;color:black">แก้ไขข้อมูลผู้ใช้งาน</h3>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a> </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                        <br>
                        <?php
                            if(isset($_GET['id']))
                            {
                                $id=$_GET['id'];
                                $sql=" select *  from tb_user";
                                $sql.=" where";
                                $sql.=" user_id=$id";
                                $result=$cls_conn->select_base($sql);
                                while($row=mysqli_fetch_array($result))
                                {
                                    $user_id=$row['user_id'];
                                    $user_image=$row['user_image'];
                                    $user_name=$row['user_name'];
                                    $user_gender=$row['user_gender'];
                                    $user_age=$row['user_age'];
                                    $user_tel=$row['user_tel'];
                                    $user_email=$row['user_email'];
                                    $user_passwd=$row['user_passwd'];
                                    $user_status=$row['user_status'];
                                }
                            }
                        ?>

                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data" style="border: 0;color:black">
                            <input type="hidden" name="user_id" value="<?=$user_id;?>" />
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_image">รูปปก<span class="required">:</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="file" id="user_image" name="user_image" value="<?= $user_image; ?>" class="form-control col-md-7 col-xs-12">
                                    <div class="">
                                        <center><img src="../../upload/<?= $user_image; ?>" alt="" height="100px" width="150px" id="img" style="margin-top:10px;"></center>
                                        <script>
                                            user_image.onchange = evt => {
                                                const [file] = user_image.files
                                                if (file) {
                                                    img.src = URL.createObjectURL(file)
                                                }
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div><br>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_name">ชื่อ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="user_name" name="user_name" required="required" class="form-control col-md-7 col-xs-12" value="<?=$user_name;?>"> 
                                </div>
                            </div>
                             
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_gender">เพศ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="user_gender" name="user_gender" required="required" class="form-control col-md-7 col-xs-12" value="<?=$user_gender;?>">
                                        <option value="0">ชาย</option>
                                        <option value="1">หญิง</option>
                                        <option value="2">ไม่ระบุ</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_age">อายุ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="user_age" name="user_age" required="required" class="form-control col-md-7 col-xs-12" value="<?=$user_age;?>"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_tel">เบอร์โทรศัพท์<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="user_tel" name="user_tel" required="required" class="form-control col-md-7 col-xs-12" value="<?=$user_tel;?>" > 
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_email">อีเมล์<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="user_email" name="user_email" required="required" class="form-control col-md-7 col-xs-12" value="<?=$user_email;?>" > 
                                </div>
                            </div>
        

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_passwd">รหัสผ่าน<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="user_passwd" name="user_passwd" required="required" class="form-control col-md-7 col-xs-12" value="<?=$user_passwd;?>" > 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="user_status" name="user_status" value="<?=$user_status;?>" required="required" class="form-control col-md-7 col-xs-12">
                                        <option value="0">อนุมัติ</option>
                                        <option value="1">ไม่อนุมัติ</option>
                                    </select>
                                </div>
                            </div> 
                            
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="float:right">
                                    <button type="submit" name="submit" class="btn btn-warning">แก้ไข</button>
                                    <button type="reset" name="reset" class="btn btn-secondary">ยกเลิก</button>
                                </div>
                            </div>
                        </form>

                        <?php
                            if(isset($_POST['submit']))
                            {
                                $user_image="";
                                if($_FILES["user_image"]["name"] != ""){
                                    $datetime=date("dmYHis");
                                    $file_name=substr($_FILES['user_image']['name'],-4);
                                    $user_image=$datetime.'_p1'.$file_name;
                                    $target = "../../upload/" . $user_image;
                                    move_uploaded_file($_FILES['user_image']['tmp_name'], $target);
                                    $sql .= " ,user_image='$user_image'";
                                }  
                                $user_name=$_POST['user_name'];
                                $user_gender=$_POST['user_gender'];
                                $user_age=$_POST['user_age'];
                                $user_tel=$_POST['user_tel'];
                                $user_email=$_POST['user_email'];
                                $user_passwd=$_POST['user_passwd'];
                                $user_status=$_POST['user_status'];
                                
                                $sql=" update tb_user";
                                $sql.=" set";
                                $sql.=" user_image='$user_image'";
                                $sql.=" , user_name='$user_name'";
                                $sql.=" , user_gender='$user_gender'";
                                $sql.=" , user_age='$user_age'";
                                $sql.=" ,user_tel='$user_tel'";
                                $sql.=" ,user_email='$user_email'";
                                $sql.=" ,user_passwd='$user_passwd'";
                                $sql.=" ,user_status='$user_status'";
                                $sql.=" where";
                                $sql.=" user_id=$user_id";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('แก้ไขข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_user.php');
                                }
                                else
                                {
                                    echo $cls_conn->show_message('แก้ไขข้อมูลไม่สำเร็จ');
                                    echo $sql;
                                }
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php include('footer.php');?>