<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                            <img src="${member.memImage}" alt="" style="width: 80px; height: 80px">
                        </div>
                        <div class="listing__hero__text">
                            <h2>${member.memName}</h2>
                            <div class="listing__hero__widget">
                                <div class="listing__hero__widget__rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <div>120 Review</div>
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
                            임시용
                        </div>
                        <div class="listing__details__comment">
                            <h4>Comment</h4>
                              <c:forEach items="${member.mapList}" var="post">
	                            <div class="listing__details__comment__item">
		                            <div style="float: left; margin-right: 25px">
		                                <img src="${post.epLogo}" alt="" style="width: 150px; height: 150px;">
		                            </div>
	                                <div class="listing__details__comment__item__text">
	                                    <div class="listing__details__comment__item__rating">
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                    </div>
	                                    <span>${post.epRegdate}</span>
	                                    <h5>${post.enterprise.entName}</h5>
	                                    ${post.epContent}
	                                    <p>
	                                    <ul>
	                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
	                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
	                                    </ul>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="listing__details__gallery">
                            <h4>Gallery</h4>
                            <div class="listing__details__gallery__pic">
                                <div class="listing__details__gallery__item">
                                    <img class="listing__details__gallery__item__large"
                                        src="img/listing/details/listing-details-1.jpg" alt="">
                                    <span><i class="fa fa-camera"></i> 170 Image</span>
                                </div>
                                <div class="listing__details__gallery__slider owl-carousel">
                                    <img data-imgbigurl="img/listing/details/listing-details-1.jpg"
                                        src="img/listing/details/thumb-1.jpg" alt="">
                                    <img data-imgbigurl="img/listing/details/listing-details-1.jpg"
                                        src="img/listing/details/thumb-2.jpg" alt="">
                                    <img data-imgbigurl="img/listing/details/listing-details-1.jpg"
                                        src="img/listing/details/thumb-3.jpg" alt="">
                                    <img data-imgbigurl="img/listing/details/listing-details-1.jpg"
                                        src="img/listing/details/thumb-4.jpg" alt="">
                                </div>
                            </div>
                        </div>
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
                        <div class="listing__sidebar__working__hours">
                            <h4>Working Hours</h4>
                            <ul>
                                <li>Monday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Tuesday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Wednesday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Thursday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Friday <span class="opening">Opening</span></li>
                                <li>Saturday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Saturday <span class="closed">Closed</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Details Section End -->

</body>

</html>