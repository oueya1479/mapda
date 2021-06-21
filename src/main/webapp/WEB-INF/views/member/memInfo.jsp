<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
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
#mainLogo {
	width: 250px;
	height: 45px
}

@import
	url(//db.onlinewebfonts.com/c/537c29c4b78689a51f1c48cd802a503f?family=ITC+Grouch)
	;

@import
	url(//db.onlinewebfonts.com/c/789f9065baf48309d73fd0ff02fe4aec?family=Big+Caslon+Black)
	;

@import
	url('https://fonts.googleapis.com/css2?family=Archivo:wght@100&display=swap')
	;

.dropdown-item {
	font-family: ITC Grouch;
}

#loginTitle {
	font-family: "Noto Sans KR", sans-serif;
	font-size: 35px;
	text-align: center;
	color: gray;
}

#loginStart {
	font-family: "Noto Sans KR", sans-serif;
}

#password {
	font-family: 'Archivo', sans-serif;
}

#idPlace {
	font-family: 'Archivo', sans-serif;
}

#remember {
	font-family: adobe-caslon-pro, serif;
}

h2{
	ffont-family: "Noto Sans KR", sans-serif;
	font-style: normal;
	font-weight: 700
}


#joinTitle {
	text-align: center;
	font-family: ITC Grouch;
}

input.underline {
	border-left-width: 0;
	border-right-width: 0;
	border-top-width: 0;
	border-bottom-width: 1;
	width: 450px;
}




#sbox {
	all: none;
}

#id {
	width: 405px
}

#pw {
	width: 485px
}


#name {
	width: 485px
}

.nice-select {
	width: 190px;
	height: 30px;
	text-align-last: center;
	text-align: center;
	-ms-text-align-last: center;
	-moz-text-align-last: center;
}



#con1 {
	width: 155px
}

#con2 {
	width: 155px
}

#con3 {
	width: 155px
}



#bb {
	font-family: ITC Grouch;
	background-color: gray;
	border: 0;
	outline: 0;
	padding: 6px 17px;
	font-size: 15px;
	color: black;
}

#oti {
	font-family: ITC Grouch;
	font-size: 100px;
	text-align: center;
	color: white;
}
</style>

</script>





</head>
<body>
	<br><br><br><br><br><br>
	<div style="margin: auto; text-align: center;">
	
		<sec:authorize access="isAuthenticated()">
			<body>
				<div class="wrap"
					style="margin: auto; text-align: center; border: none;">
					<form method="post"action="${pageContext.request.contextPath}/member/memInfo">
						<input type="hidden" name="command" value="meminfo"> 
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<br><br>
						<h2> <sec:authentication property="principal.memId"/>님의 회원정보<br><br> </h2>
				  		<br><br>
						ID : <input type="text"class="underline" name="memId" value="${member.memId}" readonly>
						<br>Name : <input type="text" class="underline"name="memName" value="${member.memName}" readonly> 
						<br>Address : <input type="text" class="underline" name="memAddr"value="${member.memAddr}" readonly>
						<br>Account : <input type="text" class="underline" name="memAcount"value="${member.memAccount}" readonly> 
						<br>Grade : <input type="text" class="underline" name="memGrade"value="${member.memGrade}" readonly>
					  	<br><br><a href="${pageContext.request.contextPath}/member/updateForm">Update Infomation</a>
					</form>
				</div>
				<br><br><br><br><br><br>
			</body>
		</sec:authorize>
	 </div>
</html>

<!-- Footer Section Begin -->
<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="main/index"><img src="img/footer-logo.png" alt=""></a>
					</div>
					<p>Challenging the way things have always been done can lead to
						creative new options that reward you.</p>
				</div>
			</div>
			<div class="col-lg-4 offset-lg-1 col-md-6">
				<div class="footer__address">
					<ul>
						<li><span>Call Us:</span>
							<p>(+12) 345-678-910</p></li>
						<li><span>Email:</span>
							<p>info.colorlib@gmail .com</p></li>
						<li><span>Fax:</span>
							<p>(+12) 345-678-910</p></li>
						<li><span>Connect Us:</span>
							<div class="footer__social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-skype"></i></a>
							</div></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 offset-lg-1 col-md-6">
				<div class="footer__widget">
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">Support</a></li>
						<li><a href="#">How it work</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Blog</a></li>
					</ul>
					<ul>
						<li><a href="#">Sign In</a></li>
						<li><a href="#">How it Work</a></li>
						<li><a href="#">Advantages</a></li>
						<li><a href="#">Direo App</a></li>
						<li><a href="#">Packages</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="footer__copyright">
					<div class="footer__copyright__text">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
					<div class="footer__copyright__links">
						<a href="#">Terms</a> <a href="#">Privacy Policy</a> <a href="#">Cookie
							Policy</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- Footer Section End -->