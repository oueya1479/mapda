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
							<form method="post" action="${pageContext.request.contextPath}/enterprise/write">
							
								<label for="epTitle" class="form-label">Title</label>
								<input type="text" name="epTitle" class="form-control" id="epTitle" placeholder="Title" required>
								
								<label for="epContent" class="form-label">Content</label>
								<textarea class="form-control" name="epContent" id="epContent" style="min-height: 200px;" onkeydown="resize(this)" onkeyup="resize(this)" placeholder="Content" required></textarea>
								
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