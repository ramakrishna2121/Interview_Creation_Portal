<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
  select{
    text-align-last:center;
    padding-left:33%;
}</style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>Responsive Login Page</title>
    <link rel="stylesheet" href="LoginStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
</head>
<body>
	<!--form area start-->
    
    <div class="form" align="center">
      <!--login form start-->
      <form class="login-form" action="LoginVerification" method="Post">
        <i class="fas fa-user-circle"></i>
        <input class="user-input" type="text" name="user" placeholder="Username" required>
        <input class="user-input" type="password" name="password" placeholder="Password" required>
         <select id="com" name="com" class="user-input">

   <option align="center" style="font-size:25px;"  value="" selected disabled><h1><center>Type  of  Login</center><h1></option>
   <option style="color:black;font-size:20px;font-weight:bold;" style="font-size:20px;" value="Admin">Upcoming Interviews</option>
   <option style="color:black;font-size:20px;font-weight:bold;" style="font-size:20px;"  value="Participant">Scheduling Interviews</option>

</select>

        <input class="btn" type="submit" name="submit" value="LOGIN">
              </form>
              
              </div>
              
   

    <script type="text/javascript">
    $('.options-02 a').click(function(){
      $('form').animate({
        height: "toggle", opacity: "toggle"
      }, "slow");
    });
    </script>
</body>
</html>