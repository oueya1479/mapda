<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<!-- 
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
 -->
<%-- 
  <link href="${pageContext.request.contextPath}/css/jquery.bxslider.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
 <script src="${pageContext.request.contextPath}/js/jquery.bxslider.js"></script>
  --%>
 
 
 <%--
   <link rel="StyleSheet" href="${pageContext.request.contextPath}/css/pgwslideshow.min.css">
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/pgwslideshow.min.js"></script>
  --%>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
// 이미지 설정
//$("img").attr("src","data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAMSURBVBhXY/j//z8ABf4C/qc1gYQAAAAASUVORK5CYII=");
// 이미지 슬라이드 설정
$('#carousel-example-generic').carousel({
// 순환 설정
interval: 1000
// 순환을 정지시킨다.
}).carousel('pause');
});
// 이미지 슬라이드 순환을 개시
$("#carousel_cycle").on("click", function() {
$('#carousel-example-generic').carousel('cycle');
});
// 이미지 슬라이드 순환을 정지
$("#carousel_pause").on("click", function() {
$('#carousel-example-generic').carousel('pause');
});
// 이미지 슬라이드 이동
$("#carousel_move").on("click", function() {
var num = Number($("#carousel_number").val()) - 1;
$('#carousel-example-generic').carousel(num);
});
// 이미지 슬라이드 전 페이지 이동
$("#carousel_prev").on("click", function() {
$('#carousel-example-generic').carousel('prev');
});
// 이미지 슬라이드 다음 페이지 이동
$("#carousel_next").on("click", function() {
$('#carousel-example-generic').carousel('next');
});
$('#carousel-example-generic').on('slide.bs.carousel', function () {
// 슬라이드 인스턴스 메서드가 호출되면 호출된다.
});
$('#carousel-example-generic').on('slid.bs.carousel', function () {
// 회전식 슬라이드가 완료되면 호출된다.
});
 
  </script>

<style type="text/css">

</style>


</head>


<body>

    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="${pageContext.request.contextPath}/img/placeimges/test1.png"><!-- 무슨 사진 넣을지 고민 -->
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${pageContext.request.contextPath}" alt=""><!-- 아이콘 모양? user프로필? -->
                        </div>
                        <div class="listing__hero__text">
                            <h2>${requestScope.place.placeTitle}</h2>
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
                            <p><span class="icon_pin_alt"></span> ${requestScope.place.placeAddr}</p>
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
                            <p> ${requestScope.place.placeContent}</p>
                        </div>
                        <div class="listing__details__gallery">
                            <h4>Gallery</h4>
                            <!-- ============================================================ -->
                     
<%-- 
							        <img src="${pageContext.request.contextPath}/img/placeimges/test1.png" alt="" style="height: 400px; width: 640px;">
							        <img src="${pageContext.request.contextPath}/img/placeimges/test2.png" alt="" style="height: 400px; width: 640px;">
							        <img src="${pageContext.request.contextPath}/img/placeimges/test3.png" alt="" style="height: 400px; width: 640px;">

									 <img src="${pageContext.request.contextPath}/img/placeimges/test1.png" alt="" >
				      				  <img src="${pageContext.request.contextPath}/img/placeimges/test2.png" alt="" >
				       				 <img src="${pageContext.request.contextPath}/img/placeimges/test3.png" alt="">
										     --%>
<%-- 
	                      <ul  class = "pgwSlideshow"> 
						  <li><img src="${pageContext.request.contextPath}/img/placeimges/test1.png" alt="" ></li > 
						  <li><img src="${pageContext.request.contextPath}/img/placeimges/test2.png" alt="" ></li > 
						  <li><img src="${pageContext.request.contextPath}/img/placeimges/test3.png" alt="" ></li > 
						</ul> --%>
						
<%-- 						<div id="slider">
							<c:forEach items="${ppList}" var="ppList">
								<div><img src="${pageContext.request.contextPath}/${ppList.ppPath}" alt="" ></div> 
							</c:forEach>
						</div> --%>
<%-- 	
 				  <div id="slider">
							<div><img src="${pageContext.request.contextPath}/img/placeimges/test1.png" alt="" ></div> 
						  <div><img src="${pageContext.request.contextPath}/img/placeimges/test2.png" alt="" ></div> 
						  <div><img src="${pageContext.request.contextPath}/img/placeimges/test3.png" alt="" ></div> 
 						 </div>
 	 --%>					 
<%-- 							<c:forEach items="${ppList}" var="ppList">
								<div><img src="${pageContext.request.contextPath}/${ppList.ppPath}" alt="" ></div> 
							</c:forEach> --%>
	
