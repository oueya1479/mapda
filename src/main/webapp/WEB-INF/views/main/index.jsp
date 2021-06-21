<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap')
	;

h1, h2, h3, h4, h5, h6, p, a {
	font-family: 'Nanum Myeongjo', serif;
	font-weight: bold;
}
</style>
</head>

<body>

	<!-- Hero Section Begin -->
	<section class="hero set-bg"
		data-setbg="${pageContext.request.contextPath}/img/map/san.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__text">
						<div class="section-title">
							<h1 style="color: white;">Make Your Own Maps In Mapda</h1>
							<p style="color: black;">1.118.940.376 places are waiting for
								you</p>
							<p>
								<br>
							<p>
							<p>
						</div>
						<div class="hero__search__form">
							<form
								action="${pageContext.request.contextPath}/map/selectedMaps"
								method="post">
								<input type="text" name="keyWord" style="width: 685px">
								<div class="select__option">
									<div class="nice-select">
										<select name="categoryNo">
											<option value="0">Choose Categories</option>
											<option value="1">맛집</option>
											<option value="2">여행</option>
											<option value="3">카페</option>
											<option value="4">힐링</option>
											<option value="5">자연</option>
											<option value="6">액티비티</option>
											<option value="7">쇼핑</option>
											<option value="8">문화</option>
											<option value="9">산책</option>
											<option value="10">야경</option>
											<option value="11">명소</option>
											<option value="12">반려동물</option>
											<option value="13">데이트</option>
											<option value="14">드라이브</option>
										</select>
									</div>
								</div>

								<button type="submit">Explore Now</button>
							</form>
						</div>
						<%-- 
						<ul class="hero__categories__tags">
							<li><a href="#"><img
									src="${pageContext.request.contextPath}/img/hero/cat-1.png"
									alt=""> Tasty</a></li>
							<li><a href="#"><img
									src="${pageContext.request.contextPath}/img/hero/cat-2.png"
									alt=""> Foods</a></li>
							<li><a href="#"><img
									src="${pageContext.request.contextPath}/img/hero/cat-3.png"
									alt=""> Shopping</a></li>
							<li><a href="#"><img
									src="${pageContext.request.contextPath}/img/hero/cat-4.png"
									alt=""> Healing</a></li>
							<li><a href="/pay"><img
									src="${pageContext.request.contextPath}/img/hero/cat-5.png"
									alt=""> Travel</a></li>
							<li><a href="${pageContext.request.contextPath}/map/mapList"><img
									src="${pageContext.request.contextPath}/img/hero/cat-6.png"
									alt=""> All Categories</a></li>
						</ul> --%>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->

	<!-- Categories Section End -->

	<!-- Most Search Section Begin -->
	<section class="most-search spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Top Maps</h2>
						<p>Travelocity empowers travelers who are giving back on their
							trips in ways big and small</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="most__search__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab"> <span
									class="flaticon-039-fork"></span> Food
							</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab"> <span class="flaticon-030-kebab"></span>
									Cafe
							</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab"> <span
									class="flaticon-032-food-truck"></span> Travel
							</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-4" role="tab"> <span
									class="flaticon-017-croissant"></span> Beauty
							</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-5" role="tab"> <span
									class="flaticon-038-take-away"></span> Event
							</a></li>

						</ul>
					</div>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="row">
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/resources/psdf.jpg">
											
											<div class="listing__item__pic__tag">맛집</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>미슐랭 맛집 in 서울</h5>
												<div class="listing__item__text__rating">
													
													<h6> </h6>
												</div>
												<ul>
													<li><span></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li>  </span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/map/heart.png"
														alt=""> 123<span></span>
												</div>
												<div class="listing__item__text__info__right">
													<p style="text-align: right;">
														<img
															src="${pageContext.request.contextPath}/img/map/view.png"
															alt="" style="height: 20px; width: 20px;"> 455
												</div>

											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/resources/coff.png">
											
											<div class="listing__item__pic__tag">카페</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>인생샷 남기기 좋은 카페</h5>
												<div class="listing__item__text__rating">
													
													<h6> </h6>
												</div>
												<ul>
													<li> </span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li>  </span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/map/heart.png"
														alt=""> <span></span>342
												</div>
												<div class="listing__item__text__info__right">
													<p style="text-align: right;">
														<img
															src="${pageContext.request.contextPath}/img/map/view.png"
															alt="" style="height: 20px; width: 20px;"> 356
												</div>

											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/resources/nigh.jpg">
											
											<div class="listing__item__pic__tag">야경</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>서울 야경명소 모아모아</h5>
												<div class="listing__item__text__rating">
													
													<h6> </h6>
												</div>
												<ul>
													<li> </span> 2604 E Drachman
														St. Tucson, Arizona, United States</li>
													<li>  </span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/map/heart.png"
														alt=""> <span></span>342
												</div>
												<div class="listing__item__text__info__right">
													<p style="text-align: right;">
														<img
															src="${pageContext.request.contextPath}/img/map/view.png"
															alt="" style="height: 20px; width: 20px;"> 443
												</div>

											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/resources/summ.jpg">
											
											<div class="listing__item__pic__tag">여행</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>올 여름, 여유로운 휴가를 위한 장소들</h5>
												<div class="listing__item__text__rating">
													
													<h6> </h6>
												</div>
												<ul>
													<li> </span> 14320 Keenes
														Mill Rd. Cottondale, Alabama(AL), United States</li>
													<li>  </span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/map/heart.png"
														alt=""> <span></span> 934
												</div>
												<div class="listing__item__text__info__right">
													<p style="text-align: right;">
														<img
															src="${pageContext.request.contextPath}/img/map/view.png"
															alt="" style="height: 20px; width: 20px;"> 1023
												</div>

											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/resources/fl.jpg">
											
											<div class="listing__item__pic__tag">힐링</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>지금 떠나고 싶은 제주</h5>
												<div class="listing__item__text__rating">
													
													<h6> </h6>
												</div>
												<ul>
													<li> </span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li>  </span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/map/heart.png"
														alt=""> <span></span> 232
												</div>
												<div class="listing__item__text__info__right">
													<p style="text-align: right;">
														<img
															src="${pageContext.request.contextPath}/img/map/view.png"
															alt="" style="height: 20px; width: 20px;"> 453
												</div>

											</div>
										</div>
									</div>
								</div>
								
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/resources/cupl.png">
											
											<div class="listing__item__pic__tag">데이트</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>솔로가 알려주는 데이트 코스 모음</h5>
												<div class="listing__item__text__rating">
													
													<h6> </h6>
												</div>
												<ul>
													<li> </span> 251 Wiley St.
														Forks, Washington(WA), United States</li>
													<li>  </span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/map/heart.png"
														alt=""> <span></span>453
												</div>
												<div class="listing__item__text__info__right">
													<p style="text-align: right;">
														<img
															src="${pageContext.request.contextPath}/img/map/view.png"
															alt="" style="height: 20px; width: 20px;"> 899
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Most Search Section End -->




	<!-- Feature Location Section Begin -->
	<%-- <section class="feature-location spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Hot places with Mapda</h2>
						<p>Explore restaurants, bars, and cafés by locality</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<a href="#" class="feature__location__item large-item set-bg"
						data-setbg="${pageContext.request.contextPath}/img/feature-location/fl-1.jpg">
						<div class="feature__location__item__text">
							<h5>Washington, D.C</h5>
							<ul>
								<li>2045 Listings</li>
								<li>3648 Users</li>
							</ul>
						</div>
					</a>
				</div>
				<div class="col-lg-6">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<a href="#" class="feature__location__item set-bg"
								data-setbg="${pageContext.request.contextPath}/img/feature-location/fl-2.jpg">
								<div class="feature__location__item__text">
									<h5>Chicago</h5>
								</div>
							</a>
						</div>
						<div class="col-lg-6 col-md-6">
							<a href="#" class="feature__location__item set-bg"
								data-setbg="${pageContext.request.contextPath}/img/feature-location/fl-3.jpg">
								<div class="feature__location__item__text">
									<h5>San Antonio</h5>
								</div>
							</a>
						</div>
					</div>
					<a href="#" class="feature__location__item set-bg"
						data-setbg="${pageContext.request.contextPath}/img/feature-location/fl-4.jpg">
						<div class="feature__location__item__text">
							<h5>Los Angeles</h5>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section> --%>
	<!-- Feature Location Section End -->

	<!-- Testimonial Section Begin -->
	<section class="testimonial spad set-bg"
		data-setbg="${pageContext.request.contextPath}/img/testimonial/testimonial-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Mapda : Stories of our lives</h2>
						<p>How people live their own lives</p>
					</div>
					<div class="testimonial__slider owl-carousel">
						<div class="testimonial__item" data-hash="review-1">
							<p>" We show our own value to users. Each map we create shares awesome stories and
							delightful memories. Developers made a number of
								suggestions to help improve our systems.<p> 
								Seven of us are always ready to 
						    communicate with user's opinions."</p>
							<div class="testimonial__item__author">
								<a href="#review-3" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda1.png"
									alt=""></a> 
									<a href="#review-1" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda5.png"
									alt="" onmouseover=""></a>
									<a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda4.png"
									alt="">
									</a>
									<a href="#review-3" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda3.png"
									alt=""></a>
									<a href="#review-1" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda2.png"
									alt=""></a>
									<a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda6.png"
									alt="">
									</a>
									<a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda7.png"
									alt="">
									</a>
							</div>
							<div class="testimonial__item__author__text">
								<h5>1등 1조 -</h5>
								<div class="testimonial__item__author__rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<span>Mapda</span>
						</div>
						<div class="testimonial__item" data-hash="review-2">
							<p> 우리는 우리의 가치를 공유합니다. <br>
							우리가 공유하는 모든 지도에는 멋진 이야기와
							값진 추억들이 담겨있습니다. 
							
							<p> 
								" 맵다 : 맵多 - 우리의 지향점 "</p>
							<div class="testimonial__item__author">
								<a href="#review-3" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda1.png"
									alt=""></a> 
									<a href="#review-1" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda5.png"
									alt="" onmouseover=""></a>
									<a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda4.png"
									alt="">
									</a>
									<a href="#review-3" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda3.png"
									alt=""></a>
									<a href="#review-1" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda2.png"
									alt=""></a>
									<a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda6.png"
									alt="">
									</a>
									<a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda7.png"
									alt="">
									</a>
							</div>
							<div class="testimonial__item__author__text">
								<h5>1등 1조 -</h5>
								<div class="testimonial__item__author__rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<span>Mapda</span>
						</div>
						<div class="testimonial__item" data-hash="review-3">
							<p>
								바보는 방황을 하고, 현명한 사람은 여행을 한다.
								<p>-Thomas Fuller
							</p>
							<div class="testimonial__item__author">
								<a href="#review-3" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda1.png"
									alt=""></a> 
									<a href="#review-1" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda5.png"
									alt="" onmouseover=""></a>
									<a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda4.png"
									alt="">
									</a>
									<a href="#review-3" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda3.png"
									alt=""></a>
									<a href="#review-1" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda2.png"
									alt=""></a>
									<a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda6.png"
									alt="">
									</a>
									<a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/mapda7.png"
									alt="">
									</a>
							</div>
							<div class="testimonial__item__author__text">
								<h5>1등 1조 -</h5>
								<div class="testimonial__item__author__rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<span>Mapda</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Testimonial Section End -->

	<!-- Blog Section Begin -->

	<!-- Blog Section End -->


</body>

</html>