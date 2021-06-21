<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">
<head>

<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Noto Sans KR", sans-serif;
}

a {
  text-decoration: none;
  color: black;
}

li {
  list-style: none;
}

.wrap {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
}

.login {
  width: 30%;
  height: 600px;
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

h2 {
  color: #c32e62;
  font-size: 2em;
}

.login_id {
  margin-top: 20px;
  width: 80%;
}

.login_id input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_pw {
  margin-top: 20px;
  width: 80%;
}

.login_pw input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_etc {
  padding: 10px;
  width: 80%;
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
}

.submit {
  margin-top: 50px;
  width: 80%;
}
.submit input {
  width: 100%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, gray(255, 77, 46), gray(255, 155, 47));
  color: black;
  font-size: 1.2em;
  letter-spacing: 2px;
}

</style>

</head>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log-In</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
</head>
<body>

<form action="${pageContext.request.contextPath}/login" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    <div class="wrap">
        <div class="login">
            <h2>Log-In</h2>
            
            <div class="login_id">
                <h4>ID</h4>
                <input type="text" name="id" id="id" placeholder="id">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="password" id="password" placeholder="Password">
            </div>
            <div class="login_etc">
                <div class="checkbox">
                <input type="checkbox" name="" id=""> Remember Me?
                </div>
                <div class="forgot_pw">
                <a href="">Forgot Password?</a>
            </div>
            </div>
            
           <c:if test="${not empty requestScope.errorMessage}">
			<span  class="alert alert-danger" style="color:red">${requestScope.errorMessage}</span>
		   </c:if>
            
            <div class="submit">
                <input type="submit" value="Log-In">
            </div>
            
        </div>
    </div>
    </form>
</body>
</html>