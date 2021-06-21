<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                            <div class="p-15 p-b-0">
                                <form class="form-material">
                                    <div class="form-group form-primary">
                                        <input type="text" name="footer-email" class="form-control" required="">
                                        <span class="form-bar"></span>
                                        <label class="float-label"><i class="fa fa-search m-r-10"></i>Search</label>
                                    </div>
                                </form>
                            </div>
                            <div class="pcoded-navigation-label" data-i18n="nav.category.navigation">메인</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="${pageContext.request.contextPath}/admin/index" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            <div class="pcoded-navigation-label" data-i18n="nav.category.forms">회원 관리</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/member" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">회원</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/influence" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">인플루언서</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/regular_payment" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">정기 결제</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            <div class="pcoded-navigation-label" data-i18n="nav.category.forms">게시물 관리</div>
                            <ul class="pcoded-item pcoded-left-item">
                                 <li class="pcoded-hasmenu ">
                                    <a href="javascript:void(0)" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-direction-alt"></i><b>M</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">게시물</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="">
                                            <a href="${pageContext.request.contextPath}/admin/theme_post" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">테마지도</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="${pageContext.request.contextPath}/admin/place_post" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">플레이스</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="${pageContext.request.contextPath}/admin/enterprise_post" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">엔터프라이즈</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="${pageContext.request.contextPath}/admin/nearby_post" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">내 근처</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                 <li class="pcoded-hasmenu ">
                                    <a href="javascript:void(0)" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-direction-alt"></i><b>M</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">댓글</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="">
                                            <a href="${pageContext.request.contextPath}/admin/place_reply" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">플레이스</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="${pageContext.request.contextPath}/admin/enterprise_reply" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">엔터프라이즈</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="${pageContext.request.contextPath}/admin/nearby_reply" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">내 근처</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="pcoded-navigation-label" data-i18n="nav.category.forms">쿠폰 관리</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li>
                                    <a href="${pageContext.request.contextPath}/coupon/admin" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">쿠폰 조회</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                              
                            </ul>
                            
                            
                            <div class="pcoded-navigation-label" data-i18n="nav.category.other">문의 관리</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/consulting" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">문의</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                   <li>
                                    <a href="${pageContext.request.contextPath}/admin/report" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">신고</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>