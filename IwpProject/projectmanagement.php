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
    .uploadmanage{
        position: relative;
        left: 10%;
    }
    .submitter{
      width: 250px;
      height: 40px;
      background-color: black;
      color: white;
      font: 20px Consolas;
      position: relative;
      left: 10%;
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
$userid=$_POST['userid'];
$courseid=$_POST['courseid'];
$coursename=$_POST['coursename'];
$coursecredit=$_POST['coursecredit'];
$coursetype=$_POST['coursetype'];
$courseslot=$_POST['courseslot'];
$assignmentid=$_POST['assignmentid'];
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
if($FileType != "docx" && $FileType != "doc" && $FileType != ".pdf" ) {
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
        $query=mysqli_query($connect, "UPDATE reviews set AnswerPath='".$target_file."' where Course_ID='".$courseid."' and Assignment='".$review."' and Student_ID='".$userid."';") or die("Failed to upload file");

    } else {
        echo "Sorry, there was an error uploading your file.";
        echo '<br>';
        $uploadOk=0;
    }
  }
}
else
{

  session_start();
  $connect=mysqli_connect("localhost","root","");
  $database=mysqli_select_db($connect, "iwp");
      $userid=$_POST['userid'];
      $courseid=$_POST['courseid'];
      $coursename=$_POST['coursename'];
      $coursecredit=$_POST['coursecredit'];
      $coursetype=$_POST['coursetype'];
      $courseslot=$_POST['courseslot'];
      $assignmentid=$_POST['assignmentid'];

      $_SESSION['userid']=$userid;
      $_SESSION['courseid']=$courseid;
      $_SESSION['coursename']=$coursename;
      $_SESSION['coursecredit']=$coursecredit;
      $_SESSION['coursetype']=$coursetype;
      $_SESSION['courseslot']=$courseslot;
      $_SESSION['assignmentid']=$assignmentid;

  echo '<div class="showdetails"> Course Activities </div>
          <br> <br> <br> <br>
          <table class="courseinfo">
          <thead>
          <th> Course ID </th>
          <th> Course Name </th>
          <th> Type </th>
          <th> Credit </th>
          <th> Slot </th>
          </thead>
          <tr>
          <td> '.$courseid.' </td>
          <td> '.$coursename.'</td>
          <td> '.$coursetype.' </td>
          <td> '.$coursecredit.' </td>
          <td> '.$courseslot.' </td>
          </tr>
          </table>';
    echo '<br> <br> <br>';

    echo '<form method="POST" enctype="multipart/form-data" action="projectmanagement.php">
          <table class="uploadmanage">
          <thead>
          <th> Assignment </th>
          <th> Question </th>
          <th> Upload Answer </th>
          <th> View Answer </th>';
          $row=mysqli_fetch_array(mysqli_query($connect,"SELECT * FROM Reviews where Student_ID = '$userid' and Course_ID = '$courseid' and Assignment = '$assignmentid' ; "));
          $questionpath=$row['QuestionPath'];
          $answerpath=$row['AnswerPath'];

    echo '<tr>
          <td> '.$assignmentid.' </td>
          <td> <a href="download.php?filepath='.$questionpath.'" style="text-decoration:none;"> <img style="position: relative; left: 10px;" src="images/downloadicon.png" width=40px height=40px> </a> </td>
          <td> <input type="file" name="fileToUpload" value="Browse"></td>';
          $answerpath=$row['AnswerPath'];
    echo  '<td> <a href="answerview.php?filepath2='.$answerpath.'" style="text-decoration:none;"> <img style="position: relative; left: 35px;" src="images/viewbutton.png" width=40px height=40px> </a> </td>
          </tr>
          </table>
          <br> <br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          Note: File should be less than 5 MB and only in pdf or doc format.<br> <br>
          <input type="submit" class="submitter" name="submit" value="Upload File">
          </form>
          <br> <br> <br> <br>
          <form action="commentuploadStudent.php" method="POST">
          <table>
          <tr>
          <td> <input type="text" style="width: 1000px;" name="commentsender" required> </td>
          </tr>
          </table>
          <br>
          <br>
          <input type="submit" value="Post Comment" name="submitcomment" class="submitter">
          </form>
          <br> <br> <br> <br>';
    $_SESSION['commentusername']=$userid;
    $_SESSION['commentcourse']=$courseid;
    $_SESSION['commentreview']=$assignmentid;

    $teachercomment=empty($row["TeacherComment"])? "None yet" : $row["TeacherComment"];
    echo '<table>
          <tr>
          <td style="background-color: black; color: white; "> Comment by Teacher : </td>
          <td> '.$teachercomment.' </td>
          </tr>
          </table>';
}

?>

</body>
</html>