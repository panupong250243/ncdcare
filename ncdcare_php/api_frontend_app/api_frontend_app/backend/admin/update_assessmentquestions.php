<?php include('header.php');?>
    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="title">
                        <h3 style="border: 0;color:black">แก้ไขข้อมูลแบบประเมินความเสี่ยงโรค</h3>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a> </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div><hr>

                    <div class="x_content">
                    <br>
                        <?php
                            $id = $_GET['id'];
                            $sql= " select *,type_name from tb_assessmentquestions as a left join tb_type  t on t.type_id = a.aq_id";
                            $sql.=" where a.aq_id='$id'";
                            
                            $result = $cls_conn->select_base($sql);
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo json_decode($row['type_name']);
                                $aq_id = $row['aq_id'];
                                $aq_question = $row['aq_question'];
                                $aq_answer1=$row['aq_answer1'];
                                $aq_answer2=$row['aq_answer2'];
                                $aq_answer3=$row['aq_answer3'];
                                $aq_answer4=$row['aq_answer4'];
                                $type_id = $row['type_name'];
                        ?> 
                        <?php 
                            } 
                        ?>

                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" style="border: 0;color:black">                            <input type="hidden" name="aq_id" value="<?=$aq_id;?>" />
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="aq_question">คำถาม<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="aq_question" name="aq_question" value="<?=$aq_question;?>" required="required" class="form-control col-md-7 col-xs-12"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="type_id">ประเภท<span class="required"></span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="type_id" name="type_id" value="<?=$type_id;?>" required="required" class="form-control col-md-7 col-xs-12">
                                        <?php
                                            $sqld=" select * from tb_type";
                                            $resultd=$cls_conn->select_base($sqld);
                                            while($rowd=mysqli_fetch_array($resultd))
                                            {
                                        ?>
                                        <option value="<?=$rowd['type_id'];?>"><?=$rowd['type_name'];?></option>
                                        <?php
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="aq_answer1">คำตอบ 1 (3 คะแนน)<span class="required"></span> </label>
                                    <div class="col-md-6 col-sm-4 col-xs-12">
                                        <input type="text" id="aq_answer1" name="aq_answer1" value="<?=$aq_answer1;?>" required="required" class="form-control col-md-7 col-xs-12"> 
                                    </div>
                                </div>
                            </div>    

                            <div class="form-group">
                                <div class="row">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="aq_answer2">คำตอบ 2 (2 คะแนน)<span class="required"></span> </label>
                                    <div class="col-md-6 col-sm-4 col-xs-12">
                                        <input type="text" id="aq_answer2" name="aq_answer2" value="<?=$aq_answer2;?>" required="required" class="form-control col-md-7 col-xs-12">                                        
                                    </div>
                                </div>
                            </div>    

                            <div class="form-group">
                                <div class="row">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="aq_answer3">คำตอบ 3 (1 คะแนน)<span class="required"></span> </label>
                                    <div class="col-md-6 col-sm-4 col-xs-12">
                                        <input type="text" id="aq_answer3" name="aq_answer3" value="<?=$aq_answer3;?>" required="required" class="form-control col-md-7 col-xs-12"> 
                                    </div>
                                </div>
                            </div>    

                            <div class="form-group">
                                <div class="row">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="aq_answer4">คำตอบ 4 (0 คะแนน)<span class="required"></span> </label>
                                    <div class="col-md-6 col-sm-4 col-xs-12">
                                        <input type="text" id="aq_answer4" name="aq_answer4" value="<?=$aq_answer4;?>" required="required" class="form-control col-md-7 col-xs-12"> 
                                    </div>
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
                                $aq_question=$_POST['aq_question'];
                                $type_id=$_POST['type_id'];
                                $aq_answer1=$_POST['aq_answer1'];
                                $aq_answer2=$_POST['aq_answer2'];
                                $aq_answer3=$_POST['aq_answer3'];
                                $aq_answer4=$_POST['aq_answer4'];
                                                                
                                $sql=" update tb_assessmentquestions";
                                $sql.=" set";
                                $sql.=" aq_question='$aq_question'";
                                $sql.=" ,type_id='$type_id'";
                                $sql.=" ,aq_answer1='$aq_answer1'";
                                $sql.=" ,aq_answer2='$aq_answer2'";
                                $sql.=" ,aq_answer3='$aq_answer3'";
                                $sql.=" ,aq_answer4='$aq_answer4'";
                                $sql.=" where";
                                $sql.=" aq_id=$aq_id";
                                
                                if($cls_conn->write_base($sql)==true)
                                {
                                    echo $cls_conn->show_message('บันทึกข้อมูลสำเร็จ');
                                    echo $cls_conn->goto_page(1,'show_assessmentquestions.php');
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