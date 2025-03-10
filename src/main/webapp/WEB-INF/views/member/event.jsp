<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');


h2{font-family: 'Nanum Myeongjo', serif; font-weight: bold;}

</style>
<title>Podcast &mdash; Colorlib Website Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ej/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ej/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ej/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ej/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ej/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ej/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ej/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ej/css/jquery-ui.css">

</head>
<body>

	<div class="site-wrap">

		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>


		<header class="site-navbar py-4" role="banner">

			<div class="container">
				<div class="row align-items-center">



					<div class="col-9">
						<nav
							class="site-navigation position-relative text-right text-md-right"
							role="navigation"></nav>
					</div>
				</div>
				</div>
		</header>



		<div class="container pt-5 hero">
			<div class="row align-items-center text-center text-md-left">

				<div class="col-lg-4">
					<h1 class="mb-3 display-3">Participate In Our Event!</h1>
					<p>
						좋아요 수가 많은 1,2,3위에게는 포인트를 드립니다! <br>많은 참여 부탁드립니다 ^^
					</p>
				</div>
				<div class="col-lg-8">
					<img
						src="${pageContext.request.contextPath}/ej/images/1x/asset-1.png"
						alt="Image" class="img-fluid">
				</div>
			</div>
		</div>


		<div class="site-section">
			<div class="container">

				<div class="row">
					<div class="col-lg-3">
						<div class="featured-user  mb-5 mb-lg-0">
							<h3 class="mb-4">이전 당첨자</h3>
							<ul class="list-unstyled">
								<li><a href="#" class="d-flex align-items-center"> <img
										src="${pageContext.request.contextPath}/ej/images/person_1.jpg"
										alt="Image" class="img-fluid mr-2">
										<div class="podcaster">
											<span class="d-block">Claire Stanford</span> <span
												class="small">32,420 podcasts</span>
										</div>
								</a></li>
								<li><a href="#" class="d-flex align-items-center"> <img
										src="${pageContext.request.contextPath}/ej/images/person_2.jpg"
										alt="Image" class="img-fluid mr-2">
										<div class="podcaster">
											<span class="d-block">Dianne Winston</span> <span
												class="small">12,381 podcasts</span>
										</div>
								</a></li>
								<li><a href="#" class="d-flex align-items-center"> <img
										src="${pageContext.request.contextPath}/ej/images/person_3.jpg"
										alt="Image" class="img-fluid mr-2">
										<div class="podcaster">
											<span class="d-block">Borris Larry</span> <span class="small">9,291
												podcasts</span>
										</div>
								</a></li>
								<li><a href="#" class="d-flex align-items-center"> <img
										src="${pageContext.request.contextPath}/ej/images/person_4.jpg"
										alt="Image" class="img-fluid mr-2">
										<div class="podcaster">
											<span class="d-block">Garry Smith</span> <span class="small">3,291
												podcasts</span>
										</div>
								</a></li>
								<li><a href="#" class="d-flex align-items-center"> <img
										src="${pageContext.request.contextPath}/ej/images/person_5.jpg"
										alt="Image" class="img-fluid mr-2">
										<div class="podcaster">
											<span class="d-block">Gerson Stack</span> <span class="small">1,092
												podcasts</span>
										</div>
								</a></li>
								<li><a href="#" class="d-flex align-items-center"> <img
										src="${pageContext.request.contextPath}/ej/images/person_6.jpg"
										alt="Image" class="img-fluid mr-2">
										<div class="podcaster">
											<span class="d-block">Jenna Stone</span> <span class="small">911
												podcasts</span>
										</div>
								</a></li>
							</ul>
						</div>
					</div>

					<div class="col-lg-9">

						<c:forEach items="${eventList}" var="event">
							<div class="d-block d-md-flex podcast-entry bg-white mb-5"
								data-aos="fade-up">
								<div class="image"
									style="background-image: url('${event.evImg}');"></div>
								<div class="text">

									<h3 class="font-weight-light">
										<a href="single-post.html">${event.evTitle}
										</a>
									</h3>
									<div class="mb-3">
										<span class="text-black-opacity-05"><small>By
												Mike Smith <span class="sep">/</span> ${event.evStartDate} ~ ${event.evEndDate}<span
												class="sep">/</span><br>등록일 : ${event.evRegdate}
										</small></span>
									</div>
									<button class="btn btn-default" type="submit" style="border-color: #bbbbff; color: #4444ff">참여하기</button>
								</div>
							</div>
						</c:forEach>

					</div>
					<div class="container" data-aos="fade-up">
						<div class="row">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul>
										<li><a href="#" class="icon-keyboard_arrow_left"></a></li>
										<li class="active"><span>1</span></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#" class="icon-keyboard_arrow_right"></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- <div class="site-section">
      <div class="container" data-aos="fade-up">
        <div class="row mb-5">
          <div class="col-md-12 text-center">
            <h2 class="font-weight-bold text-black">Behind The Mic</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="${pageContext.request.contextPath}/ej/images/person_1.jpg" alt="Image" class="img-fluid">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Megan Smith</h2>
                <span class="d-block mb-2 text-white-opacity-05">Creative Director</span>
                <p class="mb-4">Lorem ipsum dolor sit amet consectetur adipisicing elit ullam reprehenderit nemo.</p>
                <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p>
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="${pageContext.request.contextPath}/ej/images/person_2.jpg" alt="Image" class="img-fluid">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Brooke Cagle</h2>
                <span class="d-block mb-2 text-white-opacity-05">Creative Director</span>
                <p class="mb-4">Lorem ipsum dolor sit amet consectetur adipisicing elit ullam reprehenderit nemo.</p>
                <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p>
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="${pageContext.request.contextPath}/ej/images/person_3.jpg" alt="Image" class="img-fluid">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Philip Martin</h2>
                <span class="d-block mb-2 text-white-opacity-05">Creative Director</span>
                <p class="mb-4">Lorem ipsum dolor sit amet consectetur adipisicing elit ullam reprehenderit nemo.</p>
                <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p>
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="${pageContext.request.contextPath}/ej/images/person_4.jpg" alt="Image" class="img-fluid">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Steven Ericson</h2>
                <span class="d-block mb-2 text-white-opacity-05">Creative Director</span>
                <p class="mb-4">Lorem ipsum dolor sit amet consectetur adipisicing elit ullam reprehenderit nemo.</p>
                <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p>
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="${pageContext.request.contextPath}/ej/images/person_5.jpg" alt="Image" class="img-fluid">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Nathan Dumlao</h2>
                <span class="d-block mb-2 text-white-opacity-05">Creative Director</span>
                <p class="mb-4">Lorem ipsum dolor sit amet consectetur adipisicing elit ullam reprehenderit nemo.</p>
                <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p>
              </div>

            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-5">
            <div class="team-member">

              <img src="${pageContext.request.contextPath}/ej/images/person_6.jpg" alt="Image" class="img-fluid">

              <div class="text">

                <h2 class="mb-2 font-weight-light h4">Brooke Cagle</h2>
                <span class="d-block mb-2 text-white-opacity-05">Creative Director</span>
                <p class="mb-4">Lorem ipsum dolor sit amet consectetur adipisicing elit ullam reprehenderit nemo.</p>
                <p>
                  <a href="#" class="text-white p-2"><span class="icon-facebook"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="text-white p-2"><span class="icon-linkedin"></span></a>
                </p>
              </div>

            </div>
          </div>


        </div>
      </div>
    </div> -->

		<div class="site-section bg-light block-13">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-12 text-center">
						<h2 class="font-weight-bold text-black">Featured Guests</h2>
					</div>
				</div>
				<div class="nonloop-block-13 owl-carousel">

					<div class="text-center p-3 p-md-5 bg-white">
						<div class="mb-4">
							<img
								src="${pageContext.request.contextPath}/ej/images/person_1.jpg"
								alt="Image" class="w-50 mx-auto img-fluid rounded-circle">
						</div>
						<div class="">
							<h3 class="font-weight-light h5">Megan Smith</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Et, iusto. Aliquam illo, cum sed ea? Ducimus quos, ea?</p>
						</div>
					</div>

					<div class="text-center p-3 p-md-5 bg-white">
						<div class="mb-4">
							<img
								src="${pageContext.request.contextPath}/ej/images/person_2.jpg"
								alt="Image" class="w-50 mx-auto img-fluid rounded-circle">
						</div>
						<div class="">
							<h3 class="font-weight-light h5">Brooke Cagle</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Et, iusto. Aliquam illo, cum sed ea? Ducimus quos, ea?</p>
						</div>
					</div>

					<div class="text-center p-3 p-md-5 bg-white">
						<div class="mb-4">
							<img
								src="${pageContext.request.contextPath}/ej/images/person_3.jpg"
								alt="Image" class="w-50 mx-auto img-fluid rounded-circle">
						</div>
						<div class="">
							<h3 class="font-weight-light h5">Philip Martin</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Et, iusto. Aliquam illo, cum sed ea? Ducimus quos, ea?</p>
						</div>
					</div>

					<div class="text-center p-3 p-md-5 bg-white">
						<div class="mb-4">
							<img
								src="${pageContext.request.contextPath}/ej/images/person_4.jpg"
								alt="Image" class="w-50 mx-auto img-fluid rounded-circle">
						</div>
						<div class="">
							<h3 class="font-weight-light h5">Steven Ericson</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Et, iusto. Aliquam illo, cum sed ea? Ducimus quos, ea?</p>
						</div>
					</div>

					<div class="text-center p-3 p-md-5 bg-white">
						<div class="mb-4">
							<img
								src="${pageContext.request.contextPath}/ej/images/person_5.jpg"
								alt="Image" class="w-50 mx-auto img-fluid rounded-circle">
						</div>
						<div class="">
							<h3 class="font-weight-light h5">Nathan Dumlao</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Et, iusto. Aliquam illo, cum sed ea? Ducimus quos, ea?</p>
						</div>
					</div>

					<div class="text-center p-3 p-md-5 bg-white">
						<div class="mb-4">
							<img
								src="${pageContext.request.contextPath}/ej/images/person_6.jpg"
								alt="Image" class="w-50 mx-auto img-fluid rounded-circle">
						</div>
						<div class="">
							<h3 class="font-weight-light h5">Brook Smith</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Et, iusto. Aliquam illo, cum sed ea? Ducimus quos, ea?</p>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="site-blocks-cover overlay inner-page-cover"
			style="background-image: url(images/hero_bg_1.jpg);" data-aos="fade"
			data-stellar-background-ratio="0.5">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">

					<div class="col-md-6" data-aos="fade-up" data-aos-delay="400">
						<h2>Subscribe</h2>
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit nihil saepe libero sit odio obcaecati veniam.</p>
						<form action="#" method="post" class="site-block-subscribe">
							<div class="input-group mb-3">
								<input type="text"
									class="form-control border-secondary text-white bg-transparent"
									placeholder="Enter Email" aria-label="Enter Email"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button"
										id="button-addon2">Send</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<footer class="site-footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<h3>About Us</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Praesentium animi, odio beatae aspernatur natus recusandae quasi
							magni eum voluptatem nam!</p>
					</div>
					<div class="col-lg-3 mx-auto">
						<h3>Navigation</h3>
						<ul class="list-unstyled">
							<li><a href="#">Podcasts</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
					<div class="col-lg-4">
						<h3>Subscribe</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quod, quibusdam!</p>
						<form action="#" class="form-subscribe">
							<input type="email" class="form-control mb-3"
								placeholder="Enter Email"> <input type="submit"
								class="btn btn-primary" value="Subscribe">
						</form>
					</div>
				</div>

				<div class="row pt-5 mt-5 text-center">
					<div class="col-md-12">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script data-cfasync="false"
								src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="icon-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>

				</div>
			</div>
		</footer>
	</div>

	<script
		src="${pageContext.request.contextPath}/ej/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ej/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/ej/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/ej/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/ej/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ej/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ej/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ej/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ej/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/ej/js/aos.js"></script>

	<script
		src="${pageContext.request.contextPath}/ej/js/mediaelement-and-player.min.js"></script>
	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							var mediaElements = document
									.querySelectorAll('video, audio'), total = mediaElements.length;

							for (var i = 0; i < total; i++) {
								new MediaElementPlayer(
										mediaElements[i],
										{
											pluginPath : 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
											shimScriptAccess : 'always',
											success : function() {
												var target = document.body
														.querySelectorAll('.player'), targetTotal = target.length;
												for (var j = 0; j < targetTotal; j++) {
													target[j].style.visibility = 'visible';
												}
											}
										});
							}
						});
	</script>


	<script src="${pageContext.request.contextPath}/ej/js/main.js"></script>

</body>
</html>