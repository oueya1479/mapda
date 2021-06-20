<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="pcoded-content">
		<!-- Page-header start -->
		<div class="page-header">
			<div class="page-block">
				<div class="row align-items-center">
					<div class="col-md-8">
						<div class="page-header-title">
							<h5 class="m-b-10">플레이스 변경 폼</h5>
							<p class="m-b-0">플레이스의 정보를 수정합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h5>플레이스 정보</h5>
					</div>
					<div class="card-block">
						<form class="form-material" accept-charset="UTF-8" method="post"
							action="${pageContext.request.contextPath}/admin/update_place">
							<div class="form-group form-default">
								<input type="text"  class="form-control" name="placeTitle"
									value="${place.placeTitle}"> <span
									class="form-bar"></span> <label class="float-label">제목</label>
							</div>
							<div class="form-group form-default">
								<input type="text"  class="form-control" name="placeContent"
									value="${place.placeContent}" > <span
									class="form-bar"></span> <label class="float-label">내용</label>
							</div>
							<div class="form-group form-default">
								<input type="text"  class="form-control" name="placeAddr"
									value="${place.placeAddr}"> <span
									class="form-bar"></span> <label class="float-label">주소</label>
							</div>
							<div class="form-group form-default">
								<input type="text"  class="form-control" name="placeTag"
									value="${place.placeTag}"> <span
									class="form-bar"></span> <label class="float-label">태그</label>
							</div>
							<div class="form-group form-default">
								<input type="text" class="form-control" name="placeHidden"
									value="${place.placeHidden}"> <span
									class="form-bar"></span> <label class="float-label">히든플레이스 여부</label>
							</div>
							<button class="btn btn-default" style="margin-right: 5px"
								id="modify" value="${place.placeNo}">수정</button>
							<input name="placeNo" value="${place.placeNo}" type="hidden">
							<input name="placeLatitude" value="${place.placeLatitude}" type="hidden">
							<input name="placeLongitude" value="${place.placeLongitude}" type="hidden">
							<input name="placeLike" value="${place.placeLike}" type="hidden">
							<input name="placeStar" value="${place.placeStar}" type="hidden">
							<input name="placeIconNo" value="${place.placeIconNo}" type="hidden">
							<input name="placeIconName" value="${place.placeIconName}" type="hidden">
							<input name="placeIconPath" value="${place.placeIconPath}" type="hidden">
							<input name="placeStatus" value="${place.placeStatus}" type="hidden">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
