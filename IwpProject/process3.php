<?php

session_start();

$username= isset($_POST['fieldAdminUser']) ? $_POST['fieldAdminUser'] : '';
$password= isset($_POST['fieldAdminPassword']) ? $_POST['fieldAdminPassword'] : '';

echo $username;
echo $password;
$mysqlconnection = mysqli_connect("localhost", "root", "")
    or die("Failed to connect to MySQL ".mysqli_error($mysqlconnection));

$database = mysqli_select_db($mysqlconnection, "iwp");
$query1 = mysqli_query($mysqlconnection, "SELECT * from admin where Admin_ID = '$username' and Admin_PW = '$password' ")
    or die ("Failed to connect to database ".mysqli_error($mysqlconnection));
$rows = mysqli_num_rows($query1);
if($rows==1){
    $_SESSION['username']=$username;
    $_SESSION['password']=$password;
    header("Location: AdminPage.php");
}
else
    echo "Invalid Credentials";
?>