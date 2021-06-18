≥<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

<!-- memNo 변수설정 -->
<%-- <sec:authentication property="principal.memNo" var="mno"  /> --%>

<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script>
$(function() {
	$("input[value=Modify]").click(function() {
						var mapNo = $(this).attr("id")
						var url = "${pageContext.request.contextPath}/map/modifyForm?mapNo="+ mapNo;
						$(location).attr('href', url);
					})
					
	            $(document).on("click","input[value=Delete]", function() {
						var mapNo = $(this).attr("id")
						var pwd = prompt("비밀번호를 입력하세요.");
						$.ajax({
							url:"${pageContext.request.contextPath}/map/check",
							type:"post",
							dataType:"text",
							data: {"pwd" : pwd},
							success: function(data){
								if(data=='ok'){
									$("#mapNo").val(mapNo)
									$("#requestForm")
									.attr("action",
											"${pageContext.request.contextPath}/map/deleteMap");
									$("#requestForm").submit();
								}else{
									alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요")
								}
							},	
							error : function(err) {
								alert("지도 삭제 오류. 다시 시도해주세요")
							}
						});
						
					})
});
</script>


</head>

<body>



	<div class="breadcrumb-area set-bg"
		data-setbg="/img/breadcrumb/breadcrumb-blog.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Our Your Maps in Mapda</h2>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Most Search Section Begin -->
	<section class="most-search spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>All your Maps in here!</h2>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="most__search__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab"> <span
									class="flaticon-039-fork"></span> Restaurent
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

								<c:forEach items="${themeList}" var="map">
									<div class="col-lg-4 col-md-6">
										<div class="listing__item">
											<div class="listing__item__pic set-bg"
												data-setbg="${pageContext.request.contextPath}/save/${map.mapImg}">

												<div class="listing__item__pic__tag">
													${map.mapCategory.categoryName}</div>
												<div class="listing__item__pic__btns">
													<a href="#"><span>${map.mapNo}</span></a>
												</div>
											</div>
											<div class="listing__item__text">
												&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
												&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
												&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
												&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

												<div class="listing__item__text__inside">
													<h5>
														<a
															href="${pageContext.request.contextPath}/map/mapRead/${map.mapNo}">${map.mapTitle}</a>
													</h5>
													<div class="listing__item__text__rating">
														<div class="listing__item__rating__star">
															<p>${map.mapContent}</p>
														</div>
													</div>
													<h6 style="text-align: right;">${map.member.memId}</h6>
													<p>
													<p>
												</div>
												<div class="listing__item__text__info">
													<div class="listing__item__text__info__left">
														<img
															src="${pageContext.request.contextPath}/img/map/heart.png"
															alt=""> <span>${map.mapLike}</span>
													</div>
													<div class="listing__item__text__info__right">
														<p style="text-align: right;">
															<img
																src="${pageContext.request.contextPath}/img/map/view.png"
																alt="" style="height: 20px; width: 20px;">
															${map.mapReadnum}
														</p>
													</div>
												</div>
											</div>
										</div>
										<input type="button" class="btn btn-outline-danger"
											value="Modify" id="${map.mapNo}" name="modifyMap"
											style="width: 100px" /> <input type="button"
											class="btn btn-outline-dark" value="Delete" name="deleteMap"
											id="${map.mapNo}" style="width: 100px; float: right;" />
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<form name="requestForm" method="post" id="requestForm">
			<input type=hidden name="mapNo" value="" id="mapNo">
		</form>
	</section>
	<!-- Most Search Section End -->


	<!-- Newslatter Section End -->
</body>

</html>