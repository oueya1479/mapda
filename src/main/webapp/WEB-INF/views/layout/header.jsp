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
                                <li class="active"><a href="/index">Home</a></li>
                                <li><a href="/listing">Listing</a></li>

                                <li><a href="#">Categories</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/about">About</a></li>
                                        <li><a href="/listing-details">Listing Details</a></li>
                                        <li><a href="/blog-details">Blog Details</a></li>
                                        <li><a href="/contact">Contact</a></li>
                                    </ul>
                                </li>
                                <li><a href="/blog">Blog</a></li>
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
                            <a href="#" class="primary-btn"><i class="fa fa-plus"></i>Add Listing</a>
                            <a href="#" class="login-btn"><i class="fa fa-user"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header Section End -->