<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>Mega Able bootstrap admin template by codedthemes</title>
<!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description"
	content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
<meta name="keywords"
	content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
<meta name="author" content="codedthemes" />
<!-- Favicon icon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/admin/images/favicon.ico"
	type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500"
	rel="stylesheet">
<!-- waves.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/pages/waves/css/waves.min.css"
	type="text/css" media="all">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/bootstrap/css/bootstrap.min.css">
<!-- waves.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/pages/waves/css/waves.min.css"
	type="text/css" media="all">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/icon/themify-icons/themify-icons.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/icon/font-awesome/css/font-awesome.min.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/jquery.mCustomScrollbar.css">
</head>
<body>
	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="loader-track">
			<div class="preloader-wrapper">
				<div class="spinner-layer spinner-blue">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
				<div class="spinner-layer spinner-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-yellow">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-green">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<tiles:insertAttribute name="header" />

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<tiles:insertAttribute name="side-bar" />
					<div class="pcoded-content">
						<!-- Page-header start -->
						<div class="page-header">
							<div class="page-block">
								<div class="row align-items-center">
									<div class="col-md-8">
										<div class="page-header-title">
											<h5 class="m-b-10">${title}</h5>
											<p class="m-b-0">${content}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<tiles:insertAttribute name="body" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/jquery-ui/jquery-ui.min.js "></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/popper.js/popper.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/bootstrap/js/bootstrap.min.js "></script>
	<!-- waves js -->
	<script
		src="${pageContext.request.contextPath}/admin/pages/waves/js/waves.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/jquery-slimscroll/jquery.slimscroll.js "></script>
	<!-- waves js -->
	<script
		src="${pageContext.request.contextPath}/admin/pages/waves/js/waves.min.js"></script>
	<!-- modernizr js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/modernizr/modernizr.js "></script>
	<!-- Custom js -->
	<script src="${pageContext.request.contextPath}/admin/js/pcoded.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/admin/js/vertical-layout.min.js "></script>
	<script
		src="${pageContext.request.contextPath}/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/script.js"></script>

</body>

</html>
