<?php

session_start();

$username= isset($_POST['fieldStudentUser']) ? $_POST['fieldStudentUser'] : '';
$password= isset($_POST['fieldStudentPassword']) ? $_POST['fieldStudentPassword'] : '';

echo $username;
echo $password;
$mysqlconnection = mysqli_connect("localhost", "root", "")
    or die("Failed to connect to MySQL ".mysqli_error($mysqlconnection));

$database = mysqli_select_db($mysqlconnection, "iwp");
$query1 = mysqli_query($mysqlconnection, "SELECT * from student where Student_ID = '$username' and Student_PW = '$password' ")
    or die ("Failed to connect to database ".mysqli_error($mysqlconnection));
$rows = mysqli_num_rows($query1);
if($rows==1){
    $_SESSION['username']=$username;
    $_SESSION['password']=$password;
    header("Location: StudentPage.php");
}
else
    echo "Invalid Credentials";
?>
