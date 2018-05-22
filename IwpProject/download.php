<?php
    $questionpath=$_GET['filepath'];
    if(empty($questionpath))
        $questionpath='QuestionUploads/notfound.pdf';
    header("Content-disposition: attachment; filename=$questionpath");
    header("Content-type: application/pdf");
    readfile($questionpath);
    header("projectmanagement.php");
?>