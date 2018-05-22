<html>
<head>
  <style>
  tr,td{
    border: 2px solid black;
    border-style: collapse;
    margin: 5px;
    padding: 5px;
    background-color: #f2dede;
  }
  .showinfo{
    left:20%;
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
</head>
<body>
  <?php
    session_start();
    $connect=mysqli_connect("localhost","root","");
    $database=mysqli_select_db($connect, "iwp");
    $username=$_SESSION['username'];
    $query=mysqli_query($connect, "SELECT * from teacher where Teacher_ID = '$username' ");
    $result=mysqli_fetch_array($query);
    echo '<div class="showdetails"> My Details </div>';
    echo '<div class="showinfo">
          <table>
          <tr>
            <td> Name </td>
            <td> '.$result['Teacher_Name'].' </td>
          </tr>
          <tr>
            <td> Identification No. </td>
            <td> '.$result['Teacher_ID'].' </td>
          </tr>
          <tr>
          <td> Email_ID </td>
          <td> '.$result['Teacher_Email'].' </td>
          </tr>
          <tr>
          <td> Phone_Number </td>
          <td> '.$result['Teacher_PhoneNo'].' </td>
          </tr>
          </table>
          </div>';
  ?>
</body>
</html>


