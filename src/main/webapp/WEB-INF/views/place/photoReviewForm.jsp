<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/star-rating-svg.css">
</head>
<script type="text/javascript">
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
		
</script>
<body>

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                     <div class="blog__details__new__post">
                        <div class="blog__details__new__post__title">
                            <h4 style="margin-top: 100px; margin-bottom: 50px;"><span style="color: red;">주의</span>해 주세요!!</h4>
                         	<div class="col-md-10 col-md-offset-3" style="margin-left: 100px;">   
                             <div class="blog__item">
                                    <div class="blog__item__text">
										<img src="${pageContext.request.contextPath}/save/place/dadadadada.png" style="float:left; width: 100px; height: 100px; margin-right: 10px;" >
										  <span style="margin-top:20px;font-size:18px;" >
										  <span style="color: red;">포토리뷰는 (포인트/쿠폰)와 관련되어 있는 부분으로 관리자의 주요 관리 항목 입니다.</span><p>
                                       	포토리뷰에서 <span style="color: red;">사진첨부는 필수</span> 입니다. 또한 포토리뷰는 등록하신 이후 사진을 수정하기 위해서는
                                        별도로 관리자에게 연락을 취해야하며, 해당 게시물 삭제는 등록일자 <span style="color: red;">기준 30일</span>이 지난 후 가능합니다.
                                        <br>많은 포토리뷰 부탁 드리며, 저희 <span style="font-weight: bolder; font-size: 20px; color: blue;">맵多</span>를 이용해 주셔서 감사합니다.</span>
                                    </div>
                                </div>
                                </div>
                        </div>
                    </div>
<sec:authorize access="isAuthenticated()">
    	<sec:authentication property="principal.memName" var="userName"/>
    	<sec:authentication property="principal.memId" var="userId"/>
		<sec:authentication property="principal.memNo" var="userNo"/>
		
                    <div class="blog__details__comment__form">
                        <div class="blog__details__comment__title">
                            <h4 style="margin-top: 30px;">Place Photo Review</h4>
                        </div>
                       <form name="prForm" action="${pageContext.request.contextPath}/place/photoReviewInsert" method="post" enctype="multipart/form-data">
                           			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">						
									 <input type="hidden" name="memNo" value="${userNo}">
									 <input type="hidden" name="placeNo" value="${placeNo}">
                            <div class="input-list">
                                <div class="input-item">
                                    <p>User Name</p>
                                    <input type="text" id="userName" name="memName" readonly="readonly" placeholder="${userName}">
                                </div>
                                <div class="input-item">
                                    <p>User Id</p>
									<input type="text" id="userId" name="memId" readonly="readonly" placeholder="${userId}">
                                </div>
                                <div class="input-item">
                                    <p>Star</p>
                                   <h4><span class="star-box"></span>
									&nbsp;&nbsp;
									<input type="text" id="placeStar" name="pprStar" style="border: none; background-color: #f9f9f9;"></h4>
                                </div>
                            </div>
                            <div class="input-comment">
                                <p>Comment</p>
                                <textarea id="pprContent" name="pprContent"></textarea>
                            </div>
                         <div class="col-md-offset-10" style="margin-left: 500px">   
                                    <div class="w3-content w3-display-container">
									<input multiple="multiple" type="file" name="files" id="file"/><p>
									<div class="imgs_wrap">
										<img id ="img"/>
									</div>
								</div>
                                </div>   
                            <button type="submit" class="site-btn" id="photoReviewSubmit">Submit Now</button>
                        </form>
                    </div>
      </sec:authorize>                 
                </div>
            </div>
        </div>
    </section>
 
</body>

</html>