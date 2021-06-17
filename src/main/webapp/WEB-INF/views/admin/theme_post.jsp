<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery.nice-select.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/nice-select.css">
<script>
	$(document).ready(function() {
		$('select').niceSelect();
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
							<h5>테마 지도 게시물</h5>
							<span>테마 지도 게시물을 관리하고, 설정할 수 있습니다.</span>
							<div class="card-header-right">
								<div class="row">
									<div class="col-md-3" style="padding: 0; margin: 0;">
										<select name="contain">
											<option value="title">제목</option>
											<option value="user">작성자</option>
										</select>
									</div>
									<div class="col-md-6" style="padding: 0; margin: 0;">
										<input name="content" type="text" class="form-control" style="margin-right: 30px; height: 42px">
									</div>
									<div class="col-md-2" style="padding: 0; margin: 0;">
										<button class="btn btn-default" type="submit" style="height:42px">검색</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>No</th>
											<th>Title</th>
											<th>작성자</th>
											<th>조회수</th>
											<th>좋아요수</th>
											<th>등록날짜</th>
											<th>플레이스 개수</th>
											<th>게시물 수정</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${themeList.content}" var="theme">
											<tr>
												<th scope="row">${theme.mapNo}</th>
												<td>${theme.mapTitle}</td>
												<td>${theme.member.memId}</td>
												<td>${theme.mapReadnum}</td>
												<td>${theme.mapLike}</td>
												<td>${theme.mapRegdate}</td>
												<td>${fn:length(theme.place)}</td>
												<td>
													<button class="btn btn-default" style="margin-right: 5px"
														id="modify" value="${theme.mapNo}">수정</button>
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