<html>

<!-- Author: Cesar Castromonte  -->
<!-- e-mail: cesarc@cbpf.br     -->
<!-- Date: 09/17/2011           -->

<!-- Displays basic shift information -->

   <head>
      <meta http-equiv="refresh" content="60; url=minshinfo.php" />
      <link rel="stylesheet" type="text/css" href="style.css" media="screen" />
   </head>

   <body>

      <div id = "sh_info">
         <h3>Shift Information</h3>

<?php

### ---------------------------- ###

$dbhost = "fnalmysqlprd.fnal.gov:3336";
$dbuser = "fmindet_read";
$dbpass = "read_fm99";
$dbname = "fmindet";
$table = "DATA1";

$con = mysql_connect($dbhost, $dbuser, $dbpass);
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db($dbname, $con);

### ---------------------------- ###

$sql = "select IDATE,ITIME,SHIFT1,DSHIFT,TSHIFT from $table where SHIFT1 is not null order by ETIME desc limit 1";

$result = mysql_query($sql);

while($row = mysql_fetch_array($result))
  {
   $i_date = $row['IDATE'];
   $i_time = $row['ITIME'];
   $i_shift1 = $row['SHIFT1'];
   $i_dshift = $row['DSHIFT'];
   $i_tshift = $row['TSHIFT'];
  }

if ($i_tshift == 0) $tshift="None";
if ($i_tshift == 1) $tshift="Graveyard";
if ($i_tshift == 2) $tshift="Day";
if ($i_tshift == 3) $tshift="Evening";

echo "<table border='0' width=310 align:'center'>";
echo "<tr><td width=160><b> Date (yyyy-mm-dd): </b></td> <td>" .$i_date. "</td></tr>";
echo "<tr><td><b> Shifter: </b></td> <td>" .$i_shift1. "</td></tr>";
echo "<tr><td><b> DAQ Shifter: </b></td> <td>" .$i_dshift. "</td></tr>";
echo "<tr><td><b> Shift Term: </b></td> <td>" .$tshift. "</td></tr>";
echo  "</table>";

mysql_close($con);
?>

      </div>

   </body>

</html>

