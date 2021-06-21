<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dedf9592b51a78be2b5d3ec39a2a2199"></script>
<style type="text/css">
.mySlides {display:none;}

@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');


h2{font-family: 'Nanum Myeongjo', serif; font-weight: bold;}

</style>

<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.memNo" var="memNo"/>
</sec:authorize>


<script type="text/javascript">
    	$(function(){
        	 $(document).on("click","#photoReview",function(){
      			$.ajax({
      				  url: "${pageContext.request.contextPath}/place/reviewAjax/${placeNo}", //서버주소
      				  type: "get", //요청방식(get,post, put,delete)
      				  dataType: "json", //서버가 보내오는 데이터타입(응답 - text ,html, xml, json)
      				 // data:{placeNo:1} , //서버에게 보낼 parameter정보
      				  success: function(result){ //item 데이터 ==> ["name":값, subject:값, ... ,customer:{id:값, name:값....}]
      				  		//alert(result);      				  	       				  		
								var str="";
  				  		if(result==""){
  				  			str+="<p>등록된 포토리뷰가 없습니다.</p>";
  				  		}else{
      				  		for(var i =0; i<result.length; i++){
      				  		//alert(result[i].pprpList[i].pprpPath);
      				  		str+="<div class='listing__details__comment__item__pic'>";
      				  		str+="<img src='${pageContext.request.contextPath}/img/listing/details/comment.png'>";
      				  		str+="</div>";
      				  		str+="<div class='listing__details__comment__item__text'>";
      				  		str+="<span>" + result[i].regDate+"</span>";
      				  		str+="<h5>"+ result[i].name+"</h5>";
      				  		str+="<p>"+result[i].content+"</p>";
      				  		
							if(Number(result[i].star)/2==0){
							str+="<p> 별점 : <span class='icon_star_alt'></span></p>";
      				  		}else if(Number(result[i].star)/2<=1){
      				  		str+="<p> 별점 : <span class='icon_star-half_alt'></span></p>";
      				  		}else if(Number(result[i].star)/2<=2){
      				  		str+="<p> 별점 : <span class='icon_star'></span><span class='icon_star'></span></p>";
      				  		}else if(Number(result[i].star)/2<=3){
      				  		str+="<p> 별점 : <span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span></p>";
      				  		}else if(Number(result[i].star)/2<=4){
      				  		str+="<p> 별점 : <span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span></p>";
      				  		}else{
      				  		str+="<p> 별점 : <span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span></p>";
      				  		}
      				  			for(var j=0; j<result[i].pathList.length; j++){
      				  				str+="<img src='${pageContext.request.contextPath}/resources/"+result[i].pathList[j].pprpPath+"' style='width: 200px; height: 200px;'>";
      				  			};
      				  		str+="<ul>";
      				  		str+=" <li><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i></li>";
      				  		str+="<li><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i></li>";
      				  		str+="</ul>";
      				  		str+="</div>";
      				  		str+="</div>";
      				    	};
  				  		};
  				    	$(".listing__details__comment").html(str);
      				}, 
      				  error : function(err){
      					  console.log(err+" 에러 발생.")
      				  }
      			  });
      		});
        	 
        	 $(document).on("click","#replyReview",function(){
       			$.ajax({
       				  url: "${pageContext.request.contextPath}/place/replyAjax/${placeNo}", //서버주소
       				  type: "get", //요청방식(get,post, put,delete)
       				  dataType: "json", //서버가 보내오는 데이터타입(응답 - text ,html, xml, json)
       				 // data:{placeNo:1} , //서버에게 보낼 parameter정보
       				  success: function(result){ //item 데이터 ==> ["name":값, subject:값, ... ,customer:{id:값, name:값....}]
            				  		var str="";
           				  	if(result==""){
      				  			str+="<p>등록된 댓글이 없습니다.</p>";
      				  		}else{
           				  		for(var i =0; i<result.length; i++){
           				  		str+="<div class='listing__details__comment__item__pic'>";
           				  		str+="<img src='${pageContext.request.contextPath}/img/listing/details/comment.png'>";
           				  		str+="</div>";
           				  		str+="<div class='listing__details__comment__item__text'>";
           				  		str+="<span>" + result[i].regDate+"</span>";
           				  		str+="<h5>"+ result[i].name+"</h5>";
           				  		str+="<p>"+result[i].content+"</p>";
          				  		str+="<ul>";
          				  		str+=" <li><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i></li>";
          				  		str+="<li><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i></li>";
          				  		str+="</ul>";
          				  		str+="</div>";
          				  		str+="</div>";
           				    	};
      				  		};
           				    	$(".listing__details__comment").html(str);
       				}, 
       				  error : function(err){
       					  console.log(err+" 에러 발생.")
       				  }
       			  });
       		});
        	 
        	 if(${starAvg}/2==0){
        	 $(".listing__details__rating__star").html("<span class='icon_star_alt'></span>");
        	 }else if(${starAvg}/2<=1){
        		$(".listing__details__rating__star").html("<span class='icon_star'></span>");
        	}else if(${starAvg}/2<=2){
        		$(".listing__details__rating__star").html("<span class='icon_star'></span><span class='icon_star'></span>");
        	}else if(${starAvg}/2<=3){
        		$(".listing__details__rating__star").html("<span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span>");
        	}else if(${starAvg}/2<=4){
        		$(".listing__details__rating__star").html("<span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span>");
        	}else{
        		$(".listing__details__rating__star").html("<span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span>");
        	}	
        	 
/*         	$('#deleteReplyReview').click(function(){
      		 	var placeNo = ${placeNo};
      		 	var userId = "testuserid";
      		 	var url = "${pageContext.request.contextPath}/place/myReplyReview?placeNo="+placeNo+"&memId="+userId;
      		 	$(location).attr('href', url);
      	 	});  
*/				
			
	 		$(document).on("click", ".primary-btn", function(){
				$.ajax({
					url:"${pageContext.request.contextPath}/place/likelikePlace",
					type:"get",
					dateType:"json",
					data:{"placeNo":$(this).attr("id"), "memNo":${memNo}},
					success:function(result){
						if(result== -1){
							alert("구독에 오류가 발생했습니다.");
						}else if(result==1){
							$("#fullHeart").attr("class", "fa fa-heart");
						}else if(result==0){
							$("#fullHeart").attr("class", "fa fa-heart-o");
						}
					},
					error:function(err){
						console.log(err+"가 발생함");
					}
				});
			});

      	}); 
    	
      	function checkValid(){
      		var f = window.document.replyForm;
      		if(f.prContent.value=""){
      			alert("내용을 입력해 주세요");
      			f.prContent.focus();
      			return false;
      		}
      		return true;
      	}
      	
      	//alert(${placeNo});
      	
      	function deleteValid(){
    		confirm("삭제하시겠습니까?");
      	}
    		
      	
  </script>

