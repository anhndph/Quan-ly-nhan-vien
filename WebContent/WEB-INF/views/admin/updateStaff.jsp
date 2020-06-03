<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update Staff</title>
<base href="${pageContext.servletContext.contextPath}/">

</head>
<body>
	<form:form action="updateStaff" method="post" modelAttribute="udstaff"
		enctype="multipart/form-data">
		<div>
			<s:message code="admin.QLNV.idstaff" />
		</div>
		<form:input path="idStaffs" />
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
		<form:input path="birthday" />
		<form:errors cssClass="errorsValid" path="birthday" element="div" />
		<div>
			<s:message code="admin.QLNV.photo" />
		</div>
		<div style="width: 100px; height: 150px">
			<img width="100%" height="100%" alt="" src="images/${udstaff.photo}">
		</div>
		<input type="file" id="file" name="uploadFile" onchange="ll()">
		<form:input path="photo" type="hidden" />
		<form:errors cssClass="errorsValid" path="photo" element="div" />
		<script type="text/javascript">
			function ll() {
				document.getElementById('photo').value = document
						.getElementById('file').value.slice(document
						.getElementById('file').value.lastIndexOf('\\') + 1)
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
		<input type="submit" value="update">
	</form:form>
	<style>
	.errorsValid {
	color: red;
	font-style: italic;
}
form {
	margin-left: 40px;
}
</style>

</body>
</html>