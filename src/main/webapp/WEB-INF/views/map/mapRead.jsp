<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

</head>

<body class="ov-hid">

	<!-- Filter Begin -->
	<div class="filter nice-scroll">
		<div class="filter__title">
			<h5>
				<i class="fa fa-filter"></i> Filter
			</h5>
		</div>
		<div class="filter__search">
			<input type="text">
		</div>
		<div class="filter__select">
			<select>
				<option value="">All Categories</option>
			</select>
		</div>

		<div class="filter__radius">

			<div class="price-range-wrap"></div>
		</div>
		<div class="filter__price">
			<p>별점</p>
			<div class="price-range-wrap">
				<div
					class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content">
					<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
					<span tabindex="0"
						class="ui-slider-handle ui-corner-all ui-state-default"></span>
				</div>
				<div class="range-slider">
					<div class="price-input">
						<input type="text" id="minamount"> <input type="text"
							id="maxamount" value="$80">
					</div>
				</div>
			</div>
		</div>
		<div class="filter__tags">
			<h6>HashTag</h6>
			<label for="coupon"> Coupons <input type="checkbox"
				id="coupon"> <span class="checkmark"></span>
			</label> <label for="sa"> Smoking Allowed <input type="checkbox"
				id="sa"> <span class="checkmark"></span>
			</label> <label for="camping"> Camping <input type="checkbox"
				id="camping"> <span class="checkmark"></span>
			</label> <label for="hot-spots"> Hot Spots <input type="checkbox"
				id="hot-spots"> <span class="checkmark"></span>
			</label> <label for="internet"> Internet <input type="checkbox"
				id="internet"> <span class="checkmark"></span>
			</label> <label for="tr"> Top Rated <input type="checkbox" id="tr">
				<span class="checkmark"></span>
			</label> <label for="hd"> Hot Deal <input type="checkbox" id="hd">
				<span class="checkmark"></span>
			</label>
		</div>
		<div class="filter__btns">
			<button type="submit">Filter Results</button>
			<button type="submit" class="filter__reset">Reset All</button>
		</div>
	</div>
	<!-- Filter End -->










	<!-- Listing Section Begin -->
	<section class="listing nice-scroll">
		<div class="listing__text__top">
			<div class="listing__text__top__left">
				<h5>Places in this Map</h5>
				
			</div>
			<div class="listing__text__top__right">
				<button type="button" class="site-btn">Register New Place</button>
			</div>
		</div>
		<div class="listing__list">
			 <c:choose>
				<c:when test="${empty requestScope.themeMap.place}">

					<p align="center">
						<b><span style="font-size: 13pt; text-align: center;">등록된 플레이스가 없습니다.</span></b>
					</p>
				</c:when>
				<c:otherwise> 
					
						<c:forEach items="${requestScope.themeMap.place}" var="place">
							<div class="listing__item">
								<div class="listing__item__pic set-bg"
									data-setbg="${pageContext.request.contextPath}/img/listing/list-2.jpg">
									<img
										src="${pageContext.request.contextPath}/img/listing/list_icon-2.png"
										alt="">
									<div class="listing__item__pic__tag top_rate">See Details</div>
									
								</div>
								<div class="listing__item__text">
									<div class="listing__item__text__inside">
										<a href="${pageContext.request.contextPath}/place/read/${place.placeNo}"><h5> ${place.placeTitle}</h5><br></a>
										<a href="#"><img src="${pageContext.request.contextPath}/img/map/star.png"alt="" 
											style="height:20px; width:20px;" ></a>&nbsp;&nbsp;&nbsp;${place.placeStar}
										<div class="listing__item__text__rating">
										</div>
										<ul>
											<li><span class="icon_zoom-in_alt"></span>
												 ${place.placeContent}</li>
											<li><span class="icon_pin_alt"></span> ${place.placeAddr}</li>
										</ul>
									</div><p>
									<div class="listing__item__text__info">
										<div class="listing__item__text__info__left">
											<a href=""><img src="${pageContext.request.contextPath}/img/map/heart.png"style="height:20px; width:20px; 
												alt=""> </a><span>${place.placeLike}</span>

										</div>
										<div class="listing__item__text__info__right closed"><img src="${pageContext.request.contextPath}/img/map/ribbon.png"style="height:20px; width:20px; 
												alt=""></div>
									</div>
								</div>
							</div>
						</c:forEach>
					
				 </c:otherwise>
			</c:choose> 
			
			
			
			
			
			<!-- 확인하려고 띄운 폼 지울 것 -->
			
		
							
	</section>
	<!-- Listing Section End -->

	<!-- Map Begin -->
	<div class="listing__map">
		<div id="map" style="width: 100%; height: 1000px;"></div>

		<p id="result"></p>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a72fc6d2575e28fbd026e0a4b7f8c331"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'bounds_changed', function() {

				// 지도 영역정보를 얻어옵니다 
				var bounds = map.getBounds();

				// 영역정보의 남서쪽 정보를 얻어옵니다 
				var swLatlng = bounds.getSouthWest();

				// 영역정보의 북동쪽 정보를 얻어옵니다 
				var neLatlng = bounds.getNorthEast();

				var resultDiv = document.getElementById('result');
				resultDiv.innerHTML = message;

			});
		</script>


	</div>

	</div>

	<!-- Map End -->

</body>

</html>