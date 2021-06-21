<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!doctype html>
<html lang="zxx">

<head>
 <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MapDa</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
<!-- nice select CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/nice-select.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/flaticon.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/slick.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/price_rangs.css">
<!-- style CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/style.css">
       <style>
		    #mainLogo{width:250px; height:45px}
		    @import url(//db.onlinewebfonts.com/c/537c29c4b78689a51f1c48cd802a503f?family=ITC+Grouch);
		    @import url(//db.onlinewebfonts.com/c/789f9065baf48309d73fd0ff02fe4aec?family=Big+Caslon+Black);
		    @import url('https://fonts.googleapis.com/css2?family=Archivo:wght@100&display=swap');
		    #password{font-family: 'Archivo', sans-serif; }
		    #idPlace{font-family: 'Archivo', sans-serif; }
		    #remember{font-family: adobe-caslon-pro, serif;}
		    h2, p{font-family: "Noto Sans KR", sans-serif; font-style: normal; font-weight: 700}
		    input.underline { border-left-width:0; border-right-width:0; border-top-width:0; border-bottom-width:1; width:450px; } 
			#checkbutton{font-family: 'Archivo', sans-serif; ; background-color: white; border:0; outline:0; padding:8px 20px; font-size: 18px}
			#id{width:405px}
			#pw{width:485px}
			#pwc{width:450x}
			#name{width:485px}
			.nice-select{width:190px; height:30px; text-align-last: center; text-align: center;-ms-text-align-last: center; -moz-text-align-last: center;}
			#accountNum{width:285px}
			
			#addr1{width:395px}
			#bb{font-family: ITC Grouch; background-color: gray; border:0; outline:0; padding:6px 17px; font-size: 15px; color:black;}
			#oti{font-family:ITC Grouch; font-size: 100px; text-align: center; color:white;}
	
	
	
	
		</style>

</head>

<body>

<sec:authorize access="isAuthenticated()">
<body>
	><br><br><br><br>
<div style="margin:auto;text-align:center;">
<br><br><br><br><br>
        <h2>Withdrawal</h2><p>
        <br><br><br>
 <form method="post" action="${pageContext.request.contextPath}/member/updateMemberAction">
		<input type="hidden" name="command" value="update">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		ID : <input type="text" class="underline" name="memId" value="${pageContext.request.userPrincipal.principal.memId}" readonly>
		<br>Password : <input type="password" class="underline" name="memPw" >	
		<br><br><br><br><input id="checkbutton"type="submit" value="submit">
 </form>
</div> 
</body>		
</sec:authorize>

		
