<html>
<head>
    <style>
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
    left:5%;
    top: 10%;
    position: relative;
  }
  .showdetails{
    position: relative;
    border: 3px solid black;
    top: 5%;
    text-align: center;
    background-color: #afbadc;
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
    $query=mysqli_query($connect, "SELECT * from allotted where Teacher_ID = '$username' ");
    echo '<div class="showdetails"> Course Details </div>';
    echo '<div class="showinfo">';
    echo '<table>';
    echo '<thead>
            <th> Serial No </th>
            <th> Course ID </th>
            <th> Course Name </th>
            <th> Type </th>
            <th> Credits </th>
            <th> Slot </th>
            <th> Process </th>
          </thead>';
    $i=1;
    while($result=mysqli_fetch_array($query)){
        $Course_ID=$result['Course_ID'];
        $query2=mysqli_query($connect, "SELECT * from course where Course_ID = '$Course_ID'");
        while($result2=mysqli_fetch_array($query2)){
        $Course_Name=$result2['Course_Name'];
        $Course_Credit=$result2['Course_Credit'];
        $Course_Slot=$result2['Course_Slot'];
        $Course_Type=$result2['Course_Type'];
        echo '<tr>
              <td> '.$i.' </td>
              <td> '.$result2['Course_ID']. ' </td>
              <td> '.$result2['Course_Name']. ' </td>
              <td> '.$result2['Course_Type'].' </td>
              <td> '.$result2['Course_Credit']. ' </td>
              <td> '.$result2['Course_Slot']. ' </td>
              <td> <button id="button" value="no" onclick="loadteachercourse(\''.$username.'\',\''.$Course_ID.'\',\''.$Course_Name.'\',\''.$Course_Credit.'\',\''.$Course_Slot.'\',\''.$Course_Type.'\')">Process</button></td>
              </tr>';
        }
        $i+=1;
      }
    echo '</table>';
    echo '</div>';
    ?>
</body>
</html>