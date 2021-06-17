<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<style>
a:hover {
	color: black;
}
</style>
</head>

<body>
  

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-area set-bg" data-setbg="img/breadcrumb/breadcrumb-blog.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Enterprise</h2>
                        <div class="breadcrumb__option">
                            <a href="#"><i class="fa fa-home"></i> Home</a>
                            <span>Enterprise</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                    	<c:forEach items="${enterprisePostList.content}" var="ent">
	                        <div class="col-lg-6 col-md-6">
	                            <div class="blog__item">
	                                <div class="blog__item__pic set-bg" data-setbg="${ent.epLogo}"></div>
	                                <div class="blog__item__text">
	                                    <ul class="blog__item__tags">
	                                        <li>${ent.epTag}</li>
	                                    </ul>
	                                    <h5><a href="${pageContext.request.contextPath}/enterprise/post/${ent.epNo}">${ent.epTitle}</a></h5>
	                                    <ul class="blog__item__widget">
	                                        <li><i class="fa fa-clock-o"></i>${ent.epRegdate}</li>
	                                        <li><a href="${pageContext.request.contextPath}/enterprise/profile/${ent.enterprise.member.memNo}"><i class="fa fa-user"></i> ${ent.enterprise.entName}</a></li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                    <div class="blog__pagination">
                        <a href="#"><i class="fa fa-long-arrow-left"></i> Pre</a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Searching...">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__recent">
                            <h5>Recent Post</h5>
                        <c:forEach items="${enterprisePostList.content}" var="post" begin="0" end="5">
                            <a href="${pageContext.request.contextPath}/enterprise/post/${post.epNo}" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i>${post.epTag}</span>
                                    <h6>${post.epTitle}</h6>
                                    <p><i class="fa fa-clock-o"></i>${post.epRegdate}</p>
                                </div>
                            </a>
                            </c:forEach>
                        </div>
                        <div class="blog__sidebar__categories">
                            <h5>Categories</h5>
                            <ul>
                           		<c:forEach items="${categories}" var="category">
                                	<li><a href="">${category.category}<span>${fn:length(category.enterprisePostList)}</span></a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="blog__sidebar__tags">
                            <h5>Popular Tag</h5>
                            <a href="#">Business</a>
                            <a href="#">Marketing</a>
                            <a href="#">Payment</a>
                            <a href="#">Travel</a>
                            <a href="#">Finance</a>
                            <a href="#">Videos</a>
                            <a href="#">Ideas</a>
                            <a href="#">Unique</a>
                            <a href="#">Music</a>
                            <a href="#">Key</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Newslatter Section Begin -->
    <section class="newslatter">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="newslatter__text">
                        <h3>Subscribe Newsletter</h3>
                        <p>Subscribe to our newsletter and don’t miss anything</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <form action="#" class="newslatter__form">
                        <input type="text" placeholder="Your email">
                        <button type="submit">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Newslatter Section End -->


</html>