<?php include('header.php');?>
    <div class="right_col" role="main">
        <h3 style="border: 0;color:black"><b>จัดการข้อมูลคำถามโรค</b></h3><br>
            <div class="x_panel" style="color:black">
                <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                        <div style="text-align:left">
                            <a href="insert_diseasequestion.php" style="float:right">
                                <input type="button" class="btn btn-success" value="+ เพิ่มคำถาม">
                            </a>
                        </div><br>

                        <div>
                            <input type="button" name="all" value="ทั้งหมด">
                            <input type="button" name="all" value="โรคบาหวาน">   
                            <input type="button" name="all" value="โรคอ้วนลงพุง">     
                            <input type="button" name="all" value="โรคถุงลมโป่งพอง">  
                            <input type="button" name="all" value="โรคหลอดเลือดสมอง">     
                            <input type="button" name="all" value="โรคความดันโลหิตสูง">     
                        </div>

                        <table id="datatable-buttons" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>ลำดับ</th>
                                    <th>คำถามโรค</th>
                                    <th>โรค</th>
                                    <th width="80px">จัดการ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $sql=" select * from tb_diseasequestion";
                                    $item = 1;
                                    $result=$cls_conn->select_base($sql);
                                    while($row=mysqli_fetch_array($result))
                                    {
                                ?>
                                <tr>
                                    <td>
                                        <?=$item?> 
                                    </td>
                                    <td>
                                        <?=$row['disq_question'];?>
                                    </td>
                                    <td>
                                        <?=$row['disq_type'];?>
                                    </td>
                                    <td>
                                        <a href="update_diseasequestion.php?id=<?=$row['disq_id'];?>" onclick="return confirm('คุณต้องการแก้ไขใช่หรือไม่?')"><img src="../../backend/template/image/edit.png" width="20px" height="20px" /></a>
                                        <a href="delete_diseasequestion.php?id=<?=$row['disq_id'];?>" onclick="return confirm('คุณต้องการลบใช่หรือไม่?')"><img src="../../backend/template/image/delete.png" width="20px" height="20px"/></a>
                                    </td>
                                </tr>
                                <?php
                                    $item++; }
                                ?>
                            </tbody> 
                        </table>
                    </p>
                </div>
            </div>
    </div>
<?php include('footer.php');?>
