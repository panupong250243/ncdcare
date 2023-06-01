<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h3 style="border: 0;color:black">แก้ไขข้อมูลคลังความรู้</h3>
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
                                $sql=" select * from tb_knowledgebase";
                                $sql.=" where";
                                $sql.=" knowb_id=$id";
                                $result=$cls_conn->select_base($sql);
                                while($row=mysqli_fetch_array($result))
                                {
                                    $knowb_id=$row['knowb_id'];
                                    $knowb_image=$row['knowb_image'];
                                    $knowb_name=$row['knowb_name'];
                                    $knowb_video=$row['knowb_video'];
                                    $knowb_status=$row['knowb_status'];
                                }
                            }
                        ?>

                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data" style="border: 0;color:black">
                            <input type="hidden" name="knowb_id" value="<?=$knowb_id;?>" />
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="knowb_image">รูปปก<span class="required">:</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="file" id="knowb_image" name="knowb_image" value="<?= $knowb_image; ?>" class="form-control col-md-7 col-xs-12">
                                    <div class="">
                                        <center><img src="../../upload/<?= $knowb_image; ?>" alt="" height="100px" width="130px" id="img" style="margin-top:10px;"></center>
                                        <script>
                                            knowb_image.onchange = evt => {
                                                const [file] = knowb_image.files
                                                if (file) {
                                                    img.src = URL.createObjectURL(file)
                                                }
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div><br>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="knowb_name">ชื่อเรื่อง<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="knowb_name" name="knowb_name" value="<?=$knowb_name;?>" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="knowb_video">วิดีโอ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea type="text" id="knowb_video" name="knowb_video" cols="20" rows="5" required="required" class="form-control col-md-7 col-xs-12"><?=$knowb_video;?></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="knowb_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="knowb_status" name="knowb_status" value="<?=$knowb_status;?>" required="required" class="form-control col-md-7 col-xs-12">
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
                                $knowb_image="";
                                if($_FILES["knowb_image"]["name"] != ""){
                                    $datetime=date("dmYHis");
                                    $file_name=substr($_FILES['knowb_image']['name'],-4);
                                    $knowb_image=$datetime.'_p1'.$file_name;
                                    $target = "../../upload/" . $knowb_image;
                                    move_uploaded_file($_FILES['knowb_image']['tmp_name'], $target);
                                    $sql .= " ,knowb_image='$knowb_image'";
                                }  
                                $knowb_name=$_POST['knowb_name'];
                                $knowb_video=$_POST['knowb_video'];
                                $knowb_status=$_POST['knowb_status'];
                                
                                $sql=" update tb_knowledgebase";
                                $sql.=" set";
                                $sql.=" knowb_image='$knowb_image'";
                                $sql.=" ,knowb_name='$knowb_name'";
                                $sql.=" ,knowb_video='$knowb_video'";
                                $sql.=" ,knowb_status='$knowb_status'";
                                $sql.=" where";
                                $sql.=" knowb_id=$knowb_id";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('แก้ไขข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_knowledgebase.php');
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