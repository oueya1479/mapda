<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<style type="text/css">
/* Button used to open the contact form - fixed at the bottom of the page */
.btn .btncancel{
  cursor: pointer;
}

/* The popup form - hidden by default */
.form-container {
  display: none;
  bottom: 0;
  right: 100px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  background-color: white;
}

/* Set a style for the submit/login button */
.btnedit {
  background-color: #04AA6D;
  color: white;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

</style>

<script type="text/javascript">
	$(function(){
	});

	function openForm() {
		  document.getElementById("myForm").style.display = "block";
		}	
		
</script>
</head>

<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memId" var="userId"/>

    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="${pageContext.request.contextPath}/img/listing/details/listing-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${pageContext.request.contextPath}/img/listing/details/ld-icon.png" alt="">
                        </div>
                        <div class="listing__hero__text">
                            <h2>${userId}님의  <br>Reply and Photo Review</h2>
                            <div class="listing__hero__widget">
                                <div>
                                	Reply : ${prList.size()}개<p>
                                	PhotoReview : ${pprList.size()}개
                                </div>
                            </div>
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
                <div class="col-lg-8">
                    <div class="listing__details__text">
                        <div class="listing__details__comment">
                            <h4>Reply</h4>
	                            	<c:forEach items="${prList}" var="prList">
			                            <div class="listing__details__comment__item">
			                                <div class="listing__details__comment__item__pic">
			                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
			                                </div>
			                                <div class="listing__details__comment__item__text">
			                                    <div class="listing__details__comment__item__rating">
			                                    </div>
			                                    <span>${prList.prRegdate}</span>
			                                    <p>${prList.member.memName}</p>
			                                    <h6>${prList.prContent}</h6>
			                                    <ul>
			                                        <li><i class="fa fa-pencil" aria-hidden="true"></i>
			                                        	<form class="form-container" name="updateForm" method="post" 
			                                        	action="${pageContext.request.contextPath}/place/placeReplyUpdate/placeNo=${prList.place.placeNo}&memId=${prList.member.memId}/${prList.prNo}">
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
														<input type='hidden' name='prNo' value="${prList.prNo}">
			                                        	<a href="javascript:;" class="btn" id="editBtn" style="color: blue; text-decoration: none;" onclick="openForm()" >수정하기</a></li>
														<div class="listing__details__review" id="myForm" style="text-align: center;">
														    <h5>Edit Review</h5>
														     <textarea name="prContent" placeholder="Review" style="width: 650px;"></textarea>
														    <button type="submit" class="btnedit" id="editNow" name="editNow">Edit Now</button>
														</div>
														    </form>
			                                        <li><i class="fa fa-window-close" aria-hidden="true"></i>
														 <a href="${pageContext.request.contextPath}/place/placeReplyDelete/placeNo=${prList.place.placeNo}&memId=${prList.member.memId}/${prList.prNo}" style="color: blue; text-decoration: none;" >삭제하기</a>
													</li>
			                                    </ul>
			                                </div>
			                            </div>
	                            </c:forEach>
                        </div>
                        
<%--                            <div class="listing__details__review">
                       	<form class="form-container" name="updateForm" method="post"  action="${pageContext.request.contextPath}/board/update" >
                           <input type="hidden" name="placeNo" value="${placeNo}"/>
                            <h4>Edit Review ${placeNo}, ${memId}, </h4>
                               <textarea name="prContent" placeholder="Review"></textarea>
                               <button type="submit" class="site-btn" id="editNow" name="editNow">Edit Now</button>
                             </form>
                        	</div>
                        --%>
                        
                 		<div class="listing__details__comment">
                            <h4>PhotoReview</h4>
                            	<c:forEach items="${pprList}" var="pprList">
		                            <div class="listing__details__comment__item">
		                                <div class="listing__details__comment__item__pic">
		                                    <img src="${pageContext.request.contextPath}/img/listing/details/comment.png" alt="">
		                                </div>
		                                <div class="listing__details__comment__item__text">
		                                    <div class="listing__details__comment__item__rating">
		                                    </div>
		                                    <span>${pprList.pprRegdate}</span>
		                                    <p>${pprList.member.memName}</p>
		                                    <h6>${pprList.pprContent}</h6>
			                                    <c:forEach items="${pprList.pprpList}" var="pprpList">
	      				  							<img src="${pageContext.request.contextPath}/save/place/${pprpList.pprpPath}" style="width: 200px; height: 200px;">
	      				  						</c:forEach>
		                                    <ul>
		                                        <li><i class="fa fa-pencil" aria-hidden="true"></i>
		                                        	<form class="form-container" name="updatePhotoReview" method="post"  
														action="${pageContext.request.contextPath}/place/placePhotoReviewUpdate/placeNo=${pprList.place.placeNo}&memId=${pprList.member.memId}/${pprList.pprNo}">
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
														<input type='hidden' name='pprNo' value="${pprList.pprNo}">
			                                        	<a href="javascript:;" class="btn" id="editBtn" style="color: blue; text-decoration: none;" onclick="openForm()" >수정하기</a></li>
														<div class="listing__details__review" id="myForm" style="text-align: center;">
														    <h5>Edit Review</h5>
														     <textarea name="pprContent" placeholder="Review" style="width: 650px;"></textarea>
														    <button type="submit" class="btnedit" id="editNow" name="editNow">Edit Now</button>
														</div>
														    </form>
		                                        <li><i class="fa fa-trash" aria-hidden="true"></i>
		                                        	<a href="${pageContext.request.contextPath}/place/photoReviewDelete/placeNo=	${pprList.place.placeNo}&memId=${pprList.member.memId}/${pprList.pprNo}" style="color: blue; text-decoration: none;">삭제하기</a></li>
		                                    </ul>
		                                </div>
		                            </div>
                            </c:forEach>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</section>

</sec:authorize>
</body>

</html>