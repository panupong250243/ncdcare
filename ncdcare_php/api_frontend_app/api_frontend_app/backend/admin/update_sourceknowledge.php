<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h3 style="border: 0;color:black">แก้ไขข้อมูลแหล่งความรู้</h3>
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
                                $sql=" select *  from tb_sourceknowledge";
                                $sql.=" where";
                                $sql.=" sourcek_id=$id";
                                $result=$cls_conn->select_base($sql);
                                while($row=mysqli_fetch_array($result))
                                {
                                    $sourcek_id=$row['sourcek_id'];
                                    $sourcek_image=$row['sourcek_image'];
                                    $sourcek_name=$row['sourcek_name'];
                                    $sourcek_url=$row['sourcek_url'];
                                    $sourcek_status=$row['sourcek_status'];
                                }
                            }
                        ?>

                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" enctype="multipart/form-data" style="border: 0;color:black">
                            <input type="hidden" name="sourcek_id" value="<?=$sourcek_id;?>" />
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sourcek_image">รูปปก<span class="required">:</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="file" id="sourcek_image" name="sourcek_image" value="<?= $sourcek_image; ?>" class="form-control col-md-7 col-xs-12">
                                    <div class="">
                                        <center><img src="../../upload/<?= $sourcek_image; ?>" alt="" height="100px" width="130px" id="img" style="margin-top:10px;"></center>
                                        <script>
                                            sourcek_image.onchange = evt => {
                                                const [file] = sourcek_image.files
                                                if (file) {
                                                    img.src = URL.createObjectURL(file)
                                                }
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div><br>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sourcek_name">ชื่อเรื่อง<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="sourcek_name" name="sourcek_name" value="<?=$sourcek_name;?>" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sourcek_url">URL<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="sourcek_url" name="sourcek_url" value="<?=$sourcek_url;?>" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sourcek_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="sourcek_status" name="sourcek_status" value="<?=$sourcek_status;?>" required="required" class="form-control col-md-7 col-xs-12">
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
                                $sourcek_image="";
                                if($_FILES["sourcek_image"]["name"] != ""){
                                    $datetime=date("dmYHis");
                                    $file_name=substr($_FILES['sourcek_image']['name'],-4);
                                    $sourcek_image=$datetime.'_p1'.$file_name;
                                    $target = "../../upload/" . $sourcek_image;
                                    move_uploaded_file($_FILES['sourcek_image']['tmp_name'], $target);
                                    $sql .= " ,sourcek_image='$sourcek_image'";
                                }  
                                $sourcek_name=$_POST['sourcek_name'];
                                $sourcek_status=$_POST['sourcek_status'];
                                
                                $sql=" update tb_sourceknowledge";
                                $sql.=" set";
                                $sql.=" sourcek_image='$sourcek_image'";
                                $sql.=" ,sourcek_name='$sourcek_name'";
                                $sql.=" ,sourcek_status='$sourcek_status'";
                                $sql.=" where";
                                $sql.=" sourcek_id=$sourcek_id";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('แก้ไขข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_sourceknowledge.php');
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