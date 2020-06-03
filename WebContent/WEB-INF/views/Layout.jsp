<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<base href="${pageContext.servletContext.contextPath}/">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
	<style>
		.dropdown a {
			color: white;
		}
	</style>
	<script src="js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation"
		style="margin-bottom: 0px">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>Lumino</span></a> 
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown">
						<a href="#" data-lang="en">English</a>
					</li>
					<li class="dropdown">
						<a href="#" data-lang="vi">Tiếng Việt</a>
					</li>
					<script type="text/javascript">
					$(function(){
						$("a[data-lang]").click(function(){
							var lang = $(this).attr("data-lang");
							$.get("QLPhongBan?language="+ lang, function(){
							location.reload();
							});
						return false;
						});
					});
					</script>
				</ul>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	<jsp:include page="${param.view}"></jsp:include>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js">
	</script>
</body>
</html>