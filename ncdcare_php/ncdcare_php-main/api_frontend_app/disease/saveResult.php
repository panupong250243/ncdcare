<?php 
include("../conn.php");

$symbolIdList = $_POST['symptomList'];
$symbolIdSet = explode(",",$symbolIdList);
$userId = $_POST['userId'];
$age = $_POST['age'];
$height = $_POST['height'];
$weight = $_POST['weight'];
$diseaseId = $_POST['diseaseId'];
$diseaseIdSet = explode(",",$diseaseId);
$score = $_POST['score'];
$scoreSet = explode(",",$score);
$imageResult = $_POST['imageResult'];
$sql = "INSERT INTO `tb_result`(`result_symbol`,result_age, `result_height`, `result_weight`,result_image_id,user_id) VALUES ('" . implode(',', $symbolIdSet) . "','$age','$height','$weight','$imageResult','$userId')";
// $result = mysqli_query($conn,$sql);
if(mysqli_query($conn,$sql)){
   $result_id = mysqli_insert_id($conn);
    for($i=0;$i<count($diseaseIdSet);$i++){
        $sqlget = "SELECT tb_question.symbol_id,max(tb_answer.answer_score) as max from tb_question join tb_answer on tb_question.question_id = tb_answer.question_id where disease_symbol_id = '".$diseaseIdSet[$i]."' GROUP BY tb_question.question_id";
        $queryget = mysqli_query($conn,$sqlget);
        $question = array();
        $max_score = 0;
        while($row = mysqli_fetch_assoc($queryget)){
            if(in_array($row['symbol_id'],$symbolIdSet)){
                $max_score += intval($row['max'])*2;
            }else{
                $max_score += intval($row['max']);
            }
        }
        $sql2 = "INSERT INTO `tb_result_detail`(`result_detail_score`,result_detail_max_score, `disease_symbol_id`, `result_id`) VALUES ('".$scoreSet[$i]."','".$max_score."','".$diseaseIdSet[$i]."','$result_id')";
        mysqli_query($conn,$sql2);
    }
    echo json_encode("$result_id");
}else{
    echo json_encode("0");
}

?>