<%-- 	<div style="width: 60%; margin: 50px; ">
			<div id="carousel-example-generic" class="carousel slide" >
						<ol class="carousel-indicators">
									<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
									<li data-target="#carousel-example-generic" data-slide-to="1"></li>
									<li data-target="#carousel-example-generic" data-slide-to="2"></li>
									<li data-target="#carousel-example-generic" data-slide-to="3"></li>
								</ol>
							<div class="carousel-inner">
							<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
								<div class="item active">
									<img style="width:100%" src="${pageContext.request.contextPath}/img/footer-logo.png">
									<div class="carousel-caption" style="color:black;"></div>
								</div>
								<c:forEach items="${ppList}" var="ppList">
									<div class="item">
										<img style="width:100%" src="${pageContext.request.contextPath}/${ppList.ppPath">
										<div class="carousel-caption" style="color:black;"></div>
									</div>
								</c:forEach>
							</div>
						
									<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
										<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									</a>
									<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
										<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									</a>
			</div>
	</div> --%>

	<!-- ========================================================================================= -->
                        </div>
                        
                        <div class="listing__details__amenities">
                            <h4>Amenities</h4>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="${pageContext.request.contextPath}/img/listing/details/amenities/ame-1.png" alt="">
                                        <h6>Accept Credit Card</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="${pageContext.request.contextPath}/img/listing/details/amenities/ame-2.png" alt="">
                                        <h6>Free Wifi</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="${pageContext.request.contextPath}/img/listing/details/amenities/ame-3.png" alt="">
                                        <h6>Smoking Area</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="${pageContext.request.contextPath}/img/listing/details/amenities/ame-4.png" alt="">
                                        <h6>Free Parking</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="${pageContext.request.contextPath}/img/listing/details/amenities/ame-5.png" alt="">
                                        <h6>Family Friendly</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="${pageContext.request.contextPath}/img/listing/details/amenities/ame-6.png" alt="">
                                        <h6>Coffee</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="${pageContext.request.contextPath}/img/listing/details/amenities/ame-7.png" alt="">
                                        <h6>Massage</h6>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-6">
                                    <div class="listing__details__amenities__item">
                                        <img src="${pageContext.request.contextPath}/img/listing/details/amenities/ame-8.png" alt="">
                                        <h6>Coupons</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="listing__details__rating">
                            <h4>Rate</h4>
                            <div class="listing__details__rating__overall">
                                <h2>4.7</h2>
                                <div class="listing__details__rating__star">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                </div>
                                <span>(120 Rating)</span>
                            </div>
                            <div class="listing__details__rating__bar">
                                <div class="listing__details__rating__bar__item">
                                    <span>4.4</span>
                                    <div id="bar1" class="barfiller">
                                        <span class="fill" data-percentage="100"></span>
                                    </div>
                                    <span class="right">Quality</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>3.9</span>
                                    <div id="bar2" class="barfiller">
                                        <span class="fill" data-percentage="75"></span>
                                    </div>
                                    <span class="right">Price</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.2</span>
                                    <div id="bar3" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                    </div>
                                    <span class="right">Space</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.8</span>
                                    <div id="bar4" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                    </div>
                                    <span class="right">Service</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4.0</span>
                                    <div id="bar5" class="barfiller">
                                        <span class="fill" data-percentage="85"></span>
                                    </div>
                                    <span class="right">Location</span>
                                </div>
                            </div>
                        </div>
                        <div class="listing__details__comment">
                            <h4>Comment</h4>
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
                                    <div class="listing__details__comment__item__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <span>March 22, 2019</span>
                                    <h5>Marry Jane</h5>
                                    <p>From ships to airports, museums to burger vans, from revered Michelin star
                                        establish to the fleeting dynamism of pop-ups.</p>
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
                                    <div class="listing__details__comment__item__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <span>March 22, 2019</span>
                                    <h5>Marry Jane</h5>
                                    <p>From ships to airports, museums to burger vans, from revered Michelin star
                                        establish to the fleeting dynamism of pop-ups.</p>
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
                                    <div class="listing__details__comment__item__rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <span>March 22, 2019</span>
                                    <h5>Marry Jane</h5>
                                    <p>From ships to airports, museums to burger vans, from revered Michelin star
                                        establish to the fleeting dynamism of pop-ups.</p>
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="listing__details__review">
                            <h4>Add Review</h4>
                            <form action="#">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <textarea placeholder="Review"></textarea>
                                <button type="submit" class="site-btn">Submit Now</button>
                            </form>
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
                                <img src="${pageContext.request.contextPath}/img/listing/details/map-icon.png" alt="">
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

</body>

</html>