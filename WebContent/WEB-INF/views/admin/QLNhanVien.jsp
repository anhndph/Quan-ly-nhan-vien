<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:message code="admin.QLNV.title" /></title>
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
			<li class="active"><a href="QLNhanVien"><em
					class="fa fa-bar-chart">&nbsp;</em> <s:message
						code="admin.QLNV.namepage" /></a></li>
			<li><a href="TTvaKL"><em class="fa fa-heart">&nbsp;</em> <s:message
						code="admin.GhiTTvaKL.namepage" /></a></li>
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
				<li class="active"><s:message code="admin.QLNV.namepage" /></li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<s:message code="admin.QLNV.namepage" />
				</h1>
			</div>
		</div>


		<!--/.row-->
		<h5 style="color: red">${message}</h5>
		<div class="aside">
			<form role="search" method="get" action="seachstaff">
				<div class="form-group">
					<label><s:message code="admin.QLNV.seachstaff" />: </label> <input
						type="text" name="namestaff" class=""
						placeholder="<s:message code="admin.QLNV.namestaff" />"> <input
						type="submit" value="Tìm">
				</div>
			</form>

			<c:if test="${findStaff != null}">
				<table border="1" class="tbl-asi">
					<caption style="text-align: center; font-size: 30px;">
						<s:message code="admin.QLNV.resultstaff" />
					</caption>
					<tr>
						<th><s:message code="admin.QLNV.idstaff" /></th>
						<th><s:message code="admin.QLNV.namestaff" /></th>
						<th><s:message code="admin.QLNV.gender" /></th>
						<th><s:message code="admin.QLNV.birthday" /></th>
						<th><s:message code="admin.QLNV.photo" /></th>
						<th><s:message code="admin.QLNV.email" /></th>
						<th><s:message code="admin.QLNV.phone" /></th>
						<th><s:message code="admin.QLNV.salary" /></th>
						<th><s:message code="admin.QLNV.note" /></th>
						<th><s:message code="admin.QLNV.department" /></th>
						<th colspan="2"><s:message code="admin.QLNV.edit" /></th>
					</tr>
					<c:forEach var="list" items="${findStaff}">
						<tr>
							<td>${list.idStaffs}</td>
							<td>${list.nameStaffs}</td>
							<c:if test="${list.gender == true}">
								<td>Nam</td>
							</c:if>
							<c:if test="${list.gender == false}">
								<td>Nữ</td>
							</c:if>
							<td>${list.birthday}</td>
							<td id="as-photo"><img alt="" width="100%" height="100%"
								src="images/${list.photo}"></td>
							<td>${list.email}</td>
							<td>${list.phone}</td>
							<td>${list.salary}</td>
							<td>${list.notes}</td>
							<td>${list.departs.nameDeparts}</td>
							<td><a href="QLNVupdate?&id=${list.idStaffs}">Update</a></td>
							<td><a href="QLNVdelete?&id=${list.idStaffs}">Delete</a></td>
						</tr>
					</c:forEach>
				</table>

			</c:if>


			<table border="1" class="tbl-asi">
				<caption style="text-align: center; font-size: 30px;">
					<s:message code="admin.QLNV.liststaff" />
				</caption>
				<tr>
					
					<th><s:message code="admin.QLNV.idstaff" /></th>
					<th><s:message code="admin.QLNV.namestaff" /></th>
					<th><s:message code="admin.QLNV.gender" /></th>
					<th><s:message code="admin.QLNV.birthday" /></th>
					<th><s:message code="admin.QLNV.photo" /></th>
					<th><s:message code="admin.QLNV.email" /></th>
					<th><s:message code="admin.QLNV.phone" /></th>
					<th><s:message code="admin.QLNV.salary" /></th>
					<th><s:message code="admin.QLNV.note" /></th>
					<th><s:message code="admin.QLNV.department" /></th>
					<th colspan="2"><s:message code="admin.QLNV.edit" /></th>
				</tr>
				<c:forEach varStatus="itr" var="list" items="${listStaffs}">
					<tr>
						<td>${list.idStaffs}</td>
						<td>${list.nameStaffs}</td>
						<c:if test="${list.gender == true}">
							<td>Nam</td>
						</c:if>
						<c:if test="${list.gender == false}">
							<td>Nữ</td>
						</c:if>
						<td>${list.birthday}</td>
						<td id="as-photo" width="80px" height="120px"><img alt=""
							width="100%" height="100%" src="images/${list.photo}"></td>
						<td>${list.email}</td>
						<td>${list.phone}</td>
						<td>${list.salary}</td>
						<td>${list.notes}</td>
						<td>${list.departs.nameDeparts}</td>
						<td><a href="QLNVupdate?&id=${list.idStaffs}">Update</a></td>
						<td><a href="QLNVdelete?&id=${list.idStaffs}">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
			
			<div id="pagination">
				<c:url value="/QLNhanVien" var="prev">
					<c:param name="page" value="${page-1}" />
				</c:url>
				<c:if test="${page > 1}">
					<a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
				</c:if>
				<c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
					<c:choose>
						<c:when test="${page == i.index}">
							<span>${i.index}</span>
						</c:when>
						<c:otherwise>
							<c:url value="/QLNhanVien" var="url">
								<c:param name="page" value="${i.index}" />
							</c:url>
							<a href='<c:out value="${url}" />'>${i.index}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:url value="/QLNhanVien" var="next">
					<c:param name="page" value="${page + 1}" />
				</c:url>
				<c:if test="${page + 1 <= maxPages}">
					<a href='<c:out value="${next}" />' class="pn next">Next</a>
				</c:if>
			</div>



		</div>

		<div class="form-addnew">
			<h4>
				<s:message code="admin.QLNV.addnewstaff" />
			</h4>
			<form:form action="addStaff" method="post" modelAttribute="newstaff"
				enctype="multipart/form-data">
				<div>
					<s:message code="admin.QLNV.idstaff" />
				</div>
				<form:input path="idStaffs" />
				<form:errors cssClass="errorsValid" path="idStaffs" element="div" />
				<div>
					<s:message code="admin.QLNV.namestaff" />
				</div>
				<form:input path="nameStaffs" />
				<form:errors cssClass="errorsValid" path="nameStaffs" element="div" />

				<div>
					<s:message code="admin.QLNV.gender" />
				</div>
				<form:radiobutton path="gender" value="true" label="Nam" />
				<form:radiobutton path="gender" value="false" label="Nữ" />

				<div>
					<s:message code="admin.QLNV.birthday" />
				</div>
				<form:input path="birthday" placeholder="MM/dd/yyyy" />
				<form:errors cssClass="errorsValid" path="birthday" element="div" />

				<div>
					<s:message code="admin.QLNV.photo" />
				</div>
				<input type="file" id="file" name="uploadFile" onchange="ll()">
				<form:input path="photo" type="hidden" />
				<form:errors cssClass="errorsValid" path="photo" element="div" />
				<script type="text/javascript">
					function ll() {
						document.getElementById('photo').value = document
								.getElementById('file').value
								.slice(document.getElementById('file').value
										.lastIndexOf('\\') + 1)
					}
				</script>
				<div>
					<s:message code="admin.QLNV.email" />
				</div>
				<form:input path="email" />
				<form:errors cssClass="errorsValid" path="email" element="div" />
				<div>
					<s:message code="admin.QLNV.phone" />
				</div>
				<form:input path="phone" />
				<form:errors cssClass="errorsValid" path="phone" element="div" />
				<div>
					<s:message code="admin.QLNV.salary" />
				</div>
				<form:input path="salary" />
				<form:errors cssClass="errorsValid" path="salary" element="div" />
				<div>
					<s:message code="admin.QLNV.note" />
				</div>
				<form:textarea path="notes" />
				<div>
					<s:message code="admin.QLNV.department" />
				</div>
				<form:select path="departs.idDeparts" items="${departs}"
					itemLabel="nameDeparts" itemValue="idDeparts">
				</form:select>
				<br>
				<br>
				<button type="submit">
					<s:message code="admin.QLNV.addnewstaff" />
				</button>
			</form:form>
		</div>
		<div style="clear: both;"></div>
	</div>

	<style>
	#pagination{
		font-size: 20px;
	}
