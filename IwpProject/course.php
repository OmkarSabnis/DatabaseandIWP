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
  error_reporting(0);
    session_start();
    $connect=mysqli_connect("localhost","root","");
    $database=mysqli_select_db($connect, "iwp");
    $username=$_SESSION['username'];
    $userid=$_POST['userid'];
    $courseid=$_POST['courseid'];
    $coursename=$_POST['coursename'];
    $coursecredit=$_POST['coursecredit'];
    $coursetype=$_POST['coursetype'];
    $courseslot=$_POST['courseslot'];
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
    echo '<div class="showinfo">';
    if($coursetype == 'ETH')
    {
        echo '<table>';
        echo '<thead>
                <th> Serial No </th>
                <th> Digital Assignment </th>
                <th> Process </th>
              </thead>';
        $i=1;
        while($i <=3){
            echo '<tr>
                  <td> '.$i.' </td>
                  <td> "Digital Assignment" '.$i.' </td>
                  <td> <button id="button" value="no" onclick="loadproject(\''.$courseslot.'\',\''.$coursecredit.'\',\''.$coursetype.'\',\''.$coursename.'\',\''.$row['Assignment'].'\',\''.$userid.'\',\''.$courseid.'\')">Process</button></td>
                  </tr>';
                  $i+=1;
        }
    }
    else if($coursetype == "ELA")
    {
        echo '<div class="showinfo">';
        echo '<table>';
        echo '<thead>
                <th> Serial No </th>
                <th> Lab Assignment </th>
                <th> Process </th>
              </thead>';
        $i=1;
        while($i<=10){
            echo '<tr>
                    <td> '.$i.' </td>
                    <td> "Lab Assignment" '.$i.' </td>
                    <td> <button id="button" value="no" onclick="loadlab(\''.$courseslot.'\',\''.$coursecredit.'\',\''.$coursetype.'\',\''.$coursename.'\',\''.$row['Assignment'].'\',\''.$userid.'\',\''.$courseid.'\')">Process</button></td>
                    </tr>';
                    $i+=1;
        }
    }
    else if($coursetype == "EPA")
    {
        echo '<div class="showinfo">';
        echo '<table>';
        echo '<thead>
                <th> Serial No </th>
                <th> Assignment </th>
                <th> Marks Alloted </th>
                <th> Process </th>
              </thead>';
        $result=mysqli_query($connect,"SELECT * from Reviews where Student_ID = '$userid' and Course_ID = '$courseid' ;");
        $i=1;
        while($row=mysqli_fetch_array($result))
        {
            echo '<tr>
                    <td> '.$i.' </td>
                    <td> '.$row['Assignment'].'</td>
                    <td> ';
            echo empty($row['Marks'])? 'Not Alloted' : $row['Marks'];
            echo   '</td>
                    <td> <button id="button" onclick="loadproject(\''.$courseslot.'\',\''.$coursecredit.'\',\''.$coursetype.'\',\''.$coursename.'\',\''.$row['Assignment'].'\',\''.$userid.'\',\''.$courseid.'\')">Process</button></td>
                    </tr>';
                    $i+=1;
        }
    }
?>
</body>
</html>