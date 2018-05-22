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
    $courseid=$_POST['courseid'];
    $coursename=$_POST['coursename'];
    $coursecredit=$_POST['coursecredit'];
    $coursetype=$_POST['coursetype'];
    $_SESSION['username']=$username;
    $_SESSION['courseid']=$courseid;
    $_SESSION['coursename']=$coursename;
    $_SESSION['coursecredit']=$coursecredit;
    $_SESSION['coursetype']=$coursetype;
    $i=1;
    echo '<div class="showdetails"> Students </div>
          <br> <br> <br> <br>
          <table class="courseinfo">
          <thead>
          <th> Serial No. </th>
          <th> Student ID </th>
          <th> Process </th>
          </thead>';
    $studs=mysqli_query($connect,"SELECT * from enrolls where Course_ID = '$courseid'");
    while($result=mysqli_fetch_array($studs)){
        $Student_ID=$result['Student_ID'];
        echo '<tr>
            <td>'.$i.'</td>
            <td>'.$Student_ID.'</td>
            <td><button id="button" onclick="loadStudentInfo(\''.$Student_ID.'\',\''.$courseid.'\')">Process</button></td>
            </tr>';
            $i+=1;
    }
?>
</body>
</html>