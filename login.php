<?php
include("php/dbconnect.php");

$error = '';
if(isset($_POST['login']))
{

$username =  mysqli_real_escape_string($conn,trim($_POST['username']));
$password =  mysqli_real_escape_string($conn,$_POST['password']);

if($username=='' || $password=='')
{
$error='All fields are required';
}

$sql = "select * from user where username='".$username."' and password = '".md5($password)."'";

$q = $conn->query($sql);
if($q->num_rows==1)
{
$res = $q->fetch_assoc();
$_SESSION['rainbow_username']=$res['username'];
$_SESSION['rainbow_uid']=$res['id'];
$_SESSION['rainbow_name']=$res['name'];
echo '<script type="text/javascript">window.location="index.php"; </script>';

}else
{
$error = 'Invalid Username or Password';
}

}

?>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Consultorio Dental Sonríe</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
   
    <link href="https://fonts.googleapis.com/css2?family=Ysabeau:wght@100&display=swap" rel="stylesheet">
   
<link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Ysabeau:wght@100&display=swap" rel="stylesheet">>
<style>
.myhead{
margin-top:0px;
margin-bottom:0px;
text-align:center;
}
#grad {
    background: #A6E3E1; /* For browsers that do not support gradients */
    background: -webkit-linear-gradient(#A6E3E1, #74D5D2); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient(#A6E3E1, #74D5D2); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient(#A6E3E1, #74D5D2); /* For Firefox 3.6 to 15 */
    background: linear-gradient(#A6E3E1, #74D5D2); /* Standard syntax */
    height: 100vh;
     width: 100%;
}
</style>

</head>
<body id="grad">
    <div class="container">
        
         <div class="row ">
               
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                          
                            <div class="panel-body" style="background-color: white; margin-top:50px; border:solid 0px #0e0e0e;">
							  <h3 class="myhead" style="color:#38C4BD; font-weight:bolder; font_family: Pacifico; ">SOFTWARE DE PAGOS</h3>
                                <form role="form" action="login.php" method="post">
                                    <hr />
									<?php
									if($error!='')
									{									
									echo '<h5 class="text-danger text-center">'.$error.'</h5>';
									}
									?>
									
                                   
                                     <div class="form-group input-group">
                                            <span class="input-group-addon" style="background-color:#38C4BD;"><i class="fa fa-tag"  ></i></span>
                                            <input type="text" class="form-control" style="color:#38C4BD;" placeholder="Usuario " name="username" required />
                                        </div>
                                        
									<div class="form-group input-group">
                                            <span class="input-group-addon" style="background-color:#38C4BD;"><i class="fa fa-lock"  ></i></span>
                                            <input type="password" class="form-control"  placeholder="Contraseña " style="color:#38C4BD;" name="password" required />
                                        </div>
										
                                     <button class="btn btn-primary center-block" type= "submit" name="login" style="background-color:#38C4BD;border-radius: 24px; font-size: 16px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);width:145px; ">Ingresar</button>
                                   
                                    </form>
                            </div>
                           
                        </div>
                
                
        </div>
    </div>

</body>
</html>
