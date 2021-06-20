<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Blog Hero Begin -->
	<div class="blog-details-hero set-bg" data-setbg="${post.epLogo}">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="blog__hero__text">
						<div class="label">${post.epTag}</div>
						<h2>${post.epTitle}</h2>
						<ul>
							<li><i class="fa fa-clock-o"></i>${post.epRegdate}</li>
							<li><i class="fa fa-user"></i>${post.enterprise.entName}</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Blog Hero End -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog__details__text">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<c:forEach items="${post.imageList}" var="image">
									<div class="carousel-item active">
										<img class="d-block w-100" src="${pageContext.request.contextPath}/${image.imageSource}"
											alt="First slide">
									</div>
								</c:forEach>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
						${post.epContent}
					</div>
					<div class="blog__details__tags">
						<span>Tags</span> <a href="#">Ideas</a> <a href="#">Unique</a> <a
							href="#">Video</a>
					</div>
					<div class="listing__details__comment">
						<h4>Comment</h4>
						<c:forEach items="${replyList}" var="reply">
							<div class="listing__details__comment__item">
								<div class="listing__details__comment__item__pic">
									<img src="img/listing/details/comment.png" alt="">
								</div>
								<div class="listing__details__comment__item__text">
									<div class="listing__details__comment__item__rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<span>${reply.erRegdate}</span>
									<h5>${reply.erName}</h5>
									${reply.erContent}
									<ul>
										<li><i class="fa fa-hand-o-right"></i> Like</li>
										<li><i class="fa fa-share-square-o"></i> Reply</li>
									</ul>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="blog__details__comment__form">
						<div class="blog__details__comment__title">
							<h4>Leave A Reply</h4>
						</div>
						<form action="#" class="contact__form">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<input type="text" placeholder="Name">
								</div>
							</div>
							<textarea placeholder="Message"></textarea>
							<button type="submit" class="site-btn">SEND MESSAGE</button>
						</form>
					</div>
					<div class="blog__details__new__post">
						<div class="blog__details__new__post__title">
							<h4>News Post</h4>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<div class="blog__item">
									<div class="blog__item__pic set-bg"
										data-setbg="img/blog/bp-5.jpg"></div>
									<div class="blog__item__text">
										<ul class="blog__item__tags">
											<li><i class="fa fa-tags"></i> Videos</li>
										</ul>
										<h5>
											<a href="#">Citrus Heights Snack Man Helps Feed The
												Homeless</a>
										</h5>
										<ul class="blog__item__widget">
											<li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
											<li><i class="fa fa-user"></i> John Smith</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="blog__item">
									<div class="blog__item__pic set-bg"
										data-setbg="img/blog/bp-6.jpg"></div>
									<div class="blog__item__text">
										<ul class="blog__item__tags">
											<li><i class="fa fa-tags"></i> Travel</li>
										</ul>
										<h5>
											<a href="#">Homeless woman’s viral subway opera
												performance</a>
										</h5>
										<ul class="blog__item__widget">
											<li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
											<li><i class="fa fa-user"></i> John Smith</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog__sidebar">
						<div class="blog__sidebar__search">
							<form action="#">
								<input type="text" placeholder="Searching...">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
						<div class="blog__sidebar__recent">
							<h5>Recent Post</h5>
							<a href="#" class="blog__sidebar__recent__item">
								<div class="blog__sidebar__recent__item__pic">
									<img src="img/blog/recent-1.jpg" alt="">
								</div>
								<div class="blog__sidebar__recent__item__text">
									<span><i class="fa fa-tags"></i> Shopping</span>
									<h6>Tortoise grilled on salt</h6>
									<p>
										<i class="fa fa-clock-o"></i> 19th March, 2019
									</p>
								</div>
							</a> <a href="#" class="blog__sidebar__recent__item">
								<div class="blog__sidebar__recent__item__pic">
									<img src="img/blog/recent-2.jpg" alt="">
								</div>
								<div class="blog__sidebar__recent__item__text">
									<span><i class="fa fa-tags"></i> Hotels</span>
									<h6>Shrimp floured and fried</h6>
									<p>
										<i class="fa fa-clock-o"></i> 22th March, 2019
									</p>
								</div>
							</a> <a href="#" class="blog__sidebar__recent__item">
								<div class="blog__sidebar__recent__item__pic">
									<img src="img/blog/recent-3.jpg" alt="">
								</div>
								<div class="blog__sidebar__recent__item__text">
									<span><i class="fa fa-tags"></i> Restaurant</span>
									<h6>Sweet and sour pork ribs</h6>
									<p>
										<i class="fa fa-clock-o"></i> 25th March, 2019
									</p>
								</div>
							</a> <a href="#" class="blog__sidebar__recent__item">
								<div class="blog__sidebar__recent__item__pic">
									<img src="img/blog/recent-4.jpg" alt="">
								</div>
								<div class="blog__sidebar__recent__item__text">
									<span><i class="fa fa-tags"></i> Videos</span>
									<h6>Crab fried with tamarind</h6>
									<p>
										<i class="fa fa-clock-o"></i> 19th March, 2019
									</p>
								</div>
							</a> <a href="#" class="blog__sidebar__recent__item">
								<div class="blog__sidebar__recent__item__pic">
									<img src="img/blog/recent-5.jpg" alt="">
								</div>
								<div class="blog__sidebar__recent__item__text">
									<span><i class="fa fa-tags"></i> Travel</span>
									<h6>Tortoise grilled on salt</h6>
									<p>
										<i class="fa fa-clock-o"></i> 19th March, 2019
									</p>
								</div>
							</a>
						</div>
						<div class="blog__sidebar__categories">
							<h5>Categories</h5>
							<ul>
								<li><a href="#">Finance <span>18</span></a></li>
								<li><a href="#">Business <span>20</span></a></li>
								<li><a href="#">Loan <span>07</span></a></li>
								<li><a href="#">Consulting <span>22</span></a></li>
								<li><a href="#">Credit <span>19</span></a></li>
							</ul>
						</div>
						<div class="blog__sidebar__tags">
							<h5>Popular Tag</h5>
							<a href="#">Business</a> <a href="#">Marketing</a> <a href="#">Payment</a>
							<a href="#">Travel</a> <a href="#">Finance</a> <a href="#">Videos</a>
							<a href="#">Ideas</a> <a href="#">Unique</a> <a href="#">Music</a>
							<a href="#">Key</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->

</body>
</html>