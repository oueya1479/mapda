<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style type="text/css">
.mySlides {display:none;}
</style>
<script type="text/javascript">
    	$(function(){
        	 $(document).on("click","#photoReview",function(){
      			$.ajax({
      				  url: "${pageContext.request.contextPath}/place/reviewAjax/${placeNo}", //서버주소
      				  type: "post", //요청방식(get,post, put,delete)
      				  dataType: "json", //서버가 보내오는 데이터타입(응답 - text ,html, xml, json)
      				 // data:{placeNo:1} , //서버에게 보낼 parameter정보
      				  success: function(result){ //item 데이터 ==> ["name":값, subject:값, ... ,customer:{id:값, name:값....}]
      				  		console.log(result);
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
	      				  		str+="<span>" + result[i].pprRegdate+"</span>";
	      				  		str+="<h5>"+ result[i].member.memName+"</h5>";
	      				  		str+="<p>"+result[i].pprContent+"</p>";
	      				  		

	      				  		if(Number(result[i].pprStar)/2<=1){
	      				  		str+="<p> 별점 : <span class='icon_star'></span></p>";
	      				  		}else if(Number(result[i].pprStar)/2<=2){
	      				  		str+="<p> 별점 : <span class='icon_star'></span><span class='icon_star'></span></p>";
	      				  		}else if(Number(result[i].pprStar)/2<=3){
	      				  		str+="<p> 별점 : <span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span></p>";
	      				  		}else if(Number(result[i].pprStar)/2<=4){
	      				  		str+="<p> 별점 : <span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span></p>";
	      				  		}else{
	      				  		str+="<p> 별점 : <span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span><span class='icon_star'></span></p>";
	      				  		}
	      				  		
	      				  			for(var j=0; j<result[i].pprpList.length; j++){
	      				  				str+="<img src='${pageContext.request.contextPath}/"+result[i].pprpList[j].pprpPath+"' style='width: 200px; height: 200px;'>";
	      				  			};
	      				  		str+="<ul>";
	      				  		str+=" <li><i class='fa fa-hand-o-right'></i> Like</li>";
	      				  		str+="<li><i class='fa fa-share-square-o'></i> Reply</li>";
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
       				  type: "post", //요청방식(get,post, put,delete)
       				  dataType: "json", //서버가 보내오는 데이터타입(응답 - text ,html, xml, json)
       				 // data:{placeNo:1} , //서버에게 보낼 parameter정보
       				  success: function(result){ //item 데이터 ==> ["name":값, subject:값, ... ,customer:{id:값, name:값....}]
 //   				       		alert(result);
  //     				  			console.log(result);
 							
       				  		var str="";
       				  	if(result==""){
  				  			str+="<p>등록된 댓글이 없습니다.</p>";
  				  		}else{
       				  		for(var i =0; i<result.length; i++){
       				  		str+="<div class='listing__details__comment__item__pic'>";
       				  		str+="<img src='${pageContext.request.contextPath}/img/listing/details/comment.png'>";
       				  		str+="</div>";
       				  		str+="<div class='listing__details__comment__item__text'>";
       				  		str+="<span>" + result[i].prRegdate+"</span>";
       				  		str+="<h5>"+ result[i].member.memName+"</h5>";
       				  		str+="<p>"+result[i].prContent+"</p>";
      				  		str+="<ul>";
      				  		str+=" <li><i class='fa fa-hand-o-right'></i> Like</li>";
      				  		str+="<li><i class='fa fa-share-square-o'></i> Reply</li>";
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
        	 
        	if(${starAvg}/2<=1){
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
        	 
        	 
      	});  
  </script>

</head>


<body>

    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="${pageContext.request.contextPath}/img/placeimges/test1.png"><!-- 무슨 사진 넣을지 고민 -->
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${pageContext.request.contextPath}" alt="" ><!-- 아이콘 모양? user프로필? -->
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
                                <h2>${starAvg}</h2>
                                 <div class="listing__details__rating__star">
                                   <!--  <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span> -->
                                </div>
                                <span>${pprList.size()}&nbsp;reviews</span>
                            </div>
                            
                            <div class="listing__details__rating__bar">
   
                                <div class="listing__details__rating__bar__item">
                                    <span></span>
                                    <div id="bar3" class="barfiller">
                                        <span class="fill"  data-percentage="${starAvgPer}"></span>
                                    </div>
                                    <span class="right">Space</span>
                                </div>

                              
                            </div>
                        </div>
                      
      					<section class="listing-details spad">                  
                        <h4><a href="javascript:;" class="btn" id="replyReview" style="text-decoration: none; color: black;">Reply</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	<a href="javascript:;" class="btn" id="photoReview" style="text-decoration: none; color: black;">PhotoReview</a></h4>
                        <div class="listing__details__comment">
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
           			 </section>        
                        
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
                            
                            <!-- sidebar -->
                            <div class="listing__sidebar__contact__text">
  
                            </div>
                            <!-- sidebar -->
                            
                        </div>
                        
                        <!-- sidebar -->
                        <div class="listing__sidebar__working__hours">
 
                        </div>
                        <!-- sidebar -->
                        
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