<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lnag="kr">
<head>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<script>
	window.opener.location.href = "${pageContext.request.contextPath}/admin/" + '${where}';
	window.close();
</script>
hi~
</body>
</html>