.errorsValid {
	color: red;
	font-style: italic;
}

.aside {
	width: 80%;
	float: left;
	margin-top: 10px
}

.aside form {
	margin: 0px auto;
	width: 400px;
}

.tbl-asi {
	width: 99%;
}

.tbl-asi tr th {
	text-align: center;
	background-color: aqua;
	padding: 5px 0px;
}

.tbl-asi tr td {
	padding: 4px;
}

.form-addnew {
	width: 20%;
	float: left;
	border-left: solid 1px gray;
}

.form-addnew form {
	margin-left: 10px;
}

#file {
	width: 100%;
}

#as-photo {
	width: 80px;
	height: 100px;
}
</style>
	<!--/.main-->


	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/custom.js"></script>
	<script>
		window.onload = function() {
			var chart1 = document.getElementById("line-chart").getContext("2d");
			window.myLine = new Chart(chart1).Line(lineChartData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				scaleGridLineColor : "rgba(0,0,0,.05)",
				scaleFontColor : "#c5c7cc"
			});
			var chart2 = document.getElementById("bar-chart").getContext("2d");
			window.myBar = new Chart(chart2).Bar(barChartData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				scaleGridLineColor : "rgba(0,0,0,.05)",
				scaleFontColor : "#c5c7cc"
			});
			var chart3 = document.getElementById("doughnut-chart").getContext(
					"2d");
			window.myDoughnut = new Chart(chart3).Doughnut(doughnutData, {
				responsive : true,
				segmentShowStroke : false
			});
			var chart4 = document.getElementById("pie-chart").getContext("2d");
			window.myPie = new Chart(chart4).Pie(pieData, {
				responsive : true,
				segmentShowStroke : false
			});
			var chart5 = document.getElementById("radar-chart")
					.getContext("2d");
			window.myRadarChart = new Chart(chart5).Radar(radarData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.05)",
				angleLineColor : "rgba(0,0,0,.2)"
			});
			var chart6 = document.getElementById("polar-area-chart")
					.getContext("2d");
			window.myPolarAreaChart = new Chart(chart6).PolarArea(polarData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				segmentShowStroke : false
			});
		};
	</script>
</body>
</html>