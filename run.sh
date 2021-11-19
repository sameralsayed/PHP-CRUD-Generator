#!/bin/bash

    #Name : PHP CRUD Generator
    #Created by : SAMER SAEID
    #Copyright : MIT
    #URL: https://www.facebook.com/samerthehariri/
    #Date: 11/19/2021

path=$(pwd)

read appname

echo "CREATE TABLE \`${appname}\`( \`id\` INT(11) NOT NULL AUTO_INCREMENT" >> ${appname}.sql

echo "<?php
\$con=mysqli_connect(\"localhost\",\"root\",\"pass\",\"your database name\");
?>" >> dbconfig.php


echo "<?php
include_once 'dbconfig.php';


if(isset(\$_GET['delete_id']))
{
 \$sql_query=\"DELETE FROM ${appname} WHERE id=\".\$_GET['delete_id'];
 mysqli_query(\$con,\$sql_query);
 header(\"Location: \$_SERVER[PHP_SELF]\");
}
if(isset(\$_GET['changestatus_id']))
{
 \$sql_query=\"UPDATE ${appname} SET \`status\`='\".\$_GET['status'].\"' WHERE id=\".\$_GET['changestatus_id'];
 mysqli_query(\$con,\$sql_query);
 header(\"Location: \$_SERVER[PHP_SELF]\");
}
?>

<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
<title>Core PHP Crud functions By PHP Code Builder</title>
<link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\" />
<script type=\"text/javascript\">
function edt_id(id)
{
  window.location.href='edit_${appname}.php?edit_id='+id;
}
function view_id(id)
{
  window.location.href='view_${appname}.php?view_id='+id;
}
function delete_id(id)
{
 if(confirm('Sure to Delete ?'))
 {
  window.location.href='index.php?delete_id='+id;
 }
}
function changestatus_id(id,status)
{
  window.location.href='index.php?changestatus_id='+id+'&status='+status;
}
</script>
</head>
<body>
<center>

<div id=\"header\">
 <div id=\"content\">
    <label>Core PHP Crud functions - <a href=\"http://www.phpcodebuilder.com\" target=\"_blank\">By PHP Code Builder</a></label>
    </div>
</div>

<div id=\"body\">
 <div id=\"content\">
    <table align=\"center\">
    <tr>
    <th colspan=\"5\"><a href=\"add_${appname}.php\">add ${appname}.</a></th>
    </tr>
    <th>SL NO</th>
    <th>${name}</th>
   
    <th colspan=\"3\">Actions</th>
    </tr>
    <?php
 \$sql_query=\"SELECT * FROM ${appname}\";
 \$result_set=mysqli_query(\$con,\$sql_query);
 \$i=1;
 while(\$row=mysqli_fetch_row(\$result_set))
 {
  ?>
        <tr>
        <td align=\"center\" ><?php echo \$i; ?></td>
        <td align=\"center\" > <a href=\"javascript:view_id('<?php echo \$row[0]; ?>')\"> <?php echo \$row[1]; ?> </a> </td>
        <?php if(\$row[count(\$row)-1]==1) { ?>
        <td align=\"center\"><a href=\"javascript:changestatus_id('<?php echo \$row[0]; ?>',0)\">Deactivate</a></td>
        <?php } else { ?>
        <td align=\"center\"><a href=\"javascript:changestatus_id('<?php echo \$row[0]; ?>',1)\">Activate</a></td>
        <?php } ?>
  <td align=\"center\"><a href=\"javascript:edt_id('<?php echo \$row[0]; ?>')\">Edit</a></td>
        <td align=\"center\"><a href=\"javascript:delete_id('<?php echo \$row[0]; ?>')\">Delete</a></td>
        </tr>
        <?php
       \$i++;  
 }
 ?>
    </table>
    </div>
</div>

</center>
</body>
</html>" >> index.php


echo "<?php
include_once 'dbconfig.php';

if(isset(\$_POST['btn-save']))
{
 // variables for input data" >> add_${appname}.php

echo "<?php
include_once 'dbconfig.php';

if(isset(\$_GET['edit_id']))
{
 \$sql_query=\"SELECT * FROM ${appname} WHERE id=\".\$_GET['edit_id'];
 \$result_set=mysqli_query(\$con,\$sql_query);
 \$fetched_row=mysqli_fetch_array(\$result_set,MYSQLI_ASSOC);
}
if(isset(\$_POST['btn-update']))
{
 // variables for input data" >> edit_${appname}.php


echo "<?php
include_once 'dbconfig.php';

if(isset(\$_GET['view_id']))
{
 \$sql_query=\"SELECT * FROM ${appname} WHERE id=\".\$_GET['view_id'];
 \$result_set=mysqli_query(\$con,\$sql_query);
 \$fetched_row=mysqli_fetch_array(\$result_set,MYSQLI_ASSOC);
}



?>
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
<title>Core PHP Crud functions By PHP Code Builder</title>
<link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\" />
</head>
<body>
<center>

<div id=\"header\">
 <div id=\"content\">
        <label>Core PHP Crud functions - <a href=\"http://www.phpcodebuilder.com\" target=\"_blank\">By PHP Code Builder</a></label>
    </div>
</div>

 <table align=\"center\">" >> view_${appname}.php


  read name
  while [[ "$name" != "" ]]; do

    echo ",\`${name}\` VARCHAR(255)" >> ${appname}.sql

    echo "\$${name} = \$_POST['\${name}'];
    // variables for input data

 // sql query for inserting data into database
 
\$sql_query=\"INSERT INTO ${appname} (\`${name}\`) VALUES('\".\$${name}.\"')\";
 // sql query for inserting data into database
 
 // sql query execution function
 if(mysqli_query(\$con,\$sql_query))
 {
  ?>" >> add_${appname}.php

    echo "\$${name} = \$_POST['${name}'];" >> edit_${appname}.php

    echo "   <tr>
   <th colspan=\"5\">${name}: <?php echo \$fetched_row['${name}'] ?></th>
</tr>" >> view_${appname}.php

    read name
  done

echo "</table>
</center>
</body>
</html>" >> view_${appname}.php

echo "\$sql_query=\"UPDATE ${appname} SET" >> edit_${appname}.php

echo "  <script type=\"text/javascript\">
  alert('${appname} added Successfully ');
  window.location.href='index.php';
  </script>
  <?php
 }
 else
 {
  ?>  <script type=\"text/javascript\">
  alert('error occured while inserting your data');
  </script>
  <?php
 }
 // sql query execution function
}
?>
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
<title>Core PHP Crud functions By PHP Code Builder</title>
<link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\" />
</head>
<body>
<center>

<div id=\"header\">
 <div id=\"content\">
        <label>Core PHP Crud functions - <a href=\"http://www.crudgenerator.in\" target=\"_blank\">By PHP Code Builder</a></label>
    </div>
</div>
<div id=\"body\">
 <div id=\"content\">
    <form method=\"post\" enctype=\"multipart/form-data\" >
    <table align=\"center\">
    <tr>
    <td align=\"center\"><a href=\"index.php\">back to main page</a></td>
    </tr>" >> add_${appname}.php


  read name2
  while [[ "$name2" != "" ]]; 
  do

    echo "<tr>
    <td>
    <input type=\"text\" class=\"form-control\" id=\"${name2}\" name=\"${name2}\" required placeholder=\"${name2}\">
    </td>
    </tr>" >> add_${appname}.php

    echo "\`${name2}\`='\$${name2}'," >> edit_${appname}.php

    read name2
  done

    echo "WHERE id=\".\$_GET['edit_id'];

 // sql query for update data into database
 
 // sql query execution function
 if(mysqli_query(\$con,\$sql_query))
 {
  ?>
  <script type=\"text/javascript\">
  alert('${appname} updated successfully');
  window.location.href='index.php';
  </script>
  <?php
 }
 else
 {
  ?>
  <script type=\"text/javascript\">
  alert('error occured while updating data');
  </script>
  <?php
 }
 // sql query execution function
}
if(isset(\$_POST['btn-cancel']))
{
 header(\"Location: index.php\");
}
?>
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
<title>Core PHP Crud functions By PHP Code Builder</title>
<link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\" />
</head>
<body>
<center>

<div id=\"header\">
 <div id=\"content\">
        <label>Core PHP Crud functions - <a href=\"http://www.phpcodebuilder.com\" target=\"_blank\">By PHP Code Builder</a></label>
    </div>
</div>

<div id=\"body\">
 <div id=\"content\">
    <form method=\"post\" enctype=\"multipart/form-data\">
    <table align=\"center\">" >> edit_${appname}.php

echo "<tr>
    <td><button type=\"submit\" name=\"btn-save\"><strong>SAVE</strong></button></td>
    </tr>
    </table>
    </form>
    </div>
</div>

</center>
</body>
</html>" >> add_${appname}.php
echo "\`status\` ENUM('0','1'), PRIMARY KEY (\`id\`) );" >> ${appname}.sql

  read name3
  while [[ "$name3" != "" ]]; 
  do

    echo "<tr>
    <td>
    <input type=\"text\" value=\"<?php echo \$fetched_row['${name3}'] ?>\" class=\"form-control\" id=\"${name3}\" name=\"${name3}\">
</td>
    </tr>" >> edit_${appname}.php
    read name3
  done

    echo "<tr>
    <td>
    <button type=\"submit\" name=\"btn-update\"><strong>UPDATE</strong></button>
    <button type=\"submit\" name=\"btn-cancel\"><strong>Cancel</strong></button>
    </td>
    </tr>
    </table>
    </form>
    </div>
</div>

</center>
</body>
</html>" >> edit_${appname}.php


    echo "@charset \"utf-8\";
/* CSS Document */

*
{
 margin:0;
 padding:0;
}
body
{
 background:#f9f9f9;
 font-family:\"Courier New\", Courier, monospace;
}
#header
{
 width:100%;
 height:50px;
 background:#A0D8B1;
 color:#f9f9f9;
 font-family:\"Lucida Sans Unicode\", \"Lucida Grande\", sans-serif;
 font-size:35px;
 text-align:center;
}
#header a
{
 color:#fff;
 text-decoration:blink;
}
#body
{
 margin-top:50px;
}
table
{
 width:80%;
 font-family:Tahoma, Geneva, sans-serif;
 font-weight:bolder;
 color:#999;
 margin-bottom:80px;
}
table a
{
 text-decoration:none;
 color:#A0D8B1;
}
table,td,th
{
 border-collapse:collapse;
 border:solid #d0d0d0 1px;
 padding:20px;
}
table td input,table td select,table td textarea
{
 width:97%;
 height:35px;
 border:dashed #A0D8B1 1px;
 padding-left:15px;
 font-family:Verdana, Geneva, sans-serif;
 box-shadow:0px 0px 0px rgba(1,0,0,0.2);
 outline:none;
}
.check
{
 width:15px;
 height:15px;
 border:dashed #A0D8B1 1px;
 padding-left:15px;
 font-family:Verdana, Geneva, sans-serif;
 box-shadow:0px 0px 0px rgba(1,0,0,0.2);
 outline:none;
}
table td input:focus
{
 box-shadow:inset 1px 1px 1px rgba(1,0,0,0.2);
 outline:none;
}
table td button
{
 border:solid #f9f9f9 0px;
 box-shadow:1px 1px 1px rgba(1,0,0,0.2);
 outline:none;
 background:#A0D8B1;
 padding:9px 15px 9px 15px;
 color:#f9f9f9;
 font-family:Arial, Helvetica, sans-serif;
 font-weight:bolder;
 border-radius:3px;
 width:49.5%;
}
table td button:active
{
 position:relative;
 top:1px;
}" >> style.css