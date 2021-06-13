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
		 <div class="blog-details-hero set-bg" data-setbg="../img/blog/details/blog-hero.jpg">
		<div class="container">
			<div class="row">
				
			</div>
		</div>
	</div>
	<!-- Blog Hero End -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
				
					
					
					<div class="blog__details__comment__form">
						
						<div class="blog__item" style="width: 300px; height: 400px; text-align : center;">
	                                <div class="blog__item__pic set-bg">
	                                	<img src="${coupon.cpImgpath}" alt="" style="width: 200px; height: 200px; display: flex;
  justify-content: center;
  align-items: center;">
	                                </div>
	                               
	                                
	                                <div class="blog__item__text">
	                                    
	                                    <h5>${coupon.cpName}</h5>
	                                    
	                                    <ul class="blog__item__widget">
	                                        <li><i class="fa fa-money"></i>포인트 :  ${coupon.cpPrice}point</li>
	                                        <li><i class="fa fa-user"></i>이용매장 : ${coupon.cpPlace}</li>                 
	                                    </ul>
	                                </div>
	                            </div>
							<h4>Leave A Reply</h4>
						
						<form action="#" class="contact__form">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<input type="text" placeholder="Name">
								</div>
							</div>
							<textarea placeholder="Message"></textarea>
							<button type="submit" class="site-btn">발급</button>
						</form>
					</div>
					<div class="blog__details__new__post">
						<div class="blog__details__new__post__title">
						<div class="blog__item" style="width: 300px; height: 400px; text-align : center;">
	                                <div class="blog__item__pic set-bg">
	                                	<img src="${coupon.cpImgpath}" alt="" style="width: 200px; height: 200px; display: flex;
  justify-content: center;
  align-items: center;">
	                                </div>
	                               
	                                
	                                <div class="blog__item__text">
	                                    
	                                    <h5>${coupon.cpName}</h5>
	                                    
	                                    <ul class="blog__item__widget">
	                                        <li><i class="fa fa-money"></i>포인트 :  ${coupon.cpPrice}point</li>
	                                        <li><i class="fa fa-user"></i>이용매장 : ${coupon.cpPlace}</li>                 
	                                    </ul>
	                                </div>
	                            </div>
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
							
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog__sidebar">
						
						
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
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->

</body>
</html>