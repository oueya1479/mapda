<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star-rating-svg.css">
<style type="text/css">
#resultAddress, #placeAddr{
	background-color: transparent;
	border: none;
	color: white;
}
#placeTitle{
	width : 800px;
	background-color: transparent;
	border: none;
	color: white;
}

</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dedf9592b51a78be2b5d3ec39a2a2199&libraries=services"></script>
<script type="text/javascript">
	var openWin;

	function openChild(url, name){
		// window.name = "부모창 이름"; 
        window.name = "${pageContext.request.contextPath}/place/placeInsertForm";
        
	    var options = 'top=30, left=150, width=700, height=700, status=no, menubar=no, toolbar=no, resizable=no, scrollbars=yes';
	    openWin = window.open(url, name, options);
	}
	
	$(function(){
		$('.star-box').starRating({
		    initialRating: 0.5,
		    starSize: 25,
		    minRating: 0.5,
		    disableAfterRate:false,
			onLeave:function(currentIndex, currentRating, $el){
				$("#placeStar").val(currentRating*2);
				
			}
		  });
		
		$("#hashTag1").hide();
		$("#tagImg1").click(function(){
		    $("#hashTag1").toggle();
		  });
		$("#hashTag2").hide();
		$("#tagImg2").click(function(){
		    $("#hashTag2").toggle();
		  });
		$("#hashTag3").hide();
		$("#tagImg3").click(function(){
		    $("#hashTag3").toggle();
		  });
		$("#hashTag4").hide();
		$("#tagImg4").click(function(){
		    $("#hashTag4").toggle();
		  });
		$("#hashTag5").hide();
		$("#tagImg5").click(function(){
		    $("#hashTag5").toggle();
		  });
		$("#hashTag6").hide();
		$("#tagImg6").click(function(){
		    $("#hashTag6").toggle();
		  });
		$("#hashTag7").hide();
		$("#tagImg7").click(function(){
		    $("#hashTag7").toggle();
		  });
		$("#hashTag8").hide();
		$("#tagImg8").click(function(){
		    $("#hashTag8").toggle();
		  });
		
		
	});
	
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
                            <h2><input type="text" id="placeTitle" name="placeTitle" readonly="readonly" placeholder="장소명 : 지도 등록시 자동으로 입력됩니다."></h2>
                            <div class="listing__hero__widget">
                            </div><br>
                            <p><span class="icon_pin_alt"></span><input type="text" id="resultAddress" 
                            readonly="readonly" style="width: 500px;" placeholder="지번 주소 : 지도 등록시 자동으로 입력됩니다."></p>
                            <p><span class="icon_pin_alt"></span><input type="text" id="placeAddr" name="placeAddr" 
                            readonly="readonly" style="width: 500px;" placeholder="도로명 주소 : 지도 등록시 자동으로 입력됩니다."></p>
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
                            <h4>장소에 대한 설명을 적어주세요!</h4>
								<textarea id="placeContent" name="placeContent" style="width: 500px; height: 163px"></textarea>
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
                            <h4>제 점수는요!</h4>
                            <div class="w3-content w3-display-container">
                            	<br><br>
								<h4><span class="star-box"></span>&nbsp;&nbsp;<input type="text" id="placeStar" name="placeStar" style="border: none;"></h4>
								<br><br><br>
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
	                                        <p id="tagImg1"><img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" style="width: 30px; height: 30px;"></p>
												<h5><input type="text" id="hashTag1" name="hashTag1"></h5>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <p id="tagImg2"><img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" style="width: 30px; height: 30px;"></p>
											<h5><input type="text" id="hashTag2" name="hashTag2"></h5>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <p id="tagImg3"><img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" style="width: 30px; height: 30px;"></p>
												<h5><input type="text" id="hashTag3" name="hashTag3"></h5>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <p id="tagImg4"><img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" style="width: 30px; height: 30px;"></p>
												<h5><input type="text" id="hashTag4" name="hashTag4"></h5>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <p id="tagImg5"><img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" style="width: 30px; height: 30px;"></p>
												<h5><input type="text" id="hashTag5" name="hashTag5"></h5>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <p id="tagImg6"><img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" style="width: 30px; height: 30px;"></p>
												<h5><input type="text" id="hashTag6" name="hashTag6"></h5>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <p id="tagImg7"><img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" style="width: 30px; height: 30px;"></p>
												<h5><input type="text" id="hashTag7" name="hashTag7"></h5>
	                                    </div>
	                                </div>
	                                <div class="col-lg-3 col-md-3 col-6">
	                                    <div class="listing__details__amenities__item">
	                                        <p id="tagImg8"><img src="${pageContext.request.contextPath}/img/placeimges/hashtag.png" style="width: 30px; height: 30px;"></p>
												<h5><input type="text" id="hashTag8" name="hashTag8"></h5>
	                                    </div>
	                                </div>
                            </div>
                        </div>
                        
                        
                       	<div class="row">
                           <div class="col-lg-6">
	                           <div class="listing__details__text">
                        			<div class="listing__details__about">
                           				 <h4>Place Map</h4>
                            <p><a href="javascript:openChild('${pageContext.request.contextPath}/kakaoMapApi/searchPlace', 'kakaoMap');" 
                            class="btn" style="text-decoration: none; color: black; background-color: lime;">지도펼치기</a></p>
<!-- hidden 처리할것 -->                             <p><input type="text" id="placeLatitude" name="placeLatitude" style="width: 400px; height: 100px;"></p>
<!-- hidden 처리할것 -->                             <p><input type="text" id="placeLongitude" name="placeLongitude" style="width: 400px; height: 100px;"></p>
                        			</div>
                        		</div>
                   			 </div>
                   			  <div class="col-lg-6">
	                           <div class="listing__details__text">
                        			<div class="listing__details__about">
                           				 <h4>지도가져오기</h4>
                           				  <textarea name="mapmap" placeholder="mapmap"></textarea>
                        			</div>
                        		</div>
                   			 </div>
                    	</div>
                    </div>
	    </section>

</body>
</html>