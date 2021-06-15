<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
    <header class="header header--normal">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="${pageContext.request.contextPath}/main/index"><img src="/img/footer-logo.png" alt="" style="height: 50px;"></a>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="/main/index">Home</a></li>
                               <li><a href="#">Map Service</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/map/mapList">All Maps</a></li>
                                        <li><a href="${pageContext.request.contextPath}/map/insertForm">Make My Map</a></li>
                                        <li><a href="${pageContext.request.contextPath}/map/manageMap">Manage My Maps</a></li>
                                     
                                    </ul>
                                </li>

                                <li><a href="#">Enterprise</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/enterprise/list">Enterprise Service</a></li>
                                        
                                    </ul>
                                </li>
                                <li><a href="#">Coupon</a>
                                    <ul class="dropdown">
                                        <li><a href="/coupon/list">All Coupons</a></li>
                                        <li><a href="/coupon/admin">Manage Coupons</a></li>
                                        
                                    </ul>
                                </li>
                               <li><a href="#">Event</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/event/list">All Events</a></li>
                                        <li><a href="${pageContext.request.contextPath}/event/posting">Join Event</a></li>
                                       
                                    </ul>
                                </li>
                                <li><a href="#">Mapbership</a>
                                	<ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/member/pay">Regular payment</a></li>
                                        <li><a href="#">My Membership</a></li>
                                       
                                    </ul>
                                </li>
                                <li><a href="#">My Page</a>
                                	<ul class="dropdown">
                                        <li><a href="/about">My Info</a></li>
                                        <li><a href="/listing-details">My Post</a></li>
                                        <li><a href="/blog-details">My Point</a></li>
                                        <li><a href="/myPage/myCoupon">My Coupon</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                        <div class="header__menu__right">
                            <a href="${pageContext.request.contextPath}/member/registerForm" class="primary-btn">Join Us</a>
                            <a href="${pageContext.request.contextPath}/member/loginForm" class="login-btn"><i class="fa fa-user"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header Section End -->