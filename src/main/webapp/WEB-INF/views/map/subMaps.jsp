<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
</head>

<body>

	<!-- Listing Section Begin -->
	<section class="listing-hero set-bg"
		data-setbg="${pageContext.request.contextPath}/img/listing/details/listing-hero.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="listing__hero__option">
						<div class="listing__hero__icon"></div>
						<div class="listing__hero__text">
							<h2>${memId}'s Following List</h2>
							<div class="listing__hero__widget"></div>
							<p>
								<span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
								Georgia, United States
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="listing__hero__btns">

						<a href="#" class="primary-btn"><i class="fa fa-bookmark"></i>
							Subscribed</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Listing Section End -->

	<!-- Listing Details Section Begin -->
	<c:forEach items="${mapStorage}" var="storage">
	<section class="listing-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="listing__details__text">
						<div class="listing__details__about">
							<h2>${storage.theme.mapTitle}</h2>
						</div>
						<div class="listing__details__gallery">
							<div class="listing__details__gallery__pic">
								<div class="listing__details__gallery__item">
									<img class="listing__details__gallery__item__large"
										src="${pageContext.request.contextPath}/img/map/${storage.theme.mapImg}"
										alt="" style="height:750px"> <span><i class="fa fa-camera"></i> </span>
								</div>
								
								<div class="listing__details__gallery__slider owl-carousel">
									<img data-imgbigurl="img/listing/details/listing-details-1.jpg"
										src="${pageContext.request.contextPath}/img/listing/details/thumb-1.jpg"
										alt=""> <img
										data-imgbigurl="img/listing/details/listing-details-1.jpg"
										src="${pageContext.request.contextPath}/img/listing/details/thumb-2.jpg"
										alt=""> <img
										data-imgbigurl="img/listing/details/listing-details-1.jpg"
										src="${pageContext.request.contextPath}/img/listing/details/thumb-3.jpg"
										alt=""> <img
										data-imgbigurl="img/listing/details/listing-details-1.jpg"
										src="${pageContext.request.contextPath}/img/listing/details/thumb-4.jpg"
										alt="">
								</div>
								
							</div>
						</div>
						<div class="listing__details__amenities">
							<h4></h4>
							<div class="row">
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/save/icons/activity1.png"
											alt="" style="width:40px; height:40px;">
										<h6>Activity</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/save/icons/attraction1.png"
											alt="" style="width:40px; height:40px;">
										<h6>Attraction</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/save/icons/cafe1.png"
											alt="" style="width:40px; height:40px;">
										<h6>Cafe</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/save/icons/culture1.png"
											alt="" style="width:40px; height:40px;">
										<h6>Culture</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/save/icons/date1.png"
											alt="" style="width:40px; height:40px;">
										<h6>Date</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/save/icons/food1.png"
											alt="" style="width:40px; height:40px;">
										<h6>Food</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/save/icons/travel1.png"
											alt="" style="width:40px; height:40px;">
										<h6>Travel</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/save/icons/pet1.png"
											alt="" style="width:40px; height:40px;">
										<h6>Pet</h6>
									</div>
								</div>
							</div>
						</div>
						<div class="listing__details__rating">
								<br>
							<div class="listing__details__comment__item">
								<div class="listing__details__comment__item__text">
									<h5>${storage.theme.mapContent}</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:forEach>
	<!-- Listing Details Section End -->



</body>

</html>