</head>

<body>
    <section class="listing-hero set-bg" data-setbg="https://www.journey4.co.uk/wp-content/uploads/2020/04/about-us-2-1920x420.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${pageContext.request.contextPath}/resources/placeicon/${place.placeIconPath}" style="width: 150px; height: 150px;" ><!-- 아이콘 모양? user프로필? -->
                        </div>
                        <div class="listing__hero__text">
                            <h2>${requestScope.place.placeTitle}</h2>
                            <div class="listing__hero__widget">
                                <div class="listing__details__rating__star"></div>
                                <div>&nbsp;&nbsp; 포토후기평점 : ${starAvg}</div>
                                <br> <div>${totalReviewCount} &nbsp;&nbsp;&nbsp;Total Reviews</div>
                            </div>
                            <p><span class="icon_pin_alt"></span> ${requestScope.place.placeAddr}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__hero__btns">
                    	<c:set var="heart" value="0"/>
                    	<c:forEach items="${placeStorage}" var="storage">
                    		<c:if test="${storage.place.placeNo eq place.placeNo}">
                    			<c:set var="heart" value="1"/>
                    		</c:if>
                    	</c:forEach>
						<c:choose>
							<c:when test="${heart eq 1}">
								<a href="#" class="primary-btn" id="${place.placeNo}">
								<i class="fa fa-heart" is="likeButton" id="fullHeart"></i>Like</a>
							</c:when>
							<c:otherwise>
								<a href="#" class="primary-btn" id="${place.placeNo}">
								<i class="fa fa-heart-o" is="likeButton" id="fullHeart"></i>Like</a>
							</c:otherwise>
						</c:choose>
						    <c:set var="heart" value="0"/>               	
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
                            
