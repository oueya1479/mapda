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
							<h5 class="m-b-10">회원 정보 변경 폼</h5>
							<p class="m-b-0">회원의 정보를 수정합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h5>회원 정보</h5>
					</div>
					<div class="card-block">
						<form class="form-material" accept-charset="UTF-8" method="post"
							action="${pageContext.request.contextPath}/admin/update_member">
							<div class="form-group form-default">
								<input type="text"  class="form-control" name="memName"
									value="${member.memName}" required=""> <span
									class="form-bar"></span> <label class="float-label">Name</label>
							</div>
							<div class="form-group form-default">
								<input type="text"  class="form-control" name="memAddr"
									value="${member.memAddr}" required=""> <span
									class="form-bar"></span> <label class="float-label">Address</label>
							</div>
							<div class="form-group form-default">
								<input type="text"  class="form-control" name="memGrade"
									value="${member.memGrade}" required=""> <span
									class="form-bar"></span> <label class="float-label">Grade</label>
							</div>
							<div class="form-group form-default">
								<input type="text"  class="form-control" name="memPaystatus"
									value="${member.memPaystatus}" required=""> <span
									class="form-bar"></span> <label class="float-label">Account</label>
							</div>
							<div class="form-group form-default">
								<input type="text" class="form-control" name="memStatus"
									value="${member.memStatus}" required=""> <span
									class="form-bar"></span> <label class="float-label">Status</label>
							</div>
							<div class="form-group form-default">
								<input type="text" class="form-control" name="memImage"
									value="${member.memImage}"> <span
									class="form-bar"></span> <label class="float-label">Image</label>
							</div>
							<button class="btn btn-default" style="margin-right: 5px"
								id="modify" value="${member.memNo}">수정</button>
							<input name="memNo" value="${member.memNo}" type="hidden">
							<input name="memId" value="${member.memId}" type="hidden">
							<input name="memPw" value="${member.memPw}" type="hidden">
							<input name="memAccount" value="${member.memAccount}" type="hidden">
							<input name="memFollower" value="${member.memFollower}" type="hidden">
							<input name="memFollowing" value="${member.memFollowing}" type="hidden">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
