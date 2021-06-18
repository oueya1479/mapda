<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	var sel_files = [];

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
		
		
		//$("#allForms>div>span> img").on("click", function(){
				/* $("#allForms>div>span:nth-child(1) >img").on("click", function(){
					$("#allForms>div>span:nth-child(2) >img").css("opacity", "0.5");
					$("#allForms>div>span:nth-child(3) >img").css("opacity", "0.5");
				}); */
				
		//		$(this).css("border", "none");
				
				//#allForms > div:nth-child(2)
		//});		
		
		/* 파일 업로드 미리보기 */
		$("#file").on("change", handleImgFileSelect);
		
	});
 	
 	function selectForm(frm){
		theForm = document.getElementById("allForms").getElementsByTagName("div");
	//	alert(theForm);
		//console.log(theForm);
		//console.log(theForm[3].style.display);
		for(x=0; x<theForm.length; x++){
			theForm[x].style.display = "none";
		}
		if(theForm[frm-1]){
			theForm[frm-1].style.display="block";
		}
	}
 	
 	function fileUploadAction(){
 		console.log("fileUploadAction");
 		$("#file").trigger('click');
 	}
 	
 	function handleImgFileSelect(e){
 		sel_files = [];
 		$(".imgs_wrap").empty();
 		
 		var files = e.target.files;
 		var filesArr = Array.prototype.slice.call(files);
 		
 		var index = 0;
 		filesArr.forEach(function(f){
 			if(!f.type.match("image.*")){
 				alert("확장자는 이미지 확장자만 가능합니다.");
 				return;
 			}
 			
 			sel_files.push(f);
 			
 			var reader = new FileReader();
 			reader.onload = function(e){
 				var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction(" + index + ")\" id=\"img_id_"
 									+index+"\"><img src=\""+e.target.result + "\" data-file='"+f.name
 									+"' class='selProductFile' title='Click to remove' style='width:100px; height:100px;'></a>";
 				$(".imgs_wrap").append(html);
 				index++;
 			}
 			reader.readAsDataURL(f);
 		});
 		
 	}
 	
/*  	function checkValid(){
 		var f = window.document.f;
 		alert(1);
 		if(f.hashTag1.value==""){
 			alert(3);
 		}
 		
 	} */
 	 	
  </script>

</head>

