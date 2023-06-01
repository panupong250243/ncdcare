<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="title">
                    <h2>เพิ่มข้อมูลผู้ใช้งาน
                            <ul class="nav navbar-right panel_toolbox" >
                                <li><a class="close-link"><i class="fa fa-close"></i></a> </li>
                            </ul>
                        </h2>
                    </div><hr>

                    <div class="x_content">
                        <br>
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <div class="">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_image">รูปภาพ</label>
                                    <input type="file" class="form-control" name="user_image" id="user_image" style="width: 425px;" required>
                                </div>
                                <br>
                                <div class="">
                                    <center><img src="../../upload/" alt="" width="150px" id="img" style="margin-top:10px;"></center>
                                    <script>
                                        user_image.onchange = evt => {
                                            const [file] = user_image.files
                                            if (file) {
                                                img.src = URL.createObjectURL(file)
                                            }
                                        }
                                    </script>
                                </div>
                            </div><br>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_name">ชื่อ-นามสกุล<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="user_name" name="user_name" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_gender">เพศ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="user_gender" name="user_gender" required="required" class="form-control col-md-7 col-xs-12">
                                        <option value="0">ชาย</option>
                                        <option value="1">หญิง</option>
                                        <option value="2">ไม่ระบุ</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_age">อายุ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="user_age" name="user_age" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_email">อีเมล<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="email" id="user_email" name="user_email" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_tel">เบอร์โทรศัพท์<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="tel" id="user_tel" name="user_tel" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>
                                    
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_passwd">รหัสผ่าน<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" id="user_passwd" name="user_passwd" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>     

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="user_status" name="user_status" required="required" class="form-control col-md-7 col-xs-12">
                                        <option value="0">อนุมัติ</option>
                                        <option value="1">ไม่อนุมัติ</option>
                                    </select>
                                </div>
                            </div>    

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="float:right">
                                    <button type="reset" name="reset" class="btn btn-secondary">ยกเลิก</button>
                                    <button type="submit" name="submit" class="btn btn-success">บันทึก</button>
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
                                    move_uploaded_file($_FILES["user_image"]["tmp_name"],"../../upload/".$user_image);
                                }  
                                
                                $user_name=$_POST['user_name'];
                                $user_gender=$_POST['user_gender'];
                                $user_age=$_POST['user_age'];
                                $user_email=$_POST['user_email'];
                                $user_tel=$_POST['user_tel'];
                                $user_passwd=$_POST['user_passwd'];
                                $user_status=$_POST['user_status'];
                                
                                $sql=" insert into `tb_user`(`user_image`, `user_name` ,`user_gender` ,`user_age` , `user_email` , `user_tel` , `user_passwd` , `user_status` )";
                                $sql.=" values ('$user_image', '$user_name','$user_gender','$user_age', '$user_email' , '$user_tel', '$user_passwd', '$user_status')"; 
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('บันทึกข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_user.php');
                                }
                                else
                                {
                                    echo $cls_conn->show_message('บันทึกข้อมูลไม่สำเร็จ');
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