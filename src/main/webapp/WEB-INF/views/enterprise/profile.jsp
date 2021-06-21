<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
</head>

<body>

    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="/img/listing/details/listing-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${enterprise.member.memImage}" alt="" style="width: 80px; height: 80px">
                        </div>
                        <div class="listing__hero__text">
                            <h2>${enterprise.entName}</h2>
                            <div class="listing__hero__widget">
                                <div>${fn:length(enterprise.enterprisePostList)} Review</div>
                            </div>
                            <p><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus, Georgia, United States</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__hero__btns">
                        <a href="#" class="primary-btn share-btn"><i class="fa fa-mail-reply"></i> Share</a>
                        <a href="#" class="primary-btn"><i class="fa fa-bookmark"></i> Bookmark</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Section End -->

    <!-- Listing Details Section Begin -->
    <section class="listing-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__details__text">
                        <div class="listing__details__about">
                            <h4>Overview</h4>
                            ${enterprise.entContent}
                        </div>
                        <div class="listing__details__comment">
                            <h4>Comment</h4>
                              <c:forEach items="${enterprise.enterprisePostList}" var="post">
	                            <div class="listing__details__comment__item">
		                            <div style="float: left; margin-right: 25px">
		                                <img src="/resources/${post.epLogo}" alt="" style="height: 150px; object-fit: cover; max-width: 150px">
		                            </div>
	                                <div class="listing__details__comment__item__text">
	                                    <span>
	                                    	<fmt:parseDate value="${post.epRegdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>        
	                        	    		<fmt:formatDate value="${parsedDateTime}" pattern="yyyy.MM.dd"/>	
										</span>
	                                    <a href="${pageContext.request.contextPath}/enterprise/post/${post.epNo}"><h5>${post.epTitle}</h5></a>
	                                    ${post.epContent}
	                                    <p>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                    </div><br><br>
                    
                </div>
                <div class="col-lg-4">
                    <div class="listing__sidebar">
                        <div class="listing__sidebar__contact">
                            <div class="listing__sidebar__contact__map">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d24168.833995532765!2d-74.79633710628465!3d40.78172222265886!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c384de7a5300b9%3A0x8afc61979217d49d!2sLong%20Valley%2C%20NJ%2007853%2C%20USA!5e0!3m2!1sen!2sbd!4v1586852528126!5m2!1sen!2sbd"
                                    height="200" style="border:0;" allowfullscreen="" aria-hidden="false"
                                    tabindex="0"></iframe>
                                <img src="img/listing/details/map-icon.png" alt="">
                            </div>
                            <div class="listing__sidebar__contact__text">
                                <h4>Contacts</h4>
                                <ul>
                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New Philadelphia, Ohio,
                                        United States</li>
                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                    <li><span class="icon_mail_alt"></span> Info.colorlib@gmail.com</li>
                                    <li><span class="icon_globe-2"></span> https://colorlib.com</li>
                                </ul>
                                <div class="listing__sidebar__contact__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="google"><i class="fa fa-google"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Details Section End -->

</body>

</html>