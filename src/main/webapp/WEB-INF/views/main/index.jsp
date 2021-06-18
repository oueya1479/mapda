<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
</head>

<body>

	<!-- Hero Section Begin -->
	<section class="hero set-bg"
		data-setbg="${pageContext.request.contextPath}/img/hero/hero-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__text">
						<div class="section-title">
							<h2>Discover The Best Maps In Mapda</h2>
							<p>1.118.940.376 The best service package is waiting for you</p>
						</div>
						<div class="hero__search__form">
							<form action="${pageContext.request.contextPath}/map/selectedMaps" method="post">
								<input type="text" name="keyWord" style="width:685px">
								<div class="select__option">
								<div class="nice-select" >
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
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<section class="categories spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Popular Categories</h2>
						<p>Mapda empowers travelers who are giving back on their trips
							in ways big and small</p>
					</div>
					<div class="categories__item__list">
						<div class="categories__item">
							<img
								src="${pageContext.request.contextPath}/img/categories/cat-1.png"
								alt="">
							<h5>Food & Drink</h5>
							<span>78 Listings</span>
						</div>
						<div class="categories__item">
							<img
								src="${pageContext.request.contextPath}/img/categories/cat-2.png"
								alt="">
							<h5>Restaurent</h5>
							<span>32 Listings</span>
						</div>
						<div class="categories__item">
							<img
								src="${pageContext.request.contextPath}/img/categories/cat-3.png"
								alt="">
							<h5>Hotels</h5>
							<span>16 Listings</span>
						</div>
						<div class="categories__item">
							<img
								src="${pageContext.request.contextPath}/img/categories/cat-4.png"
								alt="">
							<h5>Beauty & Spa</h5>
							<span>55 Listings</span>
						</div>
						<div class="categories__item">
							<img
								src="${pageContext.request.contextPath}/img/categories/cat-5.png"
								alt="">
							<h5>Shopping</h5>
							<span>23 Listings</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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
									Shopping
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
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-6" role="tab"> <span
									class="flaticon-031-delivery"></span> Rental
							</a></li>
						</ul>
					</div>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="row">
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-1.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-1.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Chinese Sausage Restaurant</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-2.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-2.png"
												alt="">
											<div class="listing__item__pic__tag top_rate">Top Rate</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Shrimp floured and fried</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 1012 Vesper Dr.
														Columbus, Georgia(GA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-2.png"
														alt=""> <span>Food & Drink</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-3.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-3.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Sweet and sour pork ribs</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 251 Wiley St.
														Forks, Washington(WA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-4.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-4.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Crab fried with tamarind</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 14320 Keenes
														Mill Rd. Cottondale, Alabama(AL), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-3.png"
														alt=""> <span>Hotel</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-5.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-5.png"
												alt="">
											<div class="listing__item__pic__tag hot_deal">Hot Deal</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Tortoise grilled on salt</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-4.png"
														alt=""> <span>Shopping</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-6.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-6.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Fish cooked with fishsauce</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 2604 E Drachman
														St. Tucson, Arizona, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-3.png"
														alt=""> <span>Hotel</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="row">
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-1.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-1.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Chinese Sausage Restaurant</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-2.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-2.png"
												alt="">
											<div class="listing__item__pic__tag top_rate">Top Rate</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Shrimp floured and fried</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 1012 Vesper Dr.
														Columbus, Georgia(GA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-2.png"
														alt=""> <span>Food & Drink</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-3.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-3.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Sweet and sour pork ribs</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 251 Wiley St.
														Forks, Washington(WA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-4.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-4.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Crab fried with tamarind</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 14320 Keenes
														Mill Rd. Cottondale, Alabama(AL), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-3.png"
														alt=""> <span>Hotel</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-5.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-5.png"
												alt="">
											<div class="listing__item__pic__tag hot_deal">Hot Deal</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Tortoise grilled on salt</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-4.png"
														alt=""> <span>Shopping</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="row">
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-3.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-3.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Sweet and sour pork ribs</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 251 Wiley St.
														Forks, Washington(WA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-4.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-4.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Crab fried with tamarind</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 14320 Keenes
														Mill Rd. Cottondale, Alabama(AL), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-3.png"
														alt=""> <span>Hotel</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-5.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-5.png"
												alt="">
											<div class="listing__item__pic__tag hot_deal">Hot Deal</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Tortoise grilled on salt</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-4.png"
														alt=""> <span>Shopping</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-6.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-6.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Fish cooked with fishsauce</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 2604 E Drachman
														St. Tucson, Arizona, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-3.png"
														alt=""> <span>Hotel</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tabs-4" role="tabpanel">
							<div class="row">
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-1.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-1.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Chinese Sausage Restaurant</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-2.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-2.png"
												alt="">
											<div class="listing__item__pic__tag top_rate">Top Rate</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Shrimp floured and fried</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 1012 Vesper Dr.
														Columbus, Georgia(GA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-2.png"
														alt=""> <span>Food & Drink</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-3.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-3.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Sweet and sour pork ribs</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 251 Wiley St.
														Forks, Washington(WA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-6.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-6.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Fish cooked with fishsauce</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 2604 E Drachman
														St. Tucson, Arizona, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-3.png"
														alt=""> <span>Hotel</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tabs-5" role="tabpanel">
							<div class="row">
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-1.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-1.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Chinese Sausage Restaurant</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-2.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-2.png"
												alt="">
											<div class="listing__item__pic__tag top_rate">Top Rate</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Shrimp floured and fried</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 1012 Vesper Dr.
														Columbus, Georgia(GA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-2.png"
														alt=""> <span>Food & Drink</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-3.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-3.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Sweet and sour pork ribs</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 251 Wiley St.
														Forks, Washington(WA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-4.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-4.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Crab fried with tamarind</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 14320 Keenes
														Mill Rd. Cottondale, Alabama(AL), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-3.png"
														alt=""> <span>Hotel</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-6.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-6.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Fish cooked with fishsauce</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 2604 E Drachman
														St. Tucson, Arizona, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-3.png"
														alt=""> <span>Hotel</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tabs-6" role="tabpanel">
							<div class="row">
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-1.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-1.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Chinese Sausage Restaurant</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-1.png"
														alt=""> <span>Restaurant</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-2.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-2.png"
												alt="">
											<div class="listing__item__pic__tag top_rate">Top Rate</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Shrimp floured and fried</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 1012 Vesper Dr.
														Columbus, Georgia(GA), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-2.png"
														alt=""> <span>Food & Drink</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-4.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-4.png"
												alt="">
											<div class="listing__item__pic__tag">Popular</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Crab fried with tamarind</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 14320 Keenes
														Mill Rd. Cottondale, Alabama(AL), United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-3.png"
														alt=""> <span>Hotel</span>
												</div>
												<div class="listing__item__text__info__right closed">Closed</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6">
									<div class="listing__item">
										<div class="listing__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/img/listing/list-5.jpg">
											<img
												src="${pageContext.request.contextPath}/img/listing/list_icon-5.png"
												alt="">
											<div class="listing__item__pic__tag hot_deal">Hot Deal</div>
											<div class="listing__item__pic__btns">
												<a href="#"><span class="icon_zoom-in_alt"></span></a> <a
													href="#"><span class="icon_heart_alt"></span></a>
											</div>
										</div>
										<div class="listing__item__text">
											<div class="listing__item__text__inside">
												<h5>Tortoise grilled on salt</h5>
												<div class="listing__item__text__rating">
													<div class="listing__item__rating__star">
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star"></span> <span class="icon_star"></span>
														<span class="icon_star-half_alt"></span>
													</div>
													<h6>$40 - $70</h6>
												</div>
												<ul>
													<li><span class="icon_pin_alt"></span> 236 Littleton
														St. New Philadelphia, Ohio, United States</li>
													<li><span class="icon_phone"></span> (+12) 345-678-910</li>
												</ul>
											</div>
											<div class="listing__item__text__info">
												<div class="listing__item__text__info__left">
													<img
														src="${pageContext.request.contextPath}/img/listing/list_small_icon-4.png"
														alt=""> <span>Shopping</span>
												</div>
												<div class="listing__item__text__info__right">Open Now</div>
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
	<section class="feature-location spad">
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
	</section>
	<!-- Feature Location Section End -->

	<!-- Testimonial Section Begin -->
	<section class="testimonial spad set-bg"
		data-setbg="${pageContext.request.contextPath}/img/testimonial/testimonial-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Trusted By Over 5000+ User</h2>
						<p>What people say about us</p>
					</div>
					<div class="testimonial__slider owl-carousel">
						<div class="testimonial__item" data-hash="review-1">
							<p>" We worked with Consultant. Our representative was very
								knowledgeable and helpful. Consultant made a number of
								suggestions to help improve our systems. Consultant explained
								how things work and why it would help."</p>
							<div class="testimonial__item__author">
								<a href="#review-3"><img
									src="${pageContext.request.contextPath}/img/testimonial/author-3.png"
									alt=""></a> <a href="#review-1" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/author-1.png"
									alt=""></a> <a href="#review-2"><img
									src="${pageContext.request.contextPath}/img/testimonial/author-2.png"
									alt=""></a>
							</div>
							<div class="testimonial__item__author__text">
								<h5>John Smith -</h5>
								<div class="testimonial__item__author__rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<span>CEO Colorlib</span>
						</div>
						<div class="testimonial__item" data-hash="review-2">
							<p>" We worked with Consultant. Our representative was very
								knowledgeable and helpful. Consultant made a number of
								suggestions to help improve our systems. Consultant explained
								how things work and why it would help."</p>
							<div class="testimonial__item__author">
								<a href="#review-1"><img
									src="${pageContext.request.contextPath}/img/testimonial/author-1.png"
									alt=""></a> <a href="#review-2" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/author-2.png"
									alt=""></a> <a href="#review-3"><img
									src="${pageContext.request.contextPath}/img/testimonial/author-3.png"
									alt=""></a>
							</div>
							<div class="testimonial__item__author__text">
								<h5>John Smith -</h5>
								<div class="testimonial__item__author__rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<span>CEO Colorlib</span>
						</div>
						<div class="testimonial__item" data-hash="review-3">
							<p>" We worked with Consultant. Our representative was very
								knowledgeable and helpful. Consultant made a number of
								suggestions to help improve our systems. Consultant explained
								how things work and why it would help."</p>
							<div class="testimonial__item__author">
								<a href="#review-2"><img
									src="${pageContext.request.contextPath}/img/testimonial/author-2.png"
									alt=""></a> <a href="#review-3" class="active"><img
									src="${pageContext.request.contextPath}/img/testimonial/author-3.png"
									alt=""></a> <a href="#review-1"><img
									src="${pageContext.request.contextPath}/img/testimonial/author-1.png"
									alt=""></a>
							</div>
							<div class="testimonial__item__author__text">
								<h5>John Smith -</h5>
								<div class="testimonial__item__author__rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<span>CEO Colorlib</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Testimonial Section End -->

	<!-- Blog Section Begin -->
	<section class="news-post spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>News Post</h2>
						<p>Checkout Latest News And Articles From Our Blog</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/blog/blog-1.jpg">
							<a href="https://www.youtube.com/watch?v=8EJ3zbKTWQ8"
								class="play-btn video-popup"><i class="fa fa-play"></i></a>
						</div>
						<div class="blog__item__text">
							<ul class="blog__item__tags">
								<li><i class="fa fa-tags"></i> Travel</li>
								<li>Videos</li>
							</ul>
							<h5>
								<a href="#">Internet Banner Advertising Most Reliable</a>
							</h5>
							<ul class="blog__item__widget">
								<li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
								<li><i class="fa fa-user"></i> John Smith</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/blog/blog-2.jpg"></div>
						<div class="blog__item__text">
							<ul class="blog__item__tags">
								<li><i class="fa fa-tags"></i> Travel</li>
								<li>Restaurant</li>
							</ul>
							<h5>
								<a href="#">Internet Banner Advertising Most Reliable</a>
							</h5>
							<ul class="blog__item__widget">
								<li><i class="fa fa-clock-o"></i> 19th March, 2019</li>
								<li><i class="fa fa-user"></i> John Smith</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="blog__item">
						<div class="blog__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/blog/blog-3.jpg"></div>
						<div class="blog__item__text">
							<ul class="blog__item__tags">
								<li><i class="fa fa-tags"></i> Travel</li>
								<li>Restaurant</li>
							</ul>
							<h5>
								<a href="#">Internet Banner Advertising Most Reliable</a>
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
	</section>
	<!-- Blog Section End -->


</body>

</html>