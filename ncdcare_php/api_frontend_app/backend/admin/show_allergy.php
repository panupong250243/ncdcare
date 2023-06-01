<?php include('header.php');?>
    <div class="right_col" role="main">
        <h3 style="border: 0;color:black"><b>จัดการข้อมูลแพ้ยา</b></h3><br>
            <div class="x_panel" style="color:black">
                <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                        <div style="text-align:left">
                            <a href="insert_allergy.php" style="float:right">
                                <input type="button" class="btn btn-success" value="+ เพิ่มข้อมูลแพ้ยา">    
                            </a>
                        </div><br>

                        <table id="datatable-buttons" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th style="text-align:center;width:80px">ลำดับ</th>
                                    <th style="text-align:center;width:80px">รหัสผู้ใช้งาน</th>
                                    <th style="text-align:center;width:200px">ชื่อยาที่แพ้</th>
                                    <th style="text-align:center">อาการ</th>
                                    <th style="text-align:center;width:80px">จัดการ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $sql=" select * from tb_allergy";
                                    $item = 1;
                                    $result=$cls_conn->select_base($sql);
                                    while($row=mysqli_fetch_array($result))
                                    {
                                ?>
                                <tr style="text-align:center">
                                    <td>
                                        <?=$item?>
                                    </td>
                                    <td>
                                        <?=$row['user_id'];?>
                                    </td>
                                    <td>
                                        <?=$row['al_name'];?>
                                    </td>
                                    <td>
                                        <?=$row['al_symptom'];?>
                                    </td>
                                    <td>
                                        <a href="update_allergy.php?id=<?=$row['al_id'];?>" onclick="return confirm('คุณต้องการแก้ไขใช่หรือไม่?')"><img src="../../backend/template/image/edit.png" width="20px" height="20px" /></a>
                                        <a href="delete_allergy.php?id=<?=$row['al_id'];?>" onclick="return confirm('คุณต้องการลบใช่หรือไม่?')"><img src="../../backend/template/image/delete.png" width="20px" height="20px"/></a>
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
