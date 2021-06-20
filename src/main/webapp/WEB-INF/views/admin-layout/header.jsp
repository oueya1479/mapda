<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar header-navbar pcoded-header">
	<div class="navbar-wrapper">
		<div class="navbar-logo">
			<a class="mobile-menu waves-effect waves-light" id="mobile-collapse" style="left : 0"
				href="#!"> <i class="ti-menu"></i>
			</a>
			<div class="mobile-search waves-effect waves-light">
				<div class="header-search">
					<div class="main-search morphsearch-search">
						<div class="input-group">
							<span class="input-group-addon search-close"><i
								class="ti-close"></i></span> <input type="text" class="form-control"
								placeholder="Enter Keyword"> <span
								class="input-group-addon search-btn"><i class="ti-search"></i></span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="navbar-container container-fluid">
			<ul class="nav-right">
				<li class="header-notification"><a href="#!"
					class="waves-effect waves-light"> <i class="ti-bell"></i> <span
						class="badge bg-c-red"></span>
				</a>
					<ul class="show-notification">
						<li>
							<h6>Notifications</h6> <label class="label label-danger">New</label>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="${pageContext.request.contextPath}/admin/images/avatar-2.jpg"
									alt="Generic placeholder image">
							</div>
						</li>
						<li class="waves-effect waves-light">
							<div class="media">
								<img class="d-flex align-self-center img-radius"
									src="${pageContext.request.contextPath}/admin/images/avatar-3.jpg"
									alt="Generic placeholder image">
								<div class="media-body">
									<h5 class="notification-user">Sara Soudein</h5>
									<p class="notification-msg">Lorem ipsum dolor sit amet,
										consectetuer elit.</p>
									<span class="notification-time">30 minutes ago</span>
								</div>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>