<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="title">
                        <h2>เพิ่มข้อมูลบทความ
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
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="content_image">รูปปก</label>
                                    <input type="file" class="form-control" name="content_image" id="content_image" style="width: 425px;" required>
                                </div>
                                <br>
                                <div class="">
                                    <center><img src="../../upload/" alt="" width="150px" id="img" style="margin-top:10px;"></center>
                                    <script>
                                        content_image.onchange = evt => {
                                            const [file] = content_image.files
                                            if (file) {
                                                img.src = URL.createObjectURL(file)
                                            }
                                        }
                                    </script>
                                </div>
                            </div><br>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="content_name">ชื่อเรื่อง<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="content_name" name="content_name" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="content_detail">รายละเอียด<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea type="text" id="content_detail" cols="20" rows="5" name="content_detail" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="content_status">สถานะ<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="content_status" name="content_status" required="required" class="form-control col-md-7 col-xs-12">
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
                                $content_image="";
                                if($_FILES["content_image"]["name"] != ""){
                                    $datetime=date("dmYHis");
                                    $file_name=substr($_FILES['content_image']['name'],-4);
                                    $content_image=$datetime.'_p1'.$file_name;
                                    move_uploaded_file($_FILES["content_image"]["tmp_name"],"../../upload/".$content_image);
                                }  
                                $content_name=$_POST['content_name'];
                                $content_detail=$_POST['content_detail'];
                                $content_status=$_POST['content_status'];
                            
                                $sql=" insert into `tb_content`(`content_image`, `content_name`, `content_detail`, `content_status`)";
                                $sql.=" values ('$content_image','$content_name','$content_detail','$content_status')";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('บันทึกข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_content.php');
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