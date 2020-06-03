<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login</title>

<link rel="stylesheet" href="css/style.css">
<base href="${pageContext.servletContext.contextPath}/">

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<style type="text/css">
	h5{
		color: red;
		text-align: center;
	}
</style>
</head>
<body>
	<div class="mn-page">
		<h1 class="lg-title">Đăng Nhập</h1>
		<div class="lg-form">
			<h5>${requestScope.messageLoginFail}</h5>
			<form action="CheckLoginDashboard" method="POST" >
				<input id="name" type="text" name="username" placeholder="Tài khoản">
				<input id="pass" type="password" name="password" placeholder="Mật khẩu">
				<div style="clear: both;"></div>
				<input id="sm-form" type="submit" value="Đăng Nhập">
			</form>
		</div>
	</div>
	
	
	
	
</body>
</html>