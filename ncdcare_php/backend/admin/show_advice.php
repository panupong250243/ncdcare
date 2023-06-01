<?php include('header.php');?>
    <div class="right_col" role="main">
        <h3 style="border: 0;color:black"><b>จัดการคำแนะนำ</b></h3><br>
            <div class="x_panel" style="color:black">
                <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                        <div style="text-align:left">
                            <a href="insert_advice.php" style="float:right">
                                <input type="button" class="btn btn-success" value="+ เพิ่มข้อมูลคำแนะนำ">   
                            </a>
                        </div><br>

                        <table id="datatable-buttons" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th style="text-align:center;width:80px">ลำดับ</th>
                                    <th style="text-align:center;width:150px">รูปปก</th>
                                    <th style="text-align:center;width:180px">ชื่อเรื่อง</th>
                                    <th style="text-align:center">รายละเอียด</th>
                                    <th style="text-align:center;width:100px">สถานะ</th>
                                    <th style="text-align:center;width:80px">จัดการ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $sql=" select * from tb_advice";
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
                                        <img src="../../upload/<?= $row['adv_image'];?>" style="width:80px;height:70px;">
                                    </td>
                                    <td>
                                        <?=$row['adv_name'];?>
                                    </td>
                                    <td cols="20" rows="5">
                                        <?=$row['adv_detail'];?>
                                    </td>
                                    <td>
                                        <?php
                                            if ($row['adv_status'] == 0) {
                                        ?>
                                            <span style="color:green;">เผยแพร่</span>
                                        <?php
                                            } else {
                                        ?>
                                            <span style="color:red;">ไม่เผยแพร่</span>
                                        <?php
                                            }
                                        ?>
                                    </td>
                                    <td>
                                        <a href="update_advice.php?id=<?=$row['adv_id'];?>" onclick="return confirm('คุณต้องการแก้ไขใช่หรือไม่?')"><img src="../../backend/template/image/edit.png" width="20px" height="20px" /></a>
                                        <a href="delete_advice.php?id=<?=$row['adv_id'];?>" onclick="return confirm('คุณต้องการลบหรือไม่?')"><img src="../../backend/template/image/delete.png" width="20px" height="20px"/></a>
                                    </td>
                                </tr>
                                <?php
                                    $item++; 
                                }
                                ?>
                            </tbody> 
                        </table>
                    </p>
                </div>
            </div>
    </div>
<?php include('footer.php');?>
