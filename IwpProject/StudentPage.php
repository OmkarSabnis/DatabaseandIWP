<!DOCTYPE html>
<html>
<head>
<style>
  body{
    font: 20px Consolas;
  }
  .topbar{
    background-color: black;
    display: flex;
    position: relative;
    width: 100%;
    height: 10%;
    clear: both;
  }
  .top1{
    margin-left: 13%;
  }
  .top1,.top2,.top3{
    cursor: pointer;
    position: relative;
    text-align: center;
    padding: 5px;
    height: 100%;
    width: 15%;
    color:#FFF;
  }

  .top3{
    left: 346px;
  }

  .top1:hover, .top2:hover, .top3:hover{
    background-color: white;
    color: black;
  }
  #maincontent{
    background-color: #d4d3d3;
    width: 70%;
    height: 1000px;
    position: relative;
    left: 13%;
  }
</style>
<script src="https://code.jquery.com/jquery-1.7.2.js" integrity="sha256-FxfqH96M63WENBok78hchTCDxmChGFlo+/lFIPcZPeI=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/divisioncontrol.js"></script>
</head>
<body background="http://img02.deviantart.net/a3d2/i/2012/191/c/0/eurovision_turkey_fan_page_background_by_alisarikaya-d56oqze.jpg">
    <div class='topbar'>
      <div class='top1' onclick="loadmyinfo()"> My Info </div>
      <div class='top2' onclick="loadmycal()"> CAL Management </div>
      <div class='top3' onclick="logout()"> Log Out </div>
    </div>
    <div id='maincontent'>
    </div>

</body>
</html>