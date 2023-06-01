<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="title">
                        <h2>เพิ่มข้อมูลโรค
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
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dis_image">รูปปก</label>
                                    <input type="file" class="form-control" name="dis_image" id="dis_image" style="width: 425px;" required>
                                </div>
                                <br>
                                <div class="">
                                    <center><img src="../../upload/" alt="" width="150px" id="img" style="margin-top:10px;"></center>
                                    <script>
                                        dis_image.onchange = evt => {
                                            const [file] = dis_image.files
                                            if (file) {
                                                img.src = URL.createObjectURL(file)
                                            }
                                        }
                                    </script>
                                </div>
                            </div><br>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dis_name">ชื่อเรื่อง<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="dis_name" name="dis_name" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dis_detail">รายละเอียด<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea type="text" id="dis_detail" cols="20" rows="5" name="dis_detail" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dis_type">ประเภท<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="dis_type" name="dis_type" required="required" class="form-control col-md-7 col-xs-12">
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
                                    <select  id="dis_status" name="dis_status" required="required" class="form-control col-md-7 col-xs-12">
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
                                $dis_image="";
                                if($_FILES["dis_image"]["name"] != ""){
                                    $datetime=date("dmYHis");
                                    $file_name=substr($_FILES['dis_image']['name'],-4);
                                    $dis_image=$datetime.'_p1'.$file_name;
                                    move_uploaded_file($_FILES["dis_image"]["tmp_name"],"../../upload/".$dis_image);
                                }  
                                $dis_name=$_POST['dis_name'];
                                $dis_detail=$_POST['dis_detail'];
                                $dis_type=$_POST['dis_type'];
                                $dis_status=$_POST['dis_status'];
                                                                    
                                $sql=" insert into `tb_disease`(`dis_image`, `dis_name`, `dis_detail`, `dis_type` ,`dis_status`)";
                                $sql.=" values ('$dis_image','$dis_name','$dis_detail','$dis_type','$dis_status')";
                                    
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('บันทึกข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_disease.php');
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