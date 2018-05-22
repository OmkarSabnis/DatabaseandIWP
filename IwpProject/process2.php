<?php

session_start();

$username= isset($_POST['fieldTeacherUser']) ? $_POST['fieldTeacherUser'] : '';
$password= isset($_POST['fieldTeacherPassword']) ? $_POST['fieldTeacherPassword'] : '';

echo $username;
echo $password;
$mysqlconnection = mysqli_connect("localhost", "root", "")
    or die("Failed to connect to MySQL ".mysqli_error($mysqlconnection));

$database = mysqli_select_db($mysqlconnection, "iwp");
$query1 = mysqli_query($mysqlconnection, "SELECT * from teacher where Teacher_ID = '$username' and Teacher_PW = '$password' ")
    or die ("Failed to connect to database ".mysqli_error($mysqlconnection));
$rows = mysqli_num_rows($query1);
if($rows==1){
    $_SESSION['username']=$username;
    $_SESSION['password']=$password;
    header("Location: TeacherPage.php");
}
else
    echo "Invalid Credentials";
?>
