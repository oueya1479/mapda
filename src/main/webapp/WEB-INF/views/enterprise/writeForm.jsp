<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$()
	});
</script>
<script>
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	}
</script>
</head>
<body>
	<div style="height: 100px"></div>
	<!-- Listing Details Section Begin -->
	<section class="listing-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-10">
					<div class="listing__details__text">
						<div class="listing__details__review">
							<p>
							<p>
							<h4>Enterprise Post</h4>
							<form method="post"
								action="${pageContext.request.contextPath}/enterprise/write"
								enctype="multipart/form-data">

								<label for="exampleInputFile">파일 업로드</label>
								<div class="col-lg-4" style="margin: 0; padding: 0">
									<input type="file" id="exampleInputFile" name="files"
										multiple="multiple" style="margin-top: 10px; padding-top: 10px">
								</div>

								<label for="epTitle" class="form-label">Title</label>
								<div class="row">
									<div class="col-lg-6" style="margin: 0">
										<input type="text" name="epTitle" class="form-control"
											id="epTitle" placeholder="Title" required>
									</div>
								</div>

								<label for="epContent" class="form-label">Content</label>
								<textarea class="form-control" name="epContent" id="epContent"
									style="min-height: 200px;" onkeydown="resize(this)"
									onkeyup="resize(this)" placeholder="Content" required></textarea>

								<button type="submit" class="site-btn">Submit Now</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Listing Details Section End -->
</body>
</html>