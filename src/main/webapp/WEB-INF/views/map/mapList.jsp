<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

<!-- memNo 변수설정 -->
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.memNo" var="mno" />
</sec:authorize>


<style>
/* #this(overflow     : hidden;) */
</style>
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
							
							if (pwd==$("#memPw").val()) {
								$("#requestForm")
										.attr("action",
												"${pageContext.request.contextPath}/map/deleteMap");
								$("#requestForm").submit();
							}else{
								alert("비밀번호오류입니다")
							}
						})
	});
</script>
<script type="text/javascript">
	$(function(){
		$(document).on('click', '#subButton', function() {
			let mapNo = $(this).attr('name');
			$.ajax({
				url:"${pageContext.request.contextPath}/map/subscribe",
				type:"get",
				dataType:"json",
				data: {"mapNoStr" : $(this).attr('name'), "memNoStr" : ${mno}},
				success: function(data){
					if(data == -1){
	                    alert("구독 오류","error","확인",function(){});
	                } else if(data==1){
						 $("#subButton").attr("src","/img/map/bookmark-tag.png")
					} else if(data==0){
						 $("#subButton").attr("src","/img/map/ribbon.png")
					}
				},
				error : function(err) {
					console.log(err + "에러 발생");
				}
			});
		});//클릭function 끝
	});//script 끝
</script>
</head>

<body>



	<div class="breadcrumb-area set-bg"
		data-setbg="/img/breadcrumb/breadcrumb-blog.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Our All Maps</h2>
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
						<h2>All our Maps in here!</h2>
						<p>You can find fanciest places with Mapda's various Maps~</p>
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
								<c:forEach items="${mapList.content}" var="map">
									<div class="col-lg-4 col-md-6">
										<div class="listing__item">
											<div class="listing__item__pic set-bg"
												data-setbg="${pageContext.request.contextPath}/img/listing/list-1.jpg">

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
												
												
												<%-- 
												<c:choose>
												 	<c:when test="">
												 	<img
													src="${pageContext.request.contextPath}/img/map/ribbon.png"
													alt="" style="height: 20px; width: 20px; cursor: pointer;"
													id="subButton"><br>
												 	</c:when>
													<c:when test="${pageContext.request.userPrincipal ne map.mapNo and map.mapStorage.memNo eq null}">
														<input type="button" class="btm_image"><img
													src="${pageContext.request.contextPath}/img/map/bookmark-tag.png"
													alt="" style="height: 20px; width: 20px; cursor: pointer;"
													id="subButton"/><br>
													</c:when>
													<c:otherwise>
														<img
													src="${pageContext.request.contextPath}/img/map/ribbon.png"
													alt="" style="height: 20px; width: 20px; cursor: pointer;"
													id="subButton"><br>
													</c:otherwise>
												</c:choose> --%>


												<img
													src="${pageContext.request.contextPath}/img/map/ribbon.png"
													alt="" style="height: 20px; width: 20px; cursor: pointer;"
													id="subButton" name="${map.mapNo}"
													><br>
												<div class="listing__item__text__inside">

													<h5>

														<a
															href="${pageContext.request.contextPath}/map/mapRead/${map.mapNo}">${map.mapTitle}</a>
													</h5>

													<div class="listing__item__text__rating">


														<div class="listing__item__rating__star">
															<p id="this">${map.mapContent}</p>
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
										
										<input type="button" class="btn btn-outline-danger" value="Modify" id="${map.mapNo}" name="modifyMap"
											style="width: 100px" /> 
										<input type="button" class="btn btn-outline-dark" value="Delete" name="deleteMap" id="${map.mapNo}" 
										style="width: 100px; float: right;" />
										
									</div>
									<form name="requestForm" method="post" id="requestForm">
										<input type=hidden name="mapNo" value="${map.mapNo}">
										<input type=hidden name="memPw" value="${map.member.memPw}"
											id="memPw">
									</form>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>


	</section>
	<!— Most Search Section End —>


	<!— Newslatter Section End —>
</body>

</html>