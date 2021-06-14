<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<style type="text/css">
</style>
<script type="text/javascript">
	function openWindowPop(url, name){
	    var options = 'top=30, left=150, width=700, height=700, status=no, menubar=no, toolbar=no, resizable=no scrollbars=yes';
	    window.open(url, name, options);
	}

  </script>


</head>


<body>
    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="${pageContext.request.contextPath}/img/listing/details/listing-hero.jpg"><!-- 무슨 사진 넣을지 고민 -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${pageContext.request.contextPath}/img/listing/details/ld-icon.png" alt="" ><!-- 아이콘 모양? user프로필? -->
                        </div>
                        <div class="listing__hero__text">
                            <h2>지도에서... placeTitle</h2>
                            <textarea name="placeTitle" placeholder="placeTitle"></textarea>
                            <div class="listing__hero__widget">
                            </div><br>
                            <p><span class="icon_pin_alt"></span>\${requestScope.place.placeAddr}</p>
                            <textarea name="placeAddr" placeholder="placeAddr"></textarea>
                        </div>
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
                <div class="col-lg-6">
                    <div class="listing__details__text">
                        <div class="listing__details__about">
                            <h4>Overview</h4>
                             <textarea name="placeContent" placeholder="placeContent"></textarea>
                        </div>
	                    <div class="listing__details__gallery">
	                            <h4>Place Photo</h4>
							<div class="w3-content w3-display-container">
							  <textarea name="placePhoto" placeholder="placePhoto"></textarea>
							</div>
	                    </div>
                	</div>
               </div>
                <div class="col-lg-6">
                    <div class="listing__details__text">
                        <div class="listing__details__about">
                            <h4>Place Rate</h4>
                            <div class="w3-content w3-display-container">
						  <textarea name="placeRate" placeholder="placeRate"></textarea>
						</div>
                        </div>
                        <div class="listing__details__gallery">
                            <h4>Place Icon</h4>
						<div class="w3-content w3-display-container">
						  <textarea name="placeIcon" placeholder="placeIcon"></textarea>
						</div>
                    </div>
                </div>
            </div>
	      </div>
                
                        <div class="listing__details__amenities">
                            <h4>HashTag</h4>
                            <div class="row">
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
												<textarea name="hashTag1" placeholder="hashTag1"></textarea>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
												<textarea name="hashTag2" placeholder="hashTag2"></textarea>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
												<textarea name="hashTag3" placeholder="hashTag3"></textarea>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
												<textarea name="hashTag4" placeholder="hashTag4"></textarea>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
												<textarea name="hashTag5" placeholder="hashTag5"></textarea>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
												<textarea name="hashTag6" placeholder="hashTag6"></textarea>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
												<textarea name="hashTag7" placeholder="hashTag7"></textarea>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" alt="" style="width: 30px; height: 30px;">
												<textarea name="hashTag1" placeholder="hashTag8"></textarea>
	                                    </div>
	                                </div>
                            </div>
                        </div>
                        
                        <div class="listing__details__about">
                            <h4>Place Map</h4>
                            <p><a href="javascript:openWindowPop('${pageContext.request.contextPath}/kakaoMapApi/searchPlace', 'kakaoMap');" 
                            class="btn" style="text-decoration: none; color: black; " onclick="popup()">지도펼치기</a></p>
                             <textarea name="placeMap" placeholder="title, 위도, 경도, 주소"></textarea>
                        </div>
                    </div>
	    </section>

</body>
</html>