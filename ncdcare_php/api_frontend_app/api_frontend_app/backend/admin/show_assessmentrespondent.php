<?php include('header.php');?>
    <div class="right_col" role="main">
        <h3 style="border: 0;color:black"><b>จัดการข้อมูลผลการตอบแบบประเมินพฤติกรรมความเสี่ยงโรค</b></h3><br>
            <div class="x_panel" style="color:black">
                <div class="x_content">
                    <p class="text-muted font-13 m-b-30">
                        <table id="datatable-buttons" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th style="text-align:center;width:80px">ลำดับ</th>
                                    <th style="text-align:center;">รหัสผู้ใช้งาน</th>
                                    <th style="text-align:center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">ประเภทโรค</button>
                                            <ul class="dropdown-menu">
                                                <?php
                                                    $sql = " SELECT * from  tb_type";
                                                    $result = $cls_conn->select_base($sql);
                                                    if ($result->num_rows > 0) {
                                                        while ($row = $result->fetch_assoc()) {
                                                ?>
                                                <li><a class="dropdown-item"><?php echo $row['type_name'] ?></a></li>
                                                <?php
                                                    }
                                                } ?>
                                            </ul>
                                        </div>
                                    </th>
                                    <th style="text-align:center">คำถาม</th>
                                    <th style="text-align:center">คะแนน</th>
                                    <th style="text-align:center;width:80px">จัดการ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $sql = " SELECT * from tb_assessmentrespondent inner join tb_type on tb_assessmentrespondent.type_id =tb_type.type_id";
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
                                    <td style="text-align:left">
                                        <?= $row['type_name'];?>
                                    </td>
                                    <td>
                                        <?=$row['aq_id'];?>
                                    </td>
                                    <td>
                                        <?=$row['ar_score'];?>
                                    </td>
                                    <td>
                                        <a href="delete_assessmentrespondent.php?id=<?=$row['ar_id'];?>" onclick="return confirm('คุณต้องการลบใช่หรือไม่?')"><img src="../../backend/template/image/delete.png" width="20px" height="20px"/></a>
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
