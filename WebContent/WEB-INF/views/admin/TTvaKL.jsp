<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:message code="admin.GhiTTvaKL.title" /></title>
<base href="${pageContext.servletContext.contextPath}/">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive"
					alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">${sessionScope.admin}</div>
				<div class="profile-usertitle-status">
					<span class="indicator label-success"></span>Online
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li><a href="Dashboard"><em class="fa fa-dashboard">&nbsp;</em>
					Dashboard</a></li>
			<li><a href="QLPhongBan"><em class="fa fa-calendar">&nbsp;</em>
					<s:message code="admin.QLPB.namepage" /></a></li>
			<li><a href="QLNhanVien"><em class="fa fa-bar-chart">&nbsp;</em>
					<s:message code="admin.QLNV.namepage" /></a></li>
			<li class="active"><a href="TTvaKL"><em class="fa fa-heart">&nbsp;</em>
					<s:message code="admin.GhiTTvaKL.namepage" /></a></li>
			<li><a href="tonghopTTvaKL"><em class="fa fa-clone">&nbsp;</em>
					<s:message code="admin.TotalTTvaKL.namepage" /></a></li>
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
					<em class="fa fa-navicon">&nbsp;</em> Multilevel <span
					data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em
						class="fa fa-plus"></em></span>
			</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="#"> <span class="fa fa-arrow-right">&nbsp;</span>
							Sub Item 1
					</a></li>
					<li><a class="" href="#"> <span class="fa fa-arrow-right">&nbsp;</span>
							Sub Item 2
					</a></li>
					<li><a class="" href="#"> <span class="fa fa-arrow-right">&nbsp;</span>
							Sub Item 3
					</a></li>
				</ul></li>
			<li><a href="logout"><em class="fa fa-power-off">&nbsp;</em>
					<s:message code="admin.QLNV.logout" /></a></li>
		</ul>
	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active"><s:message code="admin.GhiTTvaKL.namepage" /></li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<s:message code="admin.GhiTTvaKL.namepage" />
				</h1>
			</div>
		</div>
		<!--/.row-->
		<div class="aside-tbl">
			<table border="1">

				<tr>
					<th><s:message code="admin.QLNV.idstaff" /></th>
					<th><s:message code="admin.QLNV.namestaff" /></th>
					<th><s:message code="admin.GhiTTvaKL.type" /></th>
					<th><s:message code="admin.GhiTTvaKL.reason" /></th>
					<th><s:message code="admin.GhiTTvaKL.day" />(yyyy/MM/dd)</th>
				</tr>
				<c:forEach var="list" items="${listRecords}">
					<tr>
						<td>${list.staffs.idStaffs}</td>
						<td>${list.staffs.nameStaffs}</td>
						<td>${list.type?'Thành tích':'Kỉ luật'}</td>
						<td>${list.reason}</td>
						<td>${list.date}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="asd-form-addnew">
			<h4><s:message code="admin.GhiTTvaKL.addnew" /></h4>
			<h4 style="color: red;">${message}</h4>
			<form:form action="addnewRecords" method="post"
				modelAttribute="newRecord">
				<label><s:message code="admin.QLNV.idstaff" /></label><br>
				<form:input path="staffs.idStaffs" />
				<br>
				<label><s:message code="admin.GhiTTvaKL.type" /></label>
				<br>
				<form:radiobutton path="type" value="false" label="Kỉ luật" />
				<form:radiobutton path="type" value="true" label="Thành Tích" />
				<br>
				<label><s:message code="admin.GhiTTvaKL.reason" /></label>
				<br>
				<form:textarea path="reason" />
				<br>
				<input type="submit"
					value="<s:message code="admin.GhiTTvaKL.addnew" />">
			</form:form>

		</div>
		<div style="clear: both;"></div>
		<style>
.aside-tbl {
	width: 80%;
	float: left;
	margin-top: 20px;
}

.aside-tbl table {
	width: 96%;
}

.aside-tbl table tr th {
	text-align: center;
	background-color: aqua;
	padding: 5px 0px;
}

.aside-tbl table tr td {
	padding: 4px;
}

.asd-form-addnew {
	width: 20%;
	float: left;
}
</style>


	</div>
	<!-- /.row -->
	</div>
	<!--/.main-->

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/custom.js"></script>



</body>
</html>