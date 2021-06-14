<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<tiles:insertAttribute name="include" />
<tiles:insertAttribute name="bootstrapjs" />

</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	<tiles:insertAttribute name="bootstrapjs" />

</body>
</html>