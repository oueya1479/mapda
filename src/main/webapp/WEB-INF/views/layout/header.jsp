<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memNo" var="memNo" />
	<sec:authentication property="principal.memId" var="userId" />
</sec:authorize>
<!-- Header Section Begin -->
<header class="header header--normal">
	<style>
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap')
	;

a {
	font-family: 'Nanum Myeongjo', serif;
	font-weight: bold;
}
</style>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 col-md-3">
				<div class="header__logo">
					<a href="${pageContext.request.contextPath}/main/index"><img
						src="/img/map/mapda.png" alt="" style="height: 90px; width: 90px;"></a>
				</div>
			</div>
			<div class="col-lg-9 col-md-9">
				<div class="header__nav">
					<nav class="header__menu mobile-menu">
						<ul>
							<li class="active"><a href="/main/index">Home</a></li>
							<li><a href="#">Map Service</a>
								<ul class="dropdown">
									<li><a
										href="${pageContext.request.contextPath}/map/mapList">All
											Maps</a></li>
									<li><a
										href="${pageContext.request.contextPath}/map/insertForm">Make
											My Map</a></li>

									<li><a
										href="${pageContext.request.contextPath}/map/subMaps">Subscribed
											Maps</a></li>
									<li><a
										href="${pageContext.request.contextPath}/place/likePlace">Liked
											Places</a></li>

								</ul></li>

							<li><a href="#">Enterprise</a>
								<ul class="dropdown">
									<li><a
										href="${pageContext.request.contextPath}/enterprise/list">Enterprise
											Service</a></li>

								</ul></li>
							<li><a href="#">Coupon</a>
								<ul class="dropdown">
									<li><a href="/coupon/list">All Coupons</a></li>
									<li><a href="/coupon/admin">Manage Coupons</a></li>

								</ul></li>
							<li><a href="#">Event</a>
								<ul class="dropdown">
									<li><a
										href="${pageContext.request.contextPath}/event/list">All
											Events</a></li>

								</ul></li>
							<li><a href="#">Mapbership</a>
								<ul class="dropdown">
									<li><a
										href="${pageContext.request.contextPath}/member/pay">Regular
											payment</a></li>
									<li><a href="#">My Membership</a></li>

								</ul></li>
							<li><a href="#">My Page</a>
								<ul class="dropdown">
									<li><a
										href="${pageContext.request.contextPath}/member/profile/${memNo}">Information</a></li>
									<li><a
										href="${pageContext.request.contextPath}/map/manageMap/${memNo}">Manage
											My Maps</a></li>
									<li><a
										href="${pageContext.request.contextPath}/point/myPoint">
											Point</a></li>
									<li><a
										href="${pageContext.request.contextPath}/coupon/myCoupon">
											Coupon</a></li>
								</ul></li>
						</ul>
					</nav>
					<div class="header__menu__right">
						<sec:authorize access="isAnonymous()">
							<a href="${pageContext.request.contextPath}/member/registerForm"
								class="primary-btn">Join Us</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<a>${userId}&nbsp;&nbsp;&nbsp;</a>
							<!-- 로그아웃 버튼 만들 위치 -->

							<a href="${pageContext.request.contextPath}/member/logout">Logout</a>
						</sec:authorize>


						<a href="${pageContext.request.contextPath}/member/loginForm"
							class="login-btn"><i class="fa fa-user"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div id="mobile-menu-wrap"></div>
	</div>
</header>
<!-- Header Section End -->