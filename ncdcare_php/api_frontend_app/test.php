<?php 
//con
    $get = $_GET['get'];
    $array = $get.str_split(",");
    $result = array();
    for($i=0;$i<count($array);$i++){
        $dis = $array[$i];
        $sql = "where ez = '$dis' sort by ramdom liml 2";
        $run = $sql + $con;
        while($net = mysqli_fetch_array($run)){
            $result[] = $net;
        }
    }

    echo json_encode($result);

?>