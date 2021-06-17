<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>

<html lang="kr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<br><br><br><br><br><br><br>
<title>Snow | Blog</title>

<meta name="description"
	content="Snow - Clean & Minimal Portfolio HTML template.">
<meta name="keywords"
	content="portfolio, clean, minimal, blog, template, portfolio website">
<meta name="author" content="nK">

<link rel="icon" type="image/png" href="assets/images/favicon.png">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- START: Styles -->

<!-- Google Fonts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ej/css/combined.css">

<!-- END: Styles -->



</head>


<body>









	<!--
    START: Navbar Mobile
-->
	<nav class="nk-navbar nk-navbar-full nk-navbar-align-center"
		id="nk-nav-mobile">
		<div class="nk-navbar-bg">
			<div class="bg-image"
				style="background-image: url('assets/images/bg-menu.jpg')"></div>
		</div>
		<div class="nk-nav-table">
			<div class="nk-nav-row">
				<div class="container">
					<div class="nk-nav-header">

						<div class="nk-nav-logo">
							<a href="${pageContext.request.contextPath}/event/singlePosting" class="nk-nav-logo"> <img
								src="${pageContext.request.contextPath}/ej/images/logo-light.svg"
								alt="" width="85">
							</a>
						</div>

						<div class="nk-nav-close nk-navbar-full-toggle">
							<span class="nk-icon-close"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="nk-nav-row-full nk-nav-row">
				<div class="nano">
					<div class="nano-content">
						<div class="nk-nav-table">
							<div
								class="nk-nav-row nk-nav-row-full nk-nav-row-center nk-navbar-mobile-content">
								<ul class="nk-nav">
									<!-- Here will be inserted menu from [data-mobile-menu="#nk-nav-mobile"] -->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="nk-nav-row">
				<div class="container">
					<div class="nk-nav-social">
						<ul>
							<li><a href="https://twitter.com/nkdevv"><i
									class="fa fa-twitter"></i></a></li>
							<li><a href="https://www.facebook.com/unvabdesign/"><i
									class="fa fa-facebook"></i></a></li>
							<li><a href="https://dribbble.com/_nK"><i
									class="fa fa-dribbble"></i></a></li>
							<li><a href="https://www.instagram.com/unvab/"><i
									class="fa fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<!-- END: Navbar Mobile -->


	<div class="nk-main">





		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<!-- START: Filter -->
					<div class="nk-pagination nk-pagination-nobg nk-pagination-center">
						<a href="#nk-toggle-filter"> <span class="nk-icon-squares"></span>
						</a>
					</div>

					<!-- END: Filter -->

					<!-- START: Posts List -->
					
					<div
						class="nk-blog-isotope nk-isotope nk-isotope-gap nk-isotope-1-cols">


						<div class="col-md-6 col-lg-4 col-xl-3">

							<div class="card text-center card-product">
								<div class="card-product__img"></div>
								<div class="card-body">

									<h4 class="card-product__title"></h4>

								</div>
							</div>
						</div>




						<!-- START: Post -->
						<c:forEach items="${eventPostList.content}" var="post"> 
						<div class="nk-isotope-item" data-filter="Nature">
							<div class="nk-blog-post">
								<div class="nk-post-thumb">
									<a href="${pageContext.request.contextPath}/event/singlePosting/${post.evpNo}"> <img
										src="${post.evpImg}"
										alt="" class="nk-img-stretch">
										
									</a>
									<div class="nk-post-category">
										<a href="#">후기 이벤트 참여</a>
									</div>
								</div>
								<h2 class="nk-post-title h4">
									<a href="blog-single.html">${post.evpTitle}</a>
								</h2>

								<div class="nk-post-date">${post.evpRegdate}</div>

								<div class="nk-post-text">
									${post.evpContent}
								</div>
							</div>
						</div>
					 </c:forEach>
						<!-- END: Post -->

					</div>

					<!-- END: Posts List -->
				</div>
			</div>

			<div class="nk-gap-4"></div>

		</div>

		<!-- START: Pagination -->
		<div class="nk-pagination nk-pagination-center">
			<a href="#">Load More Posts</a>
		</div>
		<!-- END: Pagination -->



		<!--
    START: Footer
-->
		<footer class="nk-footer">


			<div class="nk-footer-cont">
				<div class="container text-xs-center">
					<div class="nk-footer-social">
						<ul>
							<li><a href="https://twitter.com/nkdevv"><i
									class="fa fa-twitter"></i></a></li>
							<li><a href="https://www.facebook.com/unvabdesign/"><i
									class="fa fa-facebook"></i></a></li>
							<li><a href="https://dribbble.com/_nK"><i
									class="fa fa-dribbble"></i></a></li>
							<li><a href="https://www.instagram.com/unvab/"><i
									class="fa fa-instagram"></i></a></li>
						</ul>
					</div>

					<div class="nk-footer-text">
						<p>2016 &copy; Design by Unvab. Code by nK</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- END: Footer -->


	</div>




	<!-- START: Scripts -->

	<script src="${pageContext.request.contextPath}/ej/js/combined.js"></script>

	<!-- END: Scripts -->


</body>

</html>