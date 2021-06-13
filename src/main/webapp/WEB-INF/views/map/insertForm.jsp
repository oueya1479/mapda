<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
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
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(33.450701,
										126.570667), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							var map = new kakao.maps.Map(mapContainer,
									mapOption); // 지도를 생성합니다

							// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
							kakao.maps.event.addListener(map, 'bounds_changed',
									function() {

										// 지도 영역정보를 얻어옵니다 
										var bounds = map.getBounds();

										// 영역정보의 남서쪽 정보를 얻어옵니다 
										var swLatlng = bounds.getSouthWest();

										// 영역정보의 북동쪽 정보를 얻어옵니다 
										var neLatlng = bounds.getNorthEast();

										var resultDiv = document
												.getElementById('result');
										resultDiv.innerHTML = message;

									});
						</script>


					</div>
				</div>
			</div>



		</div>

	</section>



	<section>
		<form action="/map/insertMap" class="contact__form" method="post"
			enctype="multipart/form-data">
			<div class="container">
				<div class="row">

					Theme Name<input type="text" name="mapTitle"
						placeholder="Theme Name"> Description
					<textarea name="mapContent" placeholder="Description of this Map"></textarea>
					Cover Image <input type="file" name="file" /> Category
					&nbsp;&nbsp;&nbsp;
					<p>
						<select name="categoryNo">
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
					<div class="row">
						Accessibility &nbsp;&nbsp;&nbsp;
						<p>
							<select name="mapIsopen">
								<option value="0">Private</option>
								<option value="1">Public</option>
							</select>
					</div>

				</div>
				<div class="container">
				<input type="submit" class="site-btn" id="submitbt"
					value="Create Map" />
				</div>
		</form>
	</section>


</body>

</html>