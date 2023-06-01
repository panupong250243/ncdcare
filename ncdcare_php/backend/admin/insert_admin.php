<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="title">
                        <h2>เพิ่มข้อมูลผู้ดูแลระบบ
                            <ul class="nav navbar-right panel_toolbox" >
                                <li><a class="close-link"><i class="fa fa-close"></i></a> </li>
                            </ul>
                        </h2>
                    </div><hr>

                    <div class="x_content">
                        <br>
                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post"> 
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="admin_name">ชื่อ-นามสกุล<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="admin_name" name="admin_name" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="admin_email">อีเมล<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="email" id="admin_email" name="admin_email" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="admin_tell">เบอร์โทรศัพท์<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="tel" id="admin_tel" name="admin_tel" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>
                                    
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="admin_passwd">รหัสผ่าน<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" id="admin_passwd" name="admin_passwd" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>       

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="admin_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="admin_status" name="admin_status" required="required" class="form-control col-md-7 col-xs-12">
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
                                $admin_name=$_POST['admin_name'];
                                $admin_email=$_POST['admin_email'];
                                $admin_tel=$_POST['admin_tel'];
                                $admin_passwd=$_POST['admin_passwd'];
                                $admin_status=$_POST['admin_status'];
                                                                
                                $sql=" insert into `tb_admin`(`admin_name`, `admin_email`, `admin_tel`, `admin_passwd`, `admin_status`)";
                                $sql.=" values ('$admin_name','$admin_email','$admin_tel','$admin_passwd','$admin_status')";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('บันทึกข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_admin.php');
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