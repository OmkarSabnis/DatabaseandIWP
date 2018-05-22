<?php
session_start();
if(isset($_POST["submitmarks"]))
{
$marks=$_POST["marksender"];
$studentid=$_SESSION["markusername"];
$courseid=$_SESSION["markcourse"];
$review=$_SESSION["markreview"];

$connect=mysqli_connect("localhost","root","");
$database=mysqli_select_db($connect, "iwp");

$query=mysqli_query($connect, "UPDATE reviews set Marks = ".$marks." where Student_ID = '".$studentid."' and Course_ID = '".$courseid."' and Assignment = '". $review."';") or die("Failed to query the database");

echo "<script type='text/javascript'>alert('Marks updated.'); window.history.back();</script>";
}
?>