<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script type="text/javascript">

  </script>

<style type="text/css">
.mySlides {display:none;}
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
						<div class="w3-content w3-display-container">
								<c:forEach items="${ppList}" var="ppList">
								  	<img class="mySlides" src="${pageContext.request.contextPath}/${ppList.ppPath}" style="height: 400px; width: 100%;">
								  </c:forEach>
							 <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
							  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
						</div>

											<script>
											var slideIndex = 1;
											showDivs(slideIndex);
											
											function plusDivs(n) {
											  showDivs(slideIndex += n);
											}
											
											function showDivs(n) {
											  var i;
											  var x = document.getElementsByClassName("mySlides");
											  if (n > x.length) {slideIndex = 1}
											  if (n < 1) {slideIndex = x.length}
											  for (i = 0; i < x.length; i++) {
											    x[i].style.display = "none";  
											  }
											  x[slideIndex-1].style.display = "block";  
											}
											</script>
	<!-- ========================================================================================= -->
                        </div>
                
                        <div class="listing__details__amenities">
                            <h4>HashTag</h4>
                            
                            <div class="row">
                            	<c:forEach items="${tagStr}" var="tagStr">
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
	                                        <h6 style="font-weight: bolder; font-size: 20px;">${tagStr}</h6>
	                                    </div>
	                                </div>
                         		 </c:forEach>
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
                        
                        <div class="listing__details__comment" style="float: left; margin-right: 150px;">
                            <h4>Reply</h4>
   				 <c:forEach items="${prList}" var="prList">       
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
                                    <span>${prList.prRegdate}</span>
                                    <h5>Marry Jane</h5>
                                    <p>${prList.prContent}</p>
                                    
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                </div>
                            </div>
        			 </c:forEach>                 
                        </div>
                        <!--  -->
                        
  					<div class="listing__details__comment" style="float: right;">
                            <h4>PhotoReview</h4>
   				 <c:forEach items="${pprList}" var="pprList">       
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
	                                    <span>${pprList.pprRegdate}</span>
	                                    <h5>Marry Jane</h5>
	                                    <p>${pprList.pprContent}</p>
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                    <!--  <div class="listing__details__comment__item__rating">
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                    </div> -->
                                </div>
                            </div>
        			 </c:forEach>                 
                        </div>
                        

                        
                        <!--  -->
<!--                         <div class="listing__details__review">
                            <h4>Add Review</h4>
                            <form action="#">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <textarea placeholder="Review"></textarea>
                                <button type="submit" class="site-btn">Submit Now</button>
                            </form>
                        </div> -->
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

=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script type="text/javascript">

  </script>

<style type="text/css">
.mySlides {display:none;}
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
						<div class="w3-content w3-display-container">
								<c:forEach items="${ppList}" var="ppList">
								  	<img class="mySlides" src="${pageContext.request.contextPath}/${ppList.ppPath}" style="height: 400px; width: 100%;">
								  </c:forEach>
							 <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
							  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
						</div>

											<script>
											var slideIndex = 1;
											showDivs(slideIndex);
											
											function plusDivs(n) {
											  showDivs(slideIndex += n);
											}
											
											function showDivs(n) {
											  var i;
											  var x = document.getElementsByClassName("mySlides");
											  if (n > x.length) {slideIndex = 1}
											  if (n < 1) {slideIndex = x.length}
											  for (i = 0; i < x.length; i++) {
											    x[i].style.display = "none";  
											  }
											  x[slideIndex-1].style.display = "block";  
											}
											</script>
	<!-- ========================================================================================= -->
                        </div>
                
                        <div class="listing__details__amenities">
                            <h4>HashTag</h4>
                            
                            <div class="row">
                            	<c:forEach items="${tagStr}" var="tagStr">
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
	                                        <h6 style="font-weight: bolder; font-size: 20px;">${tagStr}</h6>
	                                    </div>
	                                </div>
                         		 </c:forEach>
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
                        
                        <div class="listing__details__comment" style="float: left; margin-right: 150px;">
                            <h4>Reply</h4>
   				 <c:forEach items="${prList}" var="prList">       
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
                                    <span>${prList.prRegdate}</span>
                                    <h5>Marry Jane</h5>
                                    <p>${prList.prContent}</p>
                                    
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                </div>
                            </div>
        			 </c:forEach>                 
                        </div>
                        <!--  -->
                        
  					<div class="listing__details__comment" style="float: right;">
                            <h4>PhotoReview</h4>
   				 <c:forEach items="${pprList}" var="pprList">       
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
	                                    <span>${pprList.pprRegdate}</span>
	                                    <h5>Marry Jane</h5>
	                                    <p>${pprList.pprContent}</p>
                                    <ul>
                                        <li><i class="fa fa-hand-o-right"></i> Like</li>
                                        <li><i class="fa fa-share-square-o"></i> Reply</li>
                                    </ul>
                                    <!--  <div class="listing__details__comment__item__rating">
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                        <i class="fa fa-star"></i>
	                                    </div> -->
                                </div>
                            </div>
        			 </c:forEach>                 
                        </div>
                        

                        
                        <!--  -->
<!--                         <div class="listing__details__review">
                            <h4>Add Review</h4>
                            <form action="#">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <textarea placeholder="Review"></textarea>
                                <button type="submit" class="site-btn">Submit Now</button>
                            </form>
                        </div> -->
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