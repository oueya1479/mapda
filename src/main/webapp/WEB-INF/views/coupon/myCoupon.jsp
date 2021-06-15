<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html lang="zxx">

<head>


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
	                            <div class="blog__item" style="width: 300px; height: 400px; ">
	                                <div class="blog__item__pic set-bg">
	                                	<img src="${myCoup.coupon.cpImgpath}" alt="" style="width: 200px; height: 200px;">
	                                </div>
	                               
	                                
	                                <div class="blog__item__text">
	                                    <ul class="blog__item__tags">
	                                        <li><i class="fa fa-tags"></i> ${myCoup.coupon.couponCategory.cpcaName}</li>
	                         
	                                    </ul>
	                                    <h3><a href="#">${myCoup.coupon.cpName}</a>&nbsp; </h3>
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
                        <div class="blog__sidebar__search">
                            
                        </div>
                        
                        <div class="blog__sidebar__categories">
                          
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

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


</html>