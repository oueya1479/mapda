<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(function() {
		$(document).on("click", "#iamport", function(event) { //버튼을 클릭 했을시 popupOpen 함수 출력 
			popupOpen();
		});
		
		

	function popupOpen() {
		var url = "${pageContext.request.contextPath}/payment/iamport";
		var winWidth = 700;
		var winHeight = 600;
		var popupOption = "width=" + winWidth + ", height=" + winHeight; //팝업창 옵션(optoin)
		var myWindow = window.open(url, "결제창", popupOption);
	}  
	
	})
</script>
<style type="text/css">
#mu-pricing {
	background-color: #f8f8f8;
	display: inline;
	float: left;
	width: 100%;
}

.mu-pricing-area {
	display: inline;
	float: left;
	padding: 100px 0;
	width: 100%;
}

.mu-pricing-content {
	display: inline;
	float: left;
	margin-top: 70px;
	width: 100%;
}

.mu-pricing-single {
	background-color: #fff;
	color: #555;
	display: inline;
	float: left;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	width: 100%;
	padding: 30px 0;
}
.mu-pricing-single2 {
	background-color: #fff;
	border: solid 1px rgba(#ff0000, .8);
	color: #555;
	display: inline;
	float: left;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	width: 100%;
	padding: 30px 0;
}

.mu-pricing-single-head {
	border-bottom: 1px solid #eee;
	display: inline-block;
	float: left;
	margin-bottom: 10px;
	width: 100%;
}

.mu-pricing-single-head h4 {
	font-size: 18px;
	margin-bottom: 0;
}

.mu-pricing-single-head .mu-price-tag {
	font-size: 55px;
	font-weight: 700;
	margin-bottom: 0;
	padding: 15px 0 20px;
}

.mu-pricing-single-head .mu-price-tag span {
	font-size: 22px;
	margin-right: -10px;
}

.mu-price-feature {
	padding: 20px 0;
	display: inline-block;
	margin-bottom: 20px;
}

.mu-price-feature li {
	list-style: none;
	line-height: 2;
	margin-bottom: 10px;
}

.mu-pricing-single-footer {
	display: inline-block;
	float: left;
	width: 100%;
}

.mu-order-btn {
	background-color: transparent;
	border-radius: 100px;
	border: 1px solid #555;
	color: #555;
	display: inline-block;
	font-size: 15px;
	font-weight: 400;
	letter-spacing: 1.5px;
	padding: 12px 25px;
	font-weight: 500;
	-webkit-transition: all 0.5s;
	transition: all 0.5s;
	text-transform: uppercase;
}

.mu-popular-price-tag {
	color: #fff;
}

.mu-popular-price-tag .mu-order-btn {
	background-color: #fff;
	border: 1px solid #fff;
}

</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


		<!-- Start Pricing -->
		<section id="mu-pricing">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="mu-pricing-area">

							<div class="mu-heading-area"><br>
								<h2 class="mu-heading-title">JOIN US</h2>
								<span class="mu-header-dot"></span>
								<p>정기결제 회원이 되어 혜택을 누려주세요! </p>
							</div>

							<!-- Start Pricing Content -->
							<div class="mu-pricing-content">
								<div class="row">

									<!-- Pricing Single Content -->
									<div class="col-sm-6 col-md-6">
										<div class="mu-pricing-single">

											<div class="mu-pricing-single-head"><br>
												<h4>Q. 일반회원과 무엇이 다른가요?</h4>
												<br><br>
												
												<!--  
												<p class="mu-price-tag">
													<span>$</span> 15
												</p>
												-->
											</div>

											<ul class="mu-price-feature">
												<li> 테마지도 제작 개수 3개로 제한 </li>
												<li> 테마지도 당 플레이스 개수 10개로 제한 </li>
												<li> 나만의 "히든플레이스" 설정 불가</li>
												<li> 인플루언서 신청 불가 </li>
												
											</ul>
											<br><br>	<br>
<!-- 
											<div class="mu-pricing-single-footer">
												<a href="#" class="mu-order-btn">Order Now!</a>
											</div>
-->
										</div>
									</div>
									<!-- / Pricing Single Content -->

									<!-- Pricing Single Content -->
									<div class="col-sm-6 col-md-6" id="influencer">
										<div class="mu-pricing-single2">


											<div class="mu-pricing-single-head">
												<h4>SUBSCRIPTION</h4>
												<p class="mu-price-tag">
													<span>₩</span> 3,000
												</p>
											</div>

											<ul class="mu-price-feature">
												<li> 테마지도 제작 개수 무제한 </li>
												<li> 테마지도 당 플레이스 개수 무제한 </li>
												<li> 히든 플레이스 설정 가능 </li>
												<li> 인플루언서 신청 가능 </li>
											</ul>
											
											<div class="mu-pricing-single-footer">
												<a href="#" class="mu-order-btn" id="iamport">Start Now!</a>
											</div>
											

										</div>
									</div>
									<!-- / Pricing Single Content -->

									

								</div>
							</div>
							<!-- End Pricing Content -->

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Pricing -->
</body>
</html>