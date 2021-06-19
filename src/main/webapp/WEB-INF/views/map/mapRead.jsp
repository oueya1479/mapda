<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<script>
$(function(){
	$.ajax{
		
		
	}
})
</script>


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

			<!-- 버튼 생성 조건 1. 권한을 갖어야함(로그인이 되어 있어야 함), 2.themeMap을 제작한 사람과 로그인한 사람이 같아야함. -->
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.memNo" var="loginMemNo" />
				<c:if test="${themeMap.member.memNo== loginMemNo}">
					<form
						action="${pageContext.request.contextPath}/place/placeInsertForm"
						method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}"> <input type="hidden" name="memNo"
							value="${themeMap.member.memNo}"> <input type="hidden"
							name="mapNo" value="${themeMap.mapNo}">
						<div class="listing__text__top__right">
							<button type="submit" class="site-btn">Register New
								Place</button>
						</div>
					</form>
				</c:if>
			</sec:authorize>

		</div>
		<div class="listing__list">

			<c:forEach items="${requestScope.themeMap.place}" var="place"
				varStatus="state">
				<div class="listing__item">
					<div class="listing__item__pic set-bg"
						data-setbg="${pageContext.request.contextPath}/img/map/${place.ppList[0].ppPath}">
						<%-- <img
								src="${pageContext.request.contextPath}/img/placeicon/${place.placeIconPath}" style="width:60px; height:60px"
								alt=""> --%>
						<div class="listing__item__pic__tag top_rate">
							<a
								href="${pageContext.request.contextPath}/place/read/${place.placeNo}">See
								Details</a>
						</div>

					</div>


					<div class="listing__item__text">
						<div class="listing__item__text__inside">
							<a
								href="${pageContext.request.contextPath}/place/read/${place.placeNo}"><h5>
									${place.placeTitle}</h5> <br></a> <a href="#">
									<img
								src="${pageContext.request.contextPath}/img/map/star.png" alt=""
								style="height: 20px; width: 20px;"></a>&nbsp;&nbsp;&nbsp;${place.placeStar}
							<div class="listing__item__text__rating"></div>
							<ul>
								<li><span class="icon_zoom-in_alt"></span>
									${place.placeContent}</li>
								<li><span class="icon_pin_alt"></span> ${place.placeAddr}</li>
							</ul>
						</div>
						<p>
						<div class="listing__item__text__info">
							<div class="listing__item__text__info__left">
								<a href=""><img
									src="${pageContext.request.contextPath}/img/map/heart.png"
									style="height: 20px; width: 20px;""> </a><span>${place.placeLike}</span>

							</div>
							<div class="listing__item__text__info__right closed">
								<%-- <img src="${pageContext.request.contextPath}/img/map/ribbon.png"
									style="height: 20px; width: 20px;""> --%>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- 확인하려고 띄운 폼 지울 것 -->
	</section>
	<!-- Listing Section End -->

	<!-- Map Begin -->
	<div class="listing__map">
		<div id="map" style="width: 100%; height: 1000px;"></div>

		<p id="result"></p>

		<c:choose>
			<c:when test="${empty requestScope.themeMap.place}">

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a72fc6d2575e28fbd026e0a4b7f8c331"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					mapOption = {
						center : new kakao.maps.LatLng(37.52057532965539,
								127.02430963130959), // 지도의 중심좌표
						level : 9
					// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
					var positions = [
						 	 ]; 

					for (var i = 0; i < positions.length; i++) {
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							map : map, // 마커를 표시할 지도
							position : positions[i].latlng
						// 마커의 위치
						});

						// 마커에 표시할 인포윈도우를 생성합니다 
						var infowindow = new kakao.maps.InfoWindow({
							content : positions[i].content
						// 인포윈도우에 표시할 내용
						});

						// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						// 이벤트 리스너로는 클로저를 만들어 등록합니다 
						// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						kakao.maps.event.addListener(marker, 'mouseover',
								makeOverListener(map, marker, infowindow));
						kakao.maps.event.addListener(marker, 'mouseout',
								makeOutListener(infowindow));
					}

					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow) {
						return function() {
							infowindow.open(map, marker);
						};
					}

					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
						return function() {
							infowindow.close();
						};

					}
				</script>



			</c:when>
			<c:otherwise>
				<c:forEach items="${themeMap.place}" var="place">
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a72fc6d2575e28fbd026e0a4b7f8c331"></script>

					<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
							mapOption = {
								center : new kakao.maps.LatLng( 37.52057532965539,
										127.02430963130959), // 지도의 중심좌표
								level : 8
							// 지도의 확대 레벨
							};

							var map = new kakao.maps.Map(mapContainer,
									mapOption); // 지도를 생성합니다

							// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
							var positions = [
									{
										content : '<div>${place.placeTitle}</div>',
										latlng : new kakao.maps.LatLng(
												${place.placeLatitude}, ${place.placeLongitude})
									}
									];

							for (var i = 0; i < positions.length; i++) {
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									map : map, // 마커를 표시할 지도
									position : positions[i].latlng
								// 마커의 위치
								});

								// 마커에 표시할 인포윈도우를 생성합니다 
								var infowindow = new kakao.maps.InfoWindow({
									content : positions[i].content
								// 인포윈도우에 표시할 내용
								});

								// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
								// 이벤트 리스너로는 클로저를 만들어 등록합니다 
								// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
								kakao.maps.event.addListener(marker,
										'mouseover', makeOverListener(map,
												marker, infowindow));
								kakao.maps.event
										.addListener(marker, 'mouseout',
												makeOutListener(infowindow));
							}

							// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
							function makeOverListener(map, marker, infowindow) {
								return function() {
									infowindow.open(map, marker);
								};
							}

							// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
							function makeOutListener(infowindow) {
								return function() {
									infowindow.close();
								};
								

								
							}
						</script>


				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

	</div>

	<!-- Map End -->

</body>

</html>