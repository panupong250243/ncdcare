<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h3 style="border: 0;color:black">แก้ไขข้อมูลโรค</h3>
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
                                $sql=" select *  from tb_disease";
                                $sql.=" where";
                                $sql.=" dis_id=$id";
                                $result=$cls_conn->select_base($sql);
                                while($row=mysqli_fetch_array($result))
                                {
                                    $dis_id=$row['dis_id'];
                                    $dis_image=$row['dis_image'];
                                    $dis_name=$row['dis_name'];
                                    $dis_detail=$row['dis_detail'];
                                    $dis_status=$row['dis_status'];
                                }
                            }
                        ?>

                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data" style="border: 0;color:black">
                            <input type="hidden" name="dis_id" value="<?=$dis_id;?>" />
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dis_image">รูปปก<span class="required">:</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="file" id="dis_image" name="dis_image" value="<?= $dis_image; ?>" class="form-control col-md-7 col-xs-12">
                                    <div class="">
                                        <center><img src="../../upload/<?= $dis_image; ?>" alt="" height="100px" width="130px" id="img" style="margin-top:10px;"></center>
                                        <script>
                                            dis_image.onchange = evt => {
                                                const [file] = dis_image.files
                                                if (file) {
                                                    img.src = URL.createObjectURL(file)
                                                }
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div><br>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dis_name">ชื่อเรื่อง<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="dis_name" name="dis_name" value="<?=$dis_name;?>" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dis_detail">รายละเอียด<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea type="text" id="dis_detail" cols="20" rows="5" name="dis_detail" required="required" class="form-control col-md-7 col-xs-12"><?=$dis_detail;?></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dis_type">ประเภท<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="dis_type" name="dis_type" value="<?=$dis_type;?>" required="required" class="form-control col-md-7 col-xs-12">
                                        <option value="0">โรคอ้วนลงพุง</option>
                                        <option value="1">โรคเบาหวาน</option>
                                        <option value="2">โรคถุงลมโป่งพอง</option>
                                        <option value="3">โรคความดันโลหิตสูง</option>
                                        <option value="4">โรคหลอดเลือดในสมอง</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dis_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select  id="dis_status" name="dis_status" value="<?=$dis_status;?>" required="required" class="form-control col-md-7 col-xs-12">
                                        <option value="0">เผยแพร่</option>
                                        <option value="1">ไม่เผยแพร่</option>
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
                                $dis_image=""; 
                                if($_FILES["dis_image"]["name"] != ""){
                                    $datetime=date("dmYHis");
                                    $file_name=substr($_FILES['dis_image']['name'],-4);
                                    $dis_image=$datetime.'_p1'.$file_name;
                                    $target = "../../upload/" . $dis_image;
                                    move_uploaded_file($_FILES['dis_image']['tmp_name'], $target);
                                    $sql .= " ,dis_image='$dis_image'";
                                }  
                                $dis_name=$_POST['dis_name'];
                                $dis_type=$_POST['dis_type'];
                                $dis_detail=$_POST['dis_detail'];

                                $dis_status=$_POST['dis_status'];
                                
                                $sql=" update tb_disease";
                                $sql.=" set";
                                $sql.=" dis_image='$dis_image'";
                                $sql.=" ,dis_name='$dis_name'";
                                $sql.=" ,dis_detail='$dis_detail'";
                                $sql.=" ,dis_type='$dis_type'";
                                $sql.=" ,dis_status='$dis_status'";
                                $sql.=" where";
                                $sql.=" dis_id=$dis_id";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('แก้ไขข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_disease.php');
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