<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.memNo" var="loginMemNo"/>
					<c:if test="${place.member.memNo== loginMemNo}">
					<span>
						<form action="${pageContext.request.contextPath}/place/placeUpdateForm" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="memNo" value="${place.member.memNo}">
							<input type="hidden" name ="placeNo" value="${placeNo}">
							 <button type="submit" class="btn btn-outline-danger" id="prUpdated" style="width: 150px">Place Modify</button>
						</form>
						<br><br>
						<form action="${pageContext.request.contextPath}/place/placeDelete" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="memNo" value="${place.member.memNo}">
							<input type="hidden" name ="placeNo" value="${placeNo}">
							 <button type="submit" class="btn btn-outline-dark" id="prDelete" style="width: 150px/* ; float: right */;" onclick="deleteValid();">Place Delete</button>
						</form>
						</span>
					</c:if>
	</sec:authorize>                            

                            <br><br><h4>Overview</h4>
                            <p> ${requestScope.place.placeContent}</p>
                        </div>
                        <div class="listing__details__gallery">
                            <h4>Gallery(${ppListSize})</h4>
                            <!-- ============================================================ -->
						<div class="w3-content w3-display-container">
								<c:forEach items="${ppList}" var="ppList">
								  	 <img class="mySlides" src="${pageContext.request.contextPath}/resources/${ppList.ppPath}" style="height: 400px; width: 100%;">
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
	                                        <img src="${pageContext.request.contextPath}/resources/hashtag.png" style="width: 30px; height: 30px;">
	                                        <h6 style="font-weight: bolder; font-size: 20px;">${tagStr}</h6>
	                                    </div>
	                                </div>
                         		 </c:forEach>
                            </div>
                        </div>
                        
                        <div class="listing__details__rating">
                            <h4>Rate</h4>
                            <div class="listing__details__rating__overall">
                                <h2>${starAvg}</h2>
                                 <div class="listing__details__rating__star">
                                </div>
                                <span>${pprList.size()}&nbsp;Photo Reviews</span>
                            </div>
                            
                            <div class="listing__details__rating__bar">
                                <div class="listing__details__rating__bar__item">
                                    <span></span>
                                    <div id="bar3" class="barfiller">
                                        <span class="fill"  data-percentage="${starAvgPer}"></span>
                                        <p><h4><span class="arrow_right_alt"></span>PhotoReview 사진 모아보기<span class="arrow_left_alt"></span></h4>
                                    </div>
                                    <span class="right"></span>
                                </div> 
                                	<table>
                                <c:forEach items="${pprList}" var="pp">
                                	<tr>
                                	<c:forEach items="${pp.pprpList}" var="ppp">
												 <img src="${pageContext.request.contextPath}/resources/${ppp.pprpPath}" style="width: 50px; height: 50px;">
									</c:forEach>
									</tr>
									</c:forEach>
									</table>
          
                            </div>
                        </div>
                      
      					<section class="listing-details spad">        
                        <h4><a href="javascript:;" class="btn" id="replyReview" style="text-decoration: none; color: black;">Reply</a> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	<a href="javascript:;" class="btn" id="photoReview" style="text-decoration: none; color: black;">PhotoReview</a>
                        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memId" var="memId"/>
                        	 <a href="${pageContext.request.contextPath}/place/myReplyReview/placeNo=${placeNo}&memId=${memId}" 
                        	 class="btn" id="deleteReplyReview" style="text-decoration: none; color: black; ">My Reply, PhotoReview Edit</a>
   </sec:authorize>                     	 
                        </h4>
                        <div class="listing__details__comment">
   				 <c:forEach items="${prList}" var="prList">       
                            <div class="listing__details__comment__item">
                                <div class="listing__details__comment__item__pic">
                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
                                </div>
                                <div class="listing__details__comment__item__text">
                                    <span>${prList.prRegdate}</span>
                                    <h5>${prList.member.memName}</h5>
                                    <p>${prList.prContent}</p>
                                    
                                    <ul>
                                        <li><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i></li>
                                        <li><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i><i class='fa fa-ellipsis-h'></i></li>
                                    </ul>
                                </div>
                            </div>
        			 </c:forEach>                 
                        </div>
           		 </section>  
           		<!--  <div class="row">
					<div class="col-xs-8 col-sm-6"> -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memName" var="userName"/>
	<sec:authentication property="principal.memNo" var="userNo"/>
           		<div class="listing__details__review">
               <h4>Add Review
               			<form name=prForm method="post" action="${pageContext.request.contextPath}/place/photoReviewForm" style="text-align: right;">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <input type="hidden" name="placeNo" value="${placeNo}"/>
                            <input type="hidden" name="memNo" value="${userNo}"/>
               				 <button type="submit" class="btn btn-outline-dark" id="prSubmit" style=" font-weight: bolder;">Photo Review 작성하기</button>
                        </form>
                </h4>
                         <form name="replyForm" method="post" action="${pageContext.request.contextPath}/place/replyWrite">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <input type="hidden" name="placeNo" value="${placeNo}"/>
                            <input type="hidden" name="memNo" value="${userNo}"/>
                            <input type="hidden" name="prStatus" value="1"/>

  							<input type="text" placeholder="${userName}" readonly="readonly">
  						
                                <textarea name="prContent" placeholder="Review"></textarea>
                                <button type="submit" class="site-btn" id="replySubmit">Submit Now</button>
                            </form>
                        </div>
