<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

<!-- memNo 변수설정 -->
<sec:authentication property="principal.memNo" var="mno" />

<style>
#submitbt {
	
}
</style>
</head>

<body>

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-area set-bg"
		data-setbg="${pageContext.request.contextPath}/img/breadcrumb/breadcrumb-normal.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Make new Map!</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Contact Section Begin -->
	<section class="contact spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="contact__map">
						<div id="map" style="width: 100%; height: 700px;"></div>

						<p id="result"></p>

						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a72fc6d2575e28fbd026e0a4b7f8c331"></script>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
							mapOption = {
								center : new kakao.maps.LatLng( 37.52057532965539,
										127.02430963130959), // 지도의 중심좌표
								level : 6 
							// 지도의 확대 레벨
							};

							var map = new kakao.maps.Map(mapContainer,
									mapOption); // 지도를 생성합니다

							// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
							var positions = [
									{
										content : '<div>등록해주세요</div>',
										latlng : new kakao.maps.LatLng(
												37.51315275211659,127.0138332874225 )
									},
									{
										content : '<div>멋진</div>',
										latlng : new kakao.maps.LatLng(
												 37.52150652025 , 127.0444230371364 )
									},
									{
										content : '<div>당신만의</div>',
										latlng : new kakao.maps.LatLng(
												37.50637421370697 ,127.02993736744912  )
									},
									{
										content : '<div>함께</div>',
										latlng : new kakao.maps.LatLng(
												37.51646464137678  , 127.03301811114254)
									},
									{
										content : '<div>완성해보아요^^</div>',
										latlng : new kakao.maps.LatLng(
												37.49714025941059, 127.05200793165206)
									},
									{
										content : '<div>지도를</div>',
										latlng : new kakao.maps.LatLng(
												37.50953918005269 ,  127.04948300331004)
									},
										
									{
									content : '<div>맵다와</div>',
										latlng : new kakao.maps.LatLng(
												37.53290001244955 ,  127.02886182995547 )
									},{
										content : '<div>화이팅!!</div>',
										latlng : new kakao.maps.LatLng(
												37.5255347188336 ,  127.0627069334812 )
									},{
										content : '<div>당신의</div>',
										latlng : new kakao.maps.LatLng(
												37.532037785989424 ,  126.98632161857462)
									},
									 
									
									
									
									
									
									
									{
										content : '<div>플레이스를</div>',
										latlng : new kakao.maps.LatLng(
												37.517334149950095 , 127.00406085632146)
									} ];

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



					</div>
				</div>
			</div>



		</div>

	</section>



	<section>
		<form action="${pageContext.request.contextPath}/map/insertMap"
			class="contact__form" method="post" enctype="multipart/form-data">

			<div class="container">
				<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


					Register your places after completing map creation!!</h4>
				<div class="row">
					<input type="hidden" name="mno" value="${mno}"> Theme Name<input
						type="text" name="mapTitle" placeholder="Theme Name">
					Description
					<textarea name="mapContent" placeholder="Description of this Map"></textarea>
					Cover Image <input type="file" name="file" /> Category
					&nbsp;&nbsp;&nbsp;
					<p>
					<div class="nice-select" style="padding: 0px; width: 0px; width: 0px;">
						<select name="categoryNo"  >
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
						</select></div>
				</div>
				<div class="row">
					Accessibility &nbsp;&nbsp;&nbsp;
					
					<p>
					<div class="nice-select" style="padding: 0px; width: 0px; width: 0px;">
						<select name="mapIsopen">
							<option value="0">Private</option>
							<option value="1">Public</option>
						</select>
						</div>
				</div>

			</div>
			<div class="container">
				<button type="submit" class="site-btn" id="submitbt">Create
					Map</button>
			</div>

		</form>
	</section>


</body>

</html>