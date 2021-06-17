<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/style.css">
<style type="text/css">


.wrap {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: "Noto Sans KR", sans-serif;
  background: rgba(0, 0, 0, 0.1);
}

</style>

</head>




<h3>Member UpdateForm</h3>

<sec:authorize access="isAuthenticated()">

<body>
	
<div class="wrap" style="margin:auto;text-align:center;">
 <form method="post" action="${pageContext.request.contextPath}/member/updateMemberAction">
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		ID : <input type="text" class="underline" name="memId" value="${pageContext.request.userPrincipal.principal.memId}" readonly>
		<br>Password : <input type="password" class="underline" name="memPw" >	
		<br>Address : <input type="text" class="underline" name="memAddr" value="${pageContext.request.userPrincipal.principal.memAddr}" >
		<br>Account : <input type="text" class="underline" name="memAcount" value="${pageContext.request.userPrincipal.principal.memAccount}" >	
		<br><input type="submit" value="submit">
 </form>
</div> 
</body>		
</sec:authorize>

		