</sec:authorize>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__sidebar">
                        <div class="listing__sidebar__contact">
                            <div class="listing__sidebar__contact__map">
                                <div id="staticMap" style="width:100%;height:350px;"></div>  
                                <div>
                                	<table style="text-align:center; width:100%;">
                                		<tr>
                                			<td style="height:50px; background-color:#ffffff; ">
                                				<h4 style="color:#199e9a; font-family:Arial Black, Gadget, sans-serif ;">입력하신 장소의 주소 입니다.</h4>
                                			</td>
                                		</tr>
                                		<tr>
                                			<td style="background-color:#199e9a; border-color:inherit; text-align:left; vertical-align:top">
                                				<h5 style="font-weight:bold; color:#FFF">${place.placeAddr }</h5>
                                			</td>
                                		</tr>
                                	</table>
                                </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dedf9592b51a78be2b5d3ec39a2a2199"></script>                              
    <script type="text/javascript">
			var mapContainer = document.getElementById('staticMap'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(${place.placeLatitude},${place.placeLongitude}), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(${place.placeLatitude},${place.placeLongitude}), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new kakao.maps.InfoWindow({
		    content : '<div>${place.placeTitle}</div>', // 인포윈도우에 표시할 내용
		    removable : true
		});
		
		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
     </script>                
                               
                            </div>
                        </div>
                      </div>
                  </div>
                   		
            </div>
        </div>
    </section>
	
 	 <sec:authorize access="isAnonymous()">
	 	<c:if test="${empty memId}">
		    <section class="newslatter">
		        <div class="container">
		            <div class="row">
		                <div class="col-lg-6 col-md-6">
		                    <div class="newslatter__text">
		                        <h3>댓글과 포토 후기를 남기시려면 로그인을 해주세요!</h3>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>
		  </c:if>
	</sec:authorize>
	
</body>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</html>