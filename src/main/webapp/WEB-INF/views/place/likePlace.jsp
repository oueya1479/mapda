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
							<h2>${memId}'s Like Place List</h2>
							<div class="listing__hero__widget"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="listing__hero__btns">

						<a href="#" class="primary-btn"><i class="fa fa-heart"></i>
							Like Place</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Listing Section End -->

	<!-- Listing Details Section Begin -->

	<section class="listing-details spad">
		<c:forEach items="${psList.content}" var="storage">
		<div class="container">
			
			<div class="row">
	
				<div class="col-lg-12">
					<div class="listing__details__text">
						<div class="listing__details__about">
							<table style="width: 100%">
								<tr>
									<td>
										<h2 style="font-weight: bolder;">
											<a href="${pageContext.request.contextPath}/place/read/${storage.place.placeNo}" style=" text-decoration: none; color: black;">
											${storage.place.placeTitle}</a>
										</h2>
									</td>
								</tr>
								<tr>
									<td>
										<h6 style="color: navy;">*이름을 클릭하시면 상세보기로 이동합니다.</h6>
										<br><h5 style="text-align: left;">주소 : ${storage.place.placeAddr }</h5>
									</td>
									<td>
										<h5 style="text-align: right;">플레이스 등록일 : ${storage.place.placeRegdate}</h5>
										<h5 style="text-align: right">좋아요 등록일 : ${storage.placeStorageRegdate}</h5>
									</td>
								</tr>
							</table>
						</div>
						<div class="listing__details__gallery">
							<div class="listing__details__gallery__pic">
								<div class="listing__details__gallery__slider owl-carousel">
									<c:forEach var="ppList" items="${storage.place.ppList}">
									<img data-imgbigurl="${pageContext.request.contextPath}/save/place/${ppList.ppPath}"
									src="${pageContext.request.contextPath}/save/place/${ppList.ppPath}" style="width: 300px; height: 200px;">
									</c:forEach>
								</div>
							</div>
						</div>
								<div class="listing__details__comment__item__text">
									<h5>플레이스 설명 : ${storage.place.placeContent}</h5>
									<br>
									<hr>
								</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</section>
	<!-- Listing Details Section End -->



</body>

</html>