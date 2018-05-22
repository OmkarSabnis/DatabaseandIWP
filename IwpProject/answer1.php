<?php
    $answerpath=$_GET['filepath2'];
    if(empty($answerpath))
        $answerpath='AnswerUploads/notfound.pdf';
    header("Content-disposition: attachment; filename=$answerpath");
    header("Content-type: application/pdf");
    readfile($answerpath);
    header("reviewManagement.php");
?>