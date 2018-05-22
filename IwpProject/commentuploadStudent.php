<?php
session_start();
if(isset($_POST["submitcomment"]))
{
$comment=$_POST["commentsender"];
$studentid=$_SESSION["commentusername"];
$courseid=$_SESSION["commentcourse"];
$review=$_SESSION["commentreview"];

$connect=mysqli_connect("localhost","root","");
$database=mysqli_select_db($connect, "iwp");

$query=mysqli_query($connect, "UPDATE reviews set StudentComment = '".$comment."' where Student_ID = '".$studentid."' and Course_ID = '".$courseid."' and Assignment = '". $review."';") or die(mysqli_error());

echo "<script type='text/javascript'>alert('Comment sent.'); window.history.back();</script>";
}
?>