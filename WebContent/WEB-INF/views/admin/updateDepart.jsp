<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật phòng ban</title>
<base href="${pageContext.servletContext.contextPath}/">

</head>
<body>
	<form:form action="updateqlpb" method="post"
		modelAttribute="depart">
		<div>Mã Phòng ban</div>
		<form:input path="idDeparts" />
		<div>Tên Phòng ban</div>
		<form:input path="nameDeparts" />
		<br>
		<button type="submit">update</button>
	</form:form>
</body>
</html>