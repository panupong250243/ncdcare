<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h3 style="border: 0;color:black">แก้ไขข้อมูลคำแนะนำ</h3>
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
                                $sql=" select *  from tb_advice";
                                $sql.=" where";
                                $sql.=" adv_id=$id";
                                $result=$cls_conn->select_base($sql);
                                while($row=mysqli_fetch_array($result))
                                {
                                    $adv_id=$row['adv_id'];
                                    $adv_image=$row['adv_image'];
                                    $adv_name=$row['adv_name'];
                                    $adv_detail=$row['adv_detail'];
                                    $adv_status=$row['adv_status'];
                                }
                            }
                        ?>

                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data" style="border: 0;color:black"> 
                            <input type="hidden" name="adv_id" value="<?=$adv_id;?>" />
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adv_image">รูปปก<span class="required">:</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="file" id="adv_image" name="adv_image" value="<?= $adv_image; ?>" class="form-control col-md-7 col-xs-12">
                                    <div class="">
                                        <center><img src="../../upload/<?= $adv_image; ?>" alt="" height="100px" width="150px" id="img" style="margin-top:10px;"></center>
                                        <script>
                                            adv_image.onchange = evt => {
                                                const [file] = adv_image.files
                                                if (file) {
                                                    img.src = URL.createObjectURL(file)
                                                }
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div><br>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adv_name">ชื่อเรื่อง<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="adv_name" name="adv_name" value="<?=$adv_name;?>" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adv_detail">รายละเอียด<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea type="text" id="adv_detail" cols="20" rows="5" name="adv_detail" required="required" class="form-control col-md-7 col-xs-12"><?= $adv_detail;?></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adv_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select  id="adv_status" name="adv_status" value="<?=$adv_status;?>" required="required" class="form-control col-md-7 col-xs-12">
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
                            </div>
                        </form>

                        <?php
                            if(isset($_POST['submit']))
                            {
                                $adv_image=""; 
                                if($_FILES["adv_image"]["name"] != ""){
                                    $datetime=date("dmYHis");
                                    $file_name=substr($_FILES['adv_image']['name'],-4);
                                    $adv_image=$datetime.'_p1'.$file_name;
                                    $target = "../../upload/" . $adv_image;
                                    move_uploaded_file($_FILES['adv_image']['tmp_name'], $target);
                                    $sql .= " ,adv_image='$adv_image'";
                                }  
                                $adv_name=$_POST['adv_name'];
                                $adv_detail=$_POST['adv_detail'];
                                $adv_status=$_POST['adv_status'];

                                $sql=" update tb_advice";
                                $sql.=" set";
                                $sql.=" adv_image='$adv_image'";
                                $sql.=" ,adv_name='$adv_name'";
                                $sql.=" ,adv_detail='$adv_detail'";
                                $sql.=" ,adv_status='$adv_status'";
                                $sql.=" where";
                                $sql.=" adv_id=$adv_id";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('แก้ไขข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_advice.php');
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