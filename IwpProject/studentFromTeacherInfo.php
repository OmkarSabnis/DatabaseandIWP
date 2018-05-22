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
    </style>
    <script src="https://code.jquery.com/jquery-1.7.2.js" integrity="sha256-FxfqH96M63WENBok78hchTCDxmChGFlo+/lFIPcZPeI=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/divisioncontrol.js"></script>
</head>
<body>
<?php
    session_start();
    $connect=mysqli_connect("localhost","root","");
    $database=mysqli_select_db($connect, "iwp");
    $username=$_SESSION['username'];
    $studentid=$_POST['studentid'];
    $courseid=$_POST['courseid'];
    $_SESSION['studentid']=$studentid;
    $_SESSION['courseid']=$courseid;
    $i=0;
    $details=mysqli_query($connect,"SELECT * from reviews where Student_ID = '$studentid'");
    echo '<div class="showdetails"> Students </div>
          <br> <br> <br> <br>
          <table class="courseinfo">
          <thead>
          <th>Serial No.</th>
          <th>Review</th>
          <th>Max Mark</th>
          <th>Modify</th>
          <th>Marks</th>';
    $review1=mysqli_fetch_array(mysqli_query($connect,"SELECT * from reviews where Student_ID='$studentid' and Course_ID='$courseid' and Assignment='Review_1'"));
    $review2=mysqli_fetch_array(mysqli_query($connect,"SELECT * from reviews where Student_ID='$studentid' and Course_ID='$courseid' and Assignment='Review_2'"));
    $review3=mysqli_fetch_array(mysqli_query($connect,"SELECT * from reviews where Student_ID='$studentid' and Course_ID='$courseid' and Assignment='Review_3'"));
    echo '<tr>
          <td>1</td>
          <td>Review 1</td>
          <td>20</td>
          <td><button id="button" value="no" onclick="loadReviewChanger(\''.$studentid.'\',\''.$courseid.'\',\''.$review1['Assignment'].'\')">Process</button></td>
          <td>'.$review1['Marks'].'</td>
          </tr>';
     echo '<tr>
          <td>2</td>
          <td>Review 2</td>
          <td>30</td>
          <td><button id="button" value="no" onclick="loadReviewChanger(\''.$studentid.'\',\''.$courseid.'\',\''.$review2['Assignment'].'\')">Process</button></td>
          <td>'.$review2['Marks'].'</td>
          </tr>';
     echo '<tr>
          <td>3</td>
          <td>Review 3</td>
          <td>50</td>
          <td><button id="button" value="no" onclick="loadReviewChanger(\''.$studentid.'\',\''.$courseid.'\',\''.$review3['Assignment'].'\')">Process</button></td>
          <td>'.$review3['Marks'].'</td>
          </tr>';
    echo '</table>';
?>
</body>
</html>