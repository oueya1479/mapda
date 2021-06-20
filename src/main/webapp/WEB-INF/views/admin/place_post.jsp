<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">

<head>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script>
$(function() {
	$(document).on("click", "#modify", function(event) {
		popupOpen($(this).val());
	});
})
function popupOpen(val) {
	var url = "${pageContext.request.contextPath}/admin/place_post_modify/"
			+ val; 
	var winWidth = 700;
	var winHeight = 600;
	var popupOption = "width=" + winWidth + ", height=" + winHeight; //팝업창 옵션(optoin)
	var myWindow = window.open(url, "플레이스 정보 수정", popupOption);
}
</script>
</head>
<body>
	<!-- Page-header end -->
	<div class="pcoded-inner-content">
		<!-- Main-body start -->
		<div class="main-body">
			<div class="page-wrapper">
				<!-- Page-body start -->
				<div class="page-body">
					<!-- Basic table card start -->
					<div class="card">
						<div class="card-header">
							<h5>플레이스 게시물</h5>
							<span>플레이스 게시물을 관리하고, 설정할 수 있습니다.</span>
							<div class="card-header-right">
								<ul class="list-unstyled card-option">
									<li><i class="fa fa fa-wrench open-card-option"></i></li>
									<li><i class="fa fa-window-maximize full-card"></i></li>
									<li><i class="fa fa-minus minimize-card"></i></li>
									<li><i class="fa fa-refresh reload-card"></i></li>
									<li><i class="fa fa-trash close-card"></i></li>
								</ul>
							</div>
						</div>
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>제목</th>
											<th>주소</th>
											<th>태그</th>
											<th>히든플레이스 여부</th>
											<th>등록날짜</th>
											<th>게시물 수정</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${placeList.content}" var="place">
											<tr>
												<th scope="row">${place.placeNo}</th>
												<td>${place.placeTitle}</td>
												<td>${place.placeAddr}</td>
												<td>${place.placeTag}</td>
												<td>${place.placeHidden}</td>
												<td>${place.placeRegdate}</td>
												<td>
													<button class="btn btn-default" style="margin-right: 5px"
														id="modify" value="${place.placeNo}">수정</button>
													<button class="btn btn-danger">삭제</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Main-body end -->

		<div id="styleSelector"></div>
	</div>
</body>

</html>