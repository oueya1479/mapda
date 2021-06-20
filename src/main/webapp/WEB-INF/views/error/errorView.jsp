<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	response.setStatus(200); //응답 코드 설정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section class="hero set-bg"
		data-setbg="${pageContext.request.contextPath}/img/hero/hero-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__text">
						<div class="section-title">
							<h2>${errMsg}${exception.message}</h2>
							<a href="javascript:history.back()">뒤로가기</a>
							<a href="${pageContext.request.contextPath}/">홈으로</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>