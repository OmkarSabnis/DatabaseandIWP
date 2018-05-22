<html>
<head>
    <style type="text/css">
    .showdetails{
    position: relative;
    border: 3px solid black;
    top: 5%;
    text-align: center;
    background-color: #afbadc;
  }
  tr,td,th{
    border: 2px solid black;
    border-style: collapse;
    margin: 5px;
    padding: 5px;
    background-color: #f2dede;
    }
    th{
        background-color: black;
        color: white;
    }
    .showinfo{
    left:10%;
    top: 10%;
    position: relative;
  }
    .courseinfo{
        position: relative;
        left: 10%;
    }
    .submitter{
        position: relative;
        top: 50px;
        background-color: black;
        color: white;
        font: 20px Consolas;
    }
    </style>
    <script src="https://code.jquery.com/jquery-1.7.2.js" integrity="sha256-FxfqH96M63WENBok78hchTCDxmChGFlo+/lFIPcZPeI=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/divisioncontrol.js"></script>
</head>
<body>
<?php
if(isset($_POST["submit"]))
{
session_start();
$connect=mysqli_connect("localhost","root","");
$database=mysqli_select_db($connect, "iwp");
$username=$_SESSION['username'];
$review=$_SESSION['review'];
$studentid=$_SESSION['studentid'];
$courseid=$_SESSION['courseid'];
$target_dir = "QuestionUploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$FileType = pathinfo($target_file,PATHINFO_EXTENSION);
if (file_exists($target_file)) {
    $uploadOk = 0;
}
if ($_FILES["fileToUpload"]["size"] > 5000000) {
    $uploadOk = 0;
}
if($FileType != "docx" && $FileType != "doc" && $FileType != "pdf" ) {
    $uploadOk = 0;
}
if ($uploadOk == 0) {
    echo "<script type='text/javascript'>alert('Failed to upload.'); window.history.back();</script>";
}
else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "<script type='text/javascript'>alert('File uploaded.'); window.history.back();</script>";
        $query=mysqli_query($connect, "UPDATE reviews set QuestionPath='".$target_file."' where Course_ID='".$courseid."' and Assignment='".$review."';") or die("Failed to upload file");

    } else {
        echo "<script type='text/javascript'>alert('Failed to upload.'); window.history.back();</script>";
        $uploadOk=0;
    }
  }

}
else
{
    session_start();
	$connect=mysqli_connect("localhost","root","");
    $database=mysqli_select_db($connect, "iwp");
    $username=$_SESSION['username'];
    $studentid=$_POST['studentid'];
    $courseid=$_POST['courseid'];
    $review=$_POST['reviewno'];
    $_SESSION['studentid']=$studentid;
    $_SESSION['courseid']=$courseid;
    $_SESSION['review']=$review;
    echo '<h2>'.$review.' Details</h2>';
    echo '<form method="POST" enctype="multipart/form-data" action="reviewManagement.php">';
    echo '<table>
    		<thead>
    		<th>Question</th>
    		<th>Upload Question</th>
    		<th width="50%"">Answer</th>
    		</thead>';
    $row=mysqli_fetch_array(mysqli_query($connect,"SELECT * FROM Reviews where Student_ID = '$studentid' and Course_ID = '$courseid' and Assignment = '$review' ; "));
    $questionpath=$row['QuestionPath'];
    $answerpath=$row['AnswerPath'];
    $maxmark=$row['Max_Mark'];
    echo '<tr>';
    echo '<td><a href="download.php?filepath='.$questionpath.'" style="text-decoration:none;"> <img style="position: relative; left: 10px;" src="images/downloadicon.png" width=40px height=40px> </a></td>';
    echo '<td><input type="file" name="fileToUpload" value="Browse" required></td>';
    echo '<td> <a href="answer1.php?filepath2='.$answerpath.'" style="text-decoration:none;"> <img style="position: relative; left: 35px;" src="images/viewbutton.png" width=40px height=40px> </a></td>';
    echo '</table>';
    echo '<input type="submit" class="submitter" name="submit" value="Upload File">';
    echo '<br> <br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          </form> <br>
          Note: File should be less than 5 MB and only in pdf or doc format.<br> <br>
          <br> <br> <br>
          <form action="markupload.php" method="POST">
          <table>
          <thead>
          <th> Full Marks</td>
          <th> Enter scored marks</td>
          </thead>
          <tr>
          <td> '.$maxmark.' </td>
          <td><input type="text" name="marksender" required> </td>
          </tr>
          </table> ';

    $_SESSION['markusername']=$studentid;
    $_SESSION['markcourse']=$courseid;
    $_SESSION['markreview']=$review;

    echo  '<input type="submit" class="submitter" name="submitmarks" value="Upload Marks">
          </form>
          <br>
          <br> <br> <br> <br> <br>
          <form action="commentuploadTeacher.php" method="POST">
          <table>
          <tr>
          <td> <input type="text" style="width: 1000px;" name="commentsender" required> </td>
          </tr>
          </table>
          <input type="submit" value="Post Comment" name="submitcomment" class="submitter">
          </form>
          <br>
          <br>
          <br> <br> <br> <br>';
    $_SESSION['commentusername']=$studentid;
    $_SESSION['commentcourse']=$courseid;
    $_SESSION['commentreview']=$review;

    $studentcomment=empty($row["StudentComment"])? "None yet" : $row["StudentComment"];
    echo '<table>
          <tr>
          <td style="background-color: black; color: white;"> Comment by Student : </td>
          <td> '.$studentcomment.' </td>
          </tr>
          </table>';
}
?>
</body>
</html>

