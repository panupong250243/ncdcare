<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h3 style="border: 0;color:black">แก้ไขข้อมูลเกี่ยวกับ</h3>
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
                                $sql=" select *  from tb_contactus";
                                $sql.=" where";
                                $sql.=" contact_id=$id";
                                $result=$cls_conn->select_base($sql);
                                while($row=mysqli_fetch_array($result))
                                {
                                    $contact_id=$row['contact_id'];
                                    $contact_image=$row['contact_image'];
                                    $contact_name=$row['contact_name'];
                                    $contact_url=$row['contact_url'];
                                    $contact_status=$row['contact_status'];
                                }
                            }
                        ?>

                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data" style="border: 0;color:black">
                            <input type="hidden" name="contact_id" value="<?=$contact_id;?>" />
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contact_image">รูปปก<span class="required">:</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="file" id="contact_image" name="contact_image" value="<?= $contact_image; ?>" class="form-control col-md-7 col-xs-12">
                                    <div class="">
                                        <center><img src="../../upload/<?= $contact_image; ?>" alt="" height="100px" width="130px" id="img" style="margin-top:10px;"></center>
                                        <script>
                                            contact_image.onchange = evt => {
                                                const [file] = contact_image.files
                                                if (file) {
                                                    img.src = URL.createObjectURL(file)
                                                }
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div><br>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contact_name">ชื่อเรื่อง<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="contact_name" name="contact_name" value="<?=$contact_name;?>" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contact_url">URL<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="contact_url" name="contact_url" value="<?=$contact_url;?>"  required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contact_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select  id="contact_status" name="contact_status" value="<?=$contact_status;?>" required="required" class="form-control col-md-7 col-xs-12">
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
                                $contact_image="";
                                if($_FILES["contact_image"]["name"] != ""){
                                    $datetime=date("dmYHis");
                                    $file_name=substr($_FILES['contact_image']['name'],-4);
                                    $contact_image=$datetime.'_p1'.$file_name;
                                    move_uploaded_file($_FILES["contact_image"]["tmp_name"],"../../upload/".$contact_image);
                                    $sql .= " ,contact_image='$contact_image'";
                                }  
                                if($_FILES["contact_image"]["name"] != ""){
                                    $datetime=date("dmYHis");
                                    $file_name=substr($_FILES['contact_image']['name'],-4);
                                    $adv_image=$datetime.'_p1'.$file_name;
                                    $target = "../../upload/" . $contact_image;
                                    move_uploaded_file($_FILES['contact_image']['tmp_name'], $target);
                                    $sql .= " ,contact_image='$contact_image'";
                                }  
                                $contact_name=$_POST['contact_name'];
                                $contact_url=$_POST['contact_url'];
                                $contact_status=$_POST['contact_status'];
                                
                                $sql=" update tb_contactus";
                                $sql.=" set";
                                $sql.=" contact_image='$contact_image'";
                                $sql.=" ,contact_name='$contact_name'";
                                $sql.=" ,contact_url='$contact_url'";
                                $sql.=" ,contact_status='$contact_status'";
                                $sql.=" where";
                                $sql.=" contact_id=$contact_id";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('แก้ไขข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_contactus.php');
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