<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="title">
                        <h2>เพิ่มข้อมูลคำแนะนำ
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
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adv_image">รูปปก</label>
                                    <input type="file" class="form-control" name="adv_image" id="adv_image" style="width: 425px;" required>
                                </div>
                                <br>
                                <div class="">
                                    <center><img src="../../upload/" alt="" width="150px" id="img" style="margin-top:10px;"></center>
                                    <script>
                                        adv_image.onchange = evt => {
                                            const [file] = adv_image.files
                                            if (file) {
                                                img.src = URL.createObjectURL(file)
                                            }
                                        }
                                    </script>
                                </div>
                            </div><br>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adv_name">ชื่อเรื่อง<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="adv_name" name="adv_name" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adv_detail">รายละเอียด<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea type="text" id="adv_detail" cols="20" rows="5" name="adv_detail" required="required" class="form-control col-md-7 col-xs-12"> </textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="adv_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select  id="adv_status" name="adv_status" required="required" class="form-control col-md-7 col-xs-12">
                                        <option value="0">เผยแพร่</option>
                                        <option value="1">ไม่เผยแพร่</option>
                                    </select>
                                </div>
                            </div>

                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="float:right">
                                    <button type="submit" name="submit" class="btn btn-success">บันทึก</button>
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
                                    move_uploaded_file($_FILES["adv_image"]["tmp_name"],"../../upload/".$adv_image);
                                }  
                                $adv_name=$_POST['adv_name'];
                                $adv_detail=$_POST['adv_detail'];
                                $adv_status=$_POST['adv_status'];
                                                                
                                $sql=" insert into `tb_advice`(`adv_image`, `adv_name`, `adv_detail`, `adv_status`)";
                                $sql.=" values ('$adv_image','$adv_name','$adv_detail','$adv_status')";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('บันทึกข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_advice.php');
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