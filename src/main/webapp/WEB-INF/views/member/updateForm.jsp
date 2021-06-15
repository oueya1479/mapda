<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   

<h3>Member UpdateForm</h3>

<sec:authorize access="isAuthenticated()">
 <form method="post" action="${pageContext.request.contextPath}/updateMemberAction">
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		ID : <input type="text" name="id" value="<sec:authentication property="principal.id"/>" readonly>
		<br>Password : <input type="text" name="password" >	
		<!--  <br>Name : <input type="text" name="name" value="<sec:authentication property="principal.name"/>" > -->	
		<br>Address : <input type="text" name="address" value="<sec:authentication property="principal.address"/>" >
		<br>Account : <input type="text" name="account" value="<sec:authentication property="principal.account"/>" >	
		<br><input type="submit" value="회원정보수정">
		</form>
</sec:authorize>

		
