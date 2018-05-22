    <?php
session_start();
if(isset($_POST["submit"]))
{
$target_dir = "AnswerUploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$FileType = pathinfo($target_file,PATHINFO_EXTENSION);
if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    echo '<br>';
    $uploadOk = 0;
}
if ($_FILES["fileToUpload"]["size"] > 5000000) {
    echo "Sorry, your file is too large.";
    echo '<br>';
    $uploadOk = 0;
}
if($FileType != "docx" && $FileType != "doc" && $FileType != "pdf" ) {
    echo "Sorry, only DOC & PDF files are allowed.";
    echo '<br>';
    $uploadOk = 0;
}
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
    echo '<br>';
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "The file has been uploaded.";
        echo '<br>';
    } else {
        echo "Sorry, there was an error uploading your file.";
        echo '<br>';
        $uploadOk=0;
    }
  }
}
?>
