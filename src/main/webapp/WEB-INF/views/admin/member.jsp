<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		$(document).on("click", "#modify", function(event) { //버튼을 클릭 했을시 popupOpen 함수 출력 
			console.log('click');
			popupOpen($(this).val());
		});
	})
	function popupOpen(val) {
		var url = "${pageContext.request.contextPath}/admin/member_modify/"
				+ val; //팝업창에 출력될 페이지 URL
		var winWidth = 700;
		var winHeight = 600;
		var popupOption = "width=" + winWidth + ", height=" + winHeight; //팝업창 옵션(optoin)
		var myWindow = window.open(url, "회원 정보 수정", popupOption);
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
							<h5>회원 정보</h5>
							<span>회원의 정보를 탐색하고 수정할 수 있습니다.</span>
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
											<th>Id</th>
											<th>Address</th>
											<th>Username</th>
											<th>Age</th>
											<th>Grade</th>
											<th>회원 정보 수정</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${memberList}" var="member">
											<tr>
												<th scope="row">${member.memNo}</th>
												<td>${member.memId}</td>
												<td>${member.memName}</td>
												<td>${member.memAddr}</td>
												<td>${member.memAge}</td>
												<td>${member.memGrade}</td>
												<td>
													<button class="btn btn-default" style="margin-right: 5px"
														id="modify" value="${member.memNo}">수정</button>
													<button class="btn btn-danger">탈퇴</button>
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
