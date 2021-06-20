<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<style>
tr{
	flex: 1;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		$(document).on("click", "#confirm", function(event) {
			if(confirm("인플루언서로 등급을 올리시겠습니까?") == true){
				alert('확인되었습니다.');
				$(location).attr('href','${pageContext.request.contextPath}/admin/levelUp/' + $(this).val());
			} else {
			}
		});
		
		$(document).on("click", "#levelDown", function(event) {
			if(confirm("유저로 등급을 강등시키겠습니까?") == true){
				alert('확인되었습니다.');
				$(location).attr('href','${pageContext.request.contextPath}/admin/levelDown/' + $(this).val());
			} else {
			}
		});
	});
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
							<h5>인플루언서 요청 정보</h5>
							<span>인플루언서 신청 정보를 확인할 수 있습니다.</span>
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
											<th>신청 번호</th>
											<th>아이디</th>
											<th>신청 날짜</th>
											<th>팔로워</th>
											<th>총 조회수</th>
											<th>총 좋아요수</th>
											<th>요청 정보 확인</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${influence}" var="influence">
											<tr>
												<th scope="row">${influence.irNo}</th>
												<td>${influence.member.memId}</td>
												<td>${influence.irReqdate}</td>
												<td>${influence.member.memFollower}</td>
												
												<c:set var = "hits" value = "0" />
												<c:set var = "likes" value = "0" />
												<c:forEach items="${influence.member.mapList}" var="map">
													<c:set var= "hits" value="${total + map.mapReadnum}"/>
													<c:set var= "likes" value="${total + map.mapLike}"/>
												</c:forEach>
												<td><c:out value="${hits}"/></td>
												<td><c:out value="${likes}"/></td>
												
												<td>
													<button class="btn btn-default" style="margin-right: 5px"
														id="confirm" value="${influence.member.memNo}">확인</button>
													<button class="btn btn-danger">취소</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<h5>인플루언서 리스트</h5>
							<span>인플루언서 리스트를 탐색하고, 정보를 변경할 수 있습니다.</span>
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
											<th>회원 번호</th>
											<th>아이디</th>
											<th>팔로워</th>
											<th>총 조회수</th>
											<th>총 좋아요수</th>
											<th>요청 정보 확인</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${memberList}" var="member">
											<tr>
												<th scope="row">${member.memNo}</th>
												<td>${member.memId}</td>
												<td>${member.memFollower}</td>
												
												<c:set var = "hits" value = "0" />
												<c:set var = "likes" value = "0" />
												<c:forEach items="${member.mapList}" var="map">
													<c:set var= "hits" value="${total + map.mapReadnum}"/>
													<c:set var= "likes" value="${total + map.mapLike}"/>
												</c:forEach>
												<td><c:out value="${hits}"/></td>
												<td><c:out value="${likes}"/></td>
												
												<td>
													<button class="btn btn-danger" id="levelDown" value="${member.memNo}">강등</button>
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
