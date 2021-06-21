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

@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');


h2{font-family: 'Nanum Myeongjo', serif; font-weight: bold;}

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
				
		/* 파일 업로드 미리보기 */
		$("#file").on("change", handleImgFileSelect);
	});
 	
 	function selectForm(frm){
		theForm = document.getElementById("allForms").getElementsByTagName("div");
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
 	
	function deleteImageAction(index){
		sel_files.splice(index, 1);
		
		var img_id = "#img_id_" + index;
		$(img_id).remove();
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
 	
	function checkValid(){
 		var f = window.document.f;
 		
 		if(f.placeContent.value==""){
 			alert("장소에 대한 간략한 소개를 적어 주세요!!");
 			return false;
 		}
 		
 		if(f.placeStar.value==""){
 			alert("Place 에 대한 점수를 부여해 주세요 !!");
 			return false;
 		}
 	
 	}
 	 	
  </script>

</head>

<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memNo" var="memNo"/>
	<sec:authentication property="principal.memImage" var="memImage"/>
	
	<form name="f" action="${pageContext.request.contextPath}/place/placeUpdate" method="post" enctype="multipart/form-data" onsubmit="return checkValid()">
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">						
			 <input type="hidden" name="memNo" value="${memNo}">
			 
    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="${pageContext.request.contextPath}/img/listing/details/listing-hero.jpg"><!-- 무슨 사진 넣을지 고민 -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${pageContext.request.contextPath}/resources/5115237.png" alt="" style="width:120px; height:120px;"><!-- 아이콘 모양? user프로필? -->
                        </div>
                        <div class="listing__hero__text">
                            <h2>Place Modify</h2>
                            <h4><input type="text" id="placeTitle" name="placeTitle" readonly="readonly" value="${place.placeTitle}"></h4>
                            <div class="listing__hero__widget">
                            </div><br>
                            <p><span class="icon_pin_alt"></span><input type="text" id="placeAddr" name="placeAddr" 
                            readonly="readonly" style="width: 500px;" value="${place.placeAddr}"></p>
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
	                           					<h4>장소 변경은 불가능 합니다.
	                           					<input type="hidden" name="placeNo" value="${place.placeNo}">
	                           					
	                           					</h4>
	                           					<input type="hidden" id="placeLatitude" name="placeLatitude" value="${place.placeLatitude}">
												<input type="hidden" id="placeLongitude" name="placeLongitude" value="${place.placeLongitude}">
												<input type ="hidden" name="placeStatus" value = "1">
													
											<div class="blog__item__text">
										<img src="${pageContext.request.contextPath}/resources/dadadadada.png" style="float:left; width: 100px; height: 100px; margin-right: 10px;" >
										  <span style="margin-top:20px;font-size:18px;" >
										  보다 공정하고 정확한 장소의 내용을 공유하기 위하여 처음 지정한 place 에서 많은 내용을 변경 할 수 없는 점 양해 부탁 드립니다.
                                         많은 플레이스 지정을 부탁 드리며, 저희 <span style="font-weight: bolder; font-size: 20px; color: blue;">맵多</span>를 이용해 주셔서 감사합니다.</span>
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
                            <h4>설명을 변경하시겠습니까?</h4>
								<textarea id="placeContent" name="placeContent" style="width: 500px; height: 163px" value="${place.placeContent}"></textarea>
                        </div>
	                    <div class="listing__details__gallery">
	                            <h4>장소의 사진을 변경해 주세요 !</h4>
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
                            <h4>달라진 점수는요?</h4>
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
                            <h4>플레이스 아이콘</h4>
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
											<img src="${pageContext.request.contextPath}/resources/placeicon/food1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/travel1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/cafe1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/healing1.PNG" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/nature1.PNG" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/activity1.PNG" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/shopping1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/culture1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/walking1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/night1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/attraction1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/pet1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/date1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
										<div style="display: none;">
											<img src="${pageContext.request.contextPath}/resources/placeicon/drive1.png" style="width: 120px; height: 120px; background-color: black;">
										</div>
									</div>
								</div>
							</div>
                    </div>
                </div>
            </div>
	      </div>      
                        <div class="listing__details__amenities">
                            <h4>HashTag를 수정해 주세요!</h4>
                            <div class="row">
                          	  <div class="col-lg-3 col-md-3 col-6">
			                                    <div class="listing__details__amenities__item">
			                                        <p id="tagImg1"><img src="${pageContext.request.contextPath}/resources/hashtag.png" style="width: 30px; height: 30px;"></p>
														<h5><input type="text" id="hashTag1" name="hashTag1" value="${tagStr[0]}"></h5>
			                                    </div>
			                                </div>
			                                 <div class="col-lg-3 col-md-3 col-6">
			                                    <div class="listing__details__amenities__item">
			                                        <p id="tagImg1"><img src="${pageContext.request.contextPath}/resources/hashtag.png" style="width: 30px; height: 30px;"></p>
														<h5><input type="text" id="hashTag2" name="hashTag2" value="${tagStr[1]}"></h5>
			                                    </div>
			                                </div>
			                                 <div class="col-lg-3 col-md-3 col-6">
			                                    <div class="listing__details__amenities__item">
			                                        <p id="tagImg1"><img src="${pageContext.request.contextPath}/resources/hashtag.png" style="width: 30px; height: 30px;"></p>
														<h5><input type="text" id="hashTag3" name="hashTag3" value="${tagStr[2]}"></h5>
			                                    </div>
			                                </div>
			                                 <div class="col-lg-3 col-md-3 col-6">
			                                    <div class="listing__details__amenities__item">
			                                        <p id="tagImg1"><img src="${pageContext.request.contextPath}/resources/hashtag.png" style="width: 30px; height: 30px;"></p>
														<h5><input type="text" id="hashTag4" name="hashTag4" value="${tagStr[3]}"></h5>
			                                    </div>
			                                </div>
			                                 <div class="col-lg-3 col-md-3 col-6">
			                                    <div class="listing__details__amenities__item">
			                                        <p id="tagImg1"><img src="${pageContext.request.contextPath}/resources/hashtag.png" style="width: 30px; height: 30px;"></p>
														<h5><input type="text" id="hashTag5" name="hashTag5" value="${tagStr[4]}"></h5>
			                                    </div>
			                                </div>
			                                 <div class="col-lg-3 col-md-3 col-6">
			                                    <div class="listing__details__amenities__item">
			                                        <p id="tagImg1"><img src="${pageContext.request.contextPath}/resources/hashtag.png" style="width: 30px; height: 30px;"></p>
														<h5><input type="text" id="hashTag6" name="hashTag6" value="${tagStr[5]}"></h5>
			                                    </div>
			                                </div>
			                                 <div class="col-lg-3 col-md-3 col-6">
			                                    <div class="listing__details__amenities__item">
			                                        <p id="tagImg1"><img src="${pageContext.request.contextPath}/resources/hashtag.png" style="width: 30px; height: 30px;"></p>
														<h5><input type="text" id="hashTag7" name="hashTag7" value="${tagStr[6]}"></h5>
			                                    </div>
			                                </div>
			                                 <div class="col-lg-3 col-md-3 col-6">
			                                    <div class="listing__details__amenities__item">
			                                        <p id="tagImg1"><img src="${pageContext.request.contextPath}/resources/hashtag.png" style="width: 30px; height: 30px;"></p>
														<h5><input type="text" id="hashTag8" name="hashTag8" value="${tagStr[7]}"></h5>
			                                    </div>
			                                </div>
	                       </div>
                         </div>
                        </div>
                    	<div class="row">
	                    	<div class="col-lg-12">
		                    	<div class="listing__details__amenities">
			                    	<div style="text-align: center;">
			                    		<button type="submit" class="site-btn" id="replySubmit">장소 수정하기!</button>
			                    	</div>
		                    	</div>
	                    	</div>
                    	</div>
	    </section>
</form>
</sec:authorize>
</body>
</html>