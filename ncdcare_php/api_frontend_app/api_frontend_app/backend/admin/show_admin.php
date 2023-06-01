<?php include('header.php');?>
    <div class="right_col" role="main">
        <h3 style="border: 0;color:black"><b>ผู้ดูแลระบบ</b></h3><br>
            <div class="x_panel" style="color:black">
                <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                        <div style="text-align:left">
                            <a href="insert_admin.php" style="float:right">
                                <input type="button" class="btn btn-success" value="+ เพิ่มข้อมูลผู้ดูแลระบบ">
                            </a>
                        </div><br>

                        <table id="datatable-buttons" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th style="text-align:center;width:80px">ลำดับ</th>
                                    <th style="text-align:center">ชื่อ</th>
                                    <th style="text-align:center">อีเมล</th>
                                    <th style="text-align:center">เบอร์โทรศัพท์</th>
                                    <th style="text-align:center">รหัสผ่าน</th>
                                    <th style="text-align:center;width:80px">สถานะ</th>
                                    <th style="text-align:center;width:80px">จัดการ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $sql=" select * from tb_admin";
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
                                        <?=$row['admin_name'];?>
                                    </td>
                                    <td>
                                        <?=$row['admin_email'];?>
                                    </td>
                                    <td>
                                        <?=$row['admin_tel'];?>
                                    </td>
                                    <td>
                                        <?=$row['admin_passwd'];?>
                                    </td>
                                    <td>
                                        <?php
                                            if ($row['admin_status'] == 0) {
                                        ?>
                                            <span style="color:green;">อนุมัติ</span>
                                        <?php
                                            } else {
                                        ?>
                                            <span style="color:red;">ไม่อนุมัติ</span>
                                        <?php
                                            }
                                        ?>
                                    </td>
                                    <td>
                                        <a href="update_admin.php?id=<?=$row['admin_id'];?>" onclick="return confirm('คุณต้องการแก้ไขใช่หรือไม่?')"><img src="../../backend/template/image/edit.png" width="20px" height="20px"/></a>
                                        <a href="delete_admin.php?id=<?=$row['admin_id'];?>" onclick="return confirm('คุณต้องการลบใช่หรือไม่?')"><img src="../../backend/template/image/delete.png" width="20px" height="20px" /></a>
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