<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memNo" var="memNo"/>
	<sec:authentication property="principal.memImage" var="memImage"/>
	
	<form name="f" action="${pageContext.request.contextPath}/place/placeInsert" method="post" enctype="multipart/form-data">
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">						
			 <input type="hidden" name="memNo" value="${memNo}">
			 <input type="hidden" name="mapNo" value="${mapNo}">
																																					<!--  onsubmit="return checkValid()" -->
			
    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="${pageContext.request.contextPath}/img/listing/details/listing-hero.jpg"><!-- 무슨 사진 넣을지 고민 -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${memImage}" alt="" style="width:120px; height:120px;"><!-- 아이콘 모양? user프로필? -->
                        </div>
                        <div class="listing__hero__text">
                            <h2><input type="text" id="placeTitle" name="placeTitle" readonly="readonly" placeholder="장소명 : 지도 등록시 자동으로 입력됩니다."></h2>
                            <div class="listing__hero__widget">
                            </div><br>
                            <p><span class="icon_pin_alt"></span><input type="text" id="placeAddr" name="placeAddr" 
                            readonly="readonly" style="width: 500px;" placeholder="지번 주소 : 지도 등록시 자동으로 입력됩니다."></p>
                            <p><span class="icon_pin_alt"></span><input type="text" id="resultAddress" name="resultAddress" 
                            readonly="readonly" style="width: 500px;" placeholder="도로명 주소 : 지도 등록시 자동으로 입력됩니다."></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Section End -->
    <!-- Listing Details Section Begin -->
    <section class="newslatter">
        <div class="container">
       				 <div class="row">
                           <div class="col-lg-12">
	                           <div class="listing__details__amenities">
                        			<div class="listing__details__about">
                           				<h4>아래 버튼을 눌러서 지도를 등록해주세요!</h4>
	                           				<div style="text-align: center;">
	                           					<input type="hidden" id="placeLatitude" name="placeLatitude">
												<input type="hidden" id="placeLongitude" name="placeLongitude">
					                            <p><a href="javascript:openChild('${pageContext.request.contextPath}/kakaoMapApi/searchPlace', 'kakaoMap');" 
					                            class="btn btn-primary" style="text-decoration: none;">지도펼치기</a></p>
											</div>
                        			</div>
                        		</div>
                   			 </div>
                   			  <div class="col-lg-6">
	                           <div class="listing__details__text">
                        			<div class="listing__details__about">
                        			</div>
                        		</div>
                   			 </div>
                    	</div>
        
            <div class="row">
                <div class="col-lg-6">
                    <div class="listing__details__amenities">
                        <div class="listing__details__about">
                            <h4>장소에 대한 설명을 적어주세요!</h4>
								<textarea id="placeContent" name="placeContent" style="width: 500px; height: 163px"></textarea>
                        </div>
	                    <div class="listing__details__gallery">
	                            <h4>장소의 사진을 넣어 주세요 !</h4>
							<div class="w3-content w3-display-container">
									<input multiple="multiple" type="file" name="files" id="file"/><p>
									<div class="imgs_wrap">
										<img id ="img"/>
									</div>
							</div>
	                    </div>
                	</div>
               </div>
                <div class="col-lg-6">
                   <div class="listing__details__amenities">
                        <div class="listing__details__about">
                            <h4>제 점수는요!</h4>
                            <div class="w3-content w3-display-container">
                            	<br><br>
									<h4><span class="star-box"></span>
									&nbsp;&nbsp;
									<input type="text" id="placeStar" name="placeStar" style="border: none; background-color: #f9f9f9;"></h4>
								<br><br><br>
							</div>
                        </div>
 <div class="col-md-12">                       
                        <div class="listing__details__gallery">
                            <h4>Place Icon</h4>
							<div class="listing__details__about">
								<div class="nice-select" style="padding: 0px; width: 0px; width: 0px;">
								  <select name="placeIconNo" id="placeIconNo" onchange="selectForm(this.options[this.selectedIndex].value)">
									<option value="0">선택</option>
									<option value="1">맛집</option>
									<option value="2">여행</option>
									<option value="3">카페</option>
									<option value="4">힐링</option>
									<option value="5">자연</option>
									<option value="6">액티비티</option>
									<option value="7">쇼핑</option>
									<option value="8">문화</option>
									<option value="9">산책</option>
									<option value="10">야경</option>
									<option value="11">명소</option>
									<option value="12">반려동물</option>
									<option value="13">데이트</option>
									<option value="14">드라이브</option>
								</select>
								</div>
							
						<div id="allForms" style="margin-left: 130px">
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/food1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/food2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/food3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/travel1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/travel2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/travel3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/cafe1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/cafe2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/cafe3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/healing1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/healing2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/healing3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/nature1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/nature2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/nature3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/activity1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/activity2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/activity3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/shopping1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/shopping2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/shopping3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/culture1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/culture2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/culture3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/walking1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/walking2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/walking3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/night1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/night2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/night3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/attraction1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/attraction2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/attraction3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/pet1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/pet2.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/pet3.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/date1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/date2.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/img/placeicon/drive1.png" style="width: 120px; height: 120px; background-color: black;">
											<img src="${pageContext.request.contextPath}/img/placeicon/drive2.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
									</div>
								</div>
							</div>
                    </div>
                </div>
            </div>
	      </div>
                        <div class="listing__details__amenities">
                            <h4>HashTag를 눌러서 내용을 적어주세요!</h4>
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
	                    	<div class="col-lg-12">
		                    	<div class="listing__details__amenities">
			                    	<div style="text-align: center;">
			                    		<button type="submit" class="site-btn" id="replySubmit">장소 등록하기!</button>
			                    	</div>
		                    	</div>
	                    	</div>
                    	</div>
                    </div>
	    </section>
</form>
</sec:authorize>
</body>
</html>