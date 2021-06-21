<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="zxx">

<head>

<!-- memNo 변수설정 -->
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.memNo" var="mno" />
</sec:authorize>

<style type="text/css">

 div[name="pop"]{
	 width:300px; height:300px;
	 position:absolute; margin-bottom: auto; text-align:center;
	 border: 2px solid #000;
 }
 
 div[name="pop_bt"]{
 	
 	width: 100px; margin :auto;
 	cursor: pointer;
 	font-weight: bold;
 	text-align: center;
 	padding: 5px;
 }
 


</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('[name=pop_bt]').click(function(){
		//$("[name=pop]").show()
		//$('#pop').show();
		
		$(this).next().show();
		 //event.preventDefault()
	});
	
	
	

	
	
	
	/*$('[name=pop_bt]').mouseout(function(){
		$(this).next().hide();
	})*/
	
 }); 
 
/*$(document).click(function(){
	alert(11)
	$("[name=pop]").hide()
})
*/

$(document).mouseup(function (e){

    var container = $('[name=pop]');

    if( container.has(e.target).length === 0){

      container.css('display','none');

    }

  });
 
 
</script>


</head>

<body>
  

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-area set-bg" data-setbg="/img/breadcrumb/breadcrumb-blog.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Coupon</h2>
                        <div class="breadcrumb__option">
                            <a href="#"><i class="fa fa-home"></i> My Page</a>
                            <span>Coupon</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Blog Section Begin -->
    <section class="blog-section spad">
    <h3 style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나의 쿠폰</h3>&nbsp;
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                    <c:choose>
							<c:when test="${empty requestScope.myCouponList.content}">
								
								<p align="center">
									<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
								</p>
							</c:when>
							<c:otherwise>
                    	<c:forEach items="${requestScope.myCouponList.content}" var="myCoup">
	                        <div class="col-lg-6 col-md-6">
	                            <div class="blog__item" style="width: 300px; height: 400px; text-align: center;">
	                                <div class="blog__item__pic set-bg" name="pop_bt">
	                              
	                                	<img src="${myCoup.coupon.cpImgpath}" alt="" style="width: 200px; height: 200px;">
	                                </div>
	                                
	                                <div name="pop" style="display:none;">
	                                <div>
	                                	<img src="${myCoup.barcoImgPath}" alt="" style="width: 200px; height: 200px;">
	                                </div>
	                                
	                                </div>
	                               
	                                
	                                <div class="blog__item__text" >
	                                    
	                                       <i class="fa fa-tags"></i> 
	                                       
	                                       ${myCoup.coupon.couponCategory.cpcaName}
	                                    
	                                    <a href="${pageContext.request.contextPath}/coupon/couponDetail/${myCoup.coupon.cpNo}"><h4>${myCoup.coupon.cpName}&nbsp; </h4></a>
	                                    <fmt:parseDate value="${myCoup.mycpDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
	                                    
	                                    <h5>발급날짜 : <fmt:formatDate value="${parsedDateTime}" pattern="yyyy.MM.dd"/> </h5>
	                                    
	                                    <ul class="blog__item__widget">
	                                    <c:choose>
											<c:when test="${myCoup.mycpState eq 1}">
											<li><i class="fa fa-money"></i>쿠폰상태 :  사용가능 </li>
											</c:when>
											<c:otherwise>
												<li><i class="fa fa-money"></i>쿠폰상태 :  사용완료 </li>	
											</c:otherwise>
										</c:choose>
	                                        
	                                        <li><i class="fa fa-user"></i>사용처 : ${myCoup.coupon.member.entName}</li>                
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                        </c:otherwise>
						</c:choose>
                    </div>
                    
                    <!-- 페이징처리 -->
            		<c:if test="${not empty requestScope.myCouponList.content}">
								
							
                    <div class="blog__pagination" style="text-align: center">
                 
                        <!-- 이전 -->
                        <c:choose> 
                        <c:when test="${myCouponList.first}">
                        </c:when> 
                        <c:otherwise> 
                        <a href="/myPage/myCoupon/?nowPage=${myCouponList.number-1}"><i class="fa fa-long-arrow-left"></i>Pre</a> 
                        </c:otherwise> 
                        </c:choose>

                        <c:forEach begin="0" end="${myCouponList.totalPages-1}" var="i"> <!-- pageList.getTotalPages() 호출 -->
   							<c:choose>
     							<c:when test="${myCouponList.number==i}"> <!-- pageList.getNumver() 호출 -->
         							<a href="${pageContext.request.contextPath}/myPage/myCoupon?nowPage=${i}" style="color:red">  ${i+1}  </a>
     							</c:when>
    						<c:otherwise>
         						<a href="${pageContext.request.contextPath}/myPage/myCoupon?nowPage=${i}">  ${i+1}  </a>
     						</c:otherwise>
   							</c:choose>
   
 						</c:forEach>
                        <!-- 다음 -->
                        <c:choose> 
                        <c:when test="${myCouponList.last}">
                        </c:when> 
                        <c:otherwise> 
                        <a href="/myPage/myCoupon/?nowPage=${myCouponList.number+1}"><i class="fa fa-long-arrow-right"></i>Next</a> 
                        </c:otherwise> 
                        </c:choose>
                        
                       
                    </div>
                    </c:if>
                     
                     
                </div>
                
                
                <div class="col-lg-4">
                    <div class="blog__sidebar">
                        
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Newslatter Section Begin -->
    <section class="newslatter">
        
    </section>
    <!-- Newslatter Section End -->


</html>