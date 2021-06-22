<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

<sec:authentication property="principal.memNo" var="mno" />

<SCRIPT>


	function checkValid() {
		var f = window.document.searchForm;
		if (f.keyword.value == "") {
			alert("검색어를 입력해 주세요.");
			f.keyword.focus();
			return false;
		}
		return true;
	}
</SCRIPT>

<script> $(function(){ 
					var $win = $(window); 
					var top = $(window).scrollTop();   
					var speed = 500; 
					var easing = 'linear';  
					var $layer = $('.blog__sidebar');
					var layerTopOffset = 0;  
					$layer.css('position', 'relative').css('z-index', '1');
					
					
					if (top > 50 ) 
						$win.scrollTop(layerTopOffset+top); 
					else 
						$win.scrollTop(0); 
					
					$(window).scroll(function(){ 
						yPosition = $win.scrollTop() - 400; 
						if (yPosition < 460) 
						{ 
							yPosition = 0; 
						} 
						$layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false}); 
						}); 
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
                            <a href="#"><i class="fa fa-home"></i> Home</a>
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
    <h3 style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;쿠폰 목록</h3>&nbsp;
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                    <c:choose>
                    		
							<c:when test="${empty requestScope.couponList.content}">
								
								<p align="center">
									<b><span style="font-size: 9pt;">등록된 상품이 없습니다.</span></b>
								</p>
							</c:when>
							
							
							
							<c:otherwise>
                    	<c:forEach items="${requestScope.couponList.content}" var="coup">
							<c:if test="${coup.cpState eq 1}">
                    	
	                        <div class="col-lg-6 col-md-6">
	                            <div class="blog__item" style="width: 300px; height: 400px; ">
	                                <div class="blog__item__pic set-bg">
	                                	<img src="${pageContext.request.contextPath}/resources/${coup.cpImgpath}" alt="" style="width: 200px; height: 200px;">
	                                </div>
	                               
	                                
	                                <div class="blog__item__text">
	                                    <ul class="blog__item__tags">
	                                        <li><i class="fa fa-tags"></i> ${coup.couponCategory.cpcaName}</li>
	                         
	                                    </ul>
	                                    <h3><a href="${pageContext.request.contextPath}/coupon/couponDetail/${coup.cpNo}">${coup.cpName}</a></h3>
	                                    
	                                    <ul class="blog__item__widget">
	                                        <li><i class="fa fa-money"></i>포인트 :  ${coup.cpPrice}point</li>
	                                        <li><i class="fa fa-user"></i>이용매장 : ${coup.cpState}</li>
	                                                        
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                        </c:if>
                        </c:forEach>
                        </c:otherwise>
                       
						</c:choose>
                    </div>
                    
                    <!-- 페이징처리 -->
            		<c:if test="${not empty requestScope.couponList.content}">
								
							
                    <div class="blog__pagination" style="text-align: center">
                 
                        <!-- 이전 -->
                        <c:choose> 
                        <c:when test="${couponList.first}">
                        </c:when> 
                        <c:otherwise> 
                        <a href="/coupon/list/?keyword=${param.keyword}&cetegory=${param.category}&nowPage=${couponList.number-1}"><i class="fa fa-long-arrow-left"></i>Pre</a> 
                        </c:otherwise> 
                        </c:choose>

                        <c:forEach begin="0" end="${couponList.totalPages-1}" var="i"> <!-- pageList.getTotalPages() 호출 -->
   							<c:choose>
     							<c:when test="${couponList.number==i}"> <!-- pageList.getNumver() 호출 -->
         							<a href="${pageContext.request.contextPath}/coupon/list?nowPage=${i}" style="color:red">  ${i+1}  </a>
     							</c:when>
    						<c:otherwise>
         						<a href="${pageContext.request.contextPath}/coupon/list?nowPage=${i}">  ${i+1}  </a>
     						</c:otherwise>
   							</c:choose>
   
 						</c:forEach>
                        <!-- 다음 -->
                        <c:choose> 
                        <c:when test="${couponList.last}">
                        </c:when> 
                        <c:otherwise> 
                        <a href="/coupon/list/?keyword=${param.keyword}&cetegory=${param.category}&nowPage=${couponList.number+1}"><i class="fa fa-long-arrow-right"></i>Next</a> 
                        </c:otherwise> 
                        </c:choose>
                        
                       
                    </div>
                    </c:if>
                     
                     
                </div>
                
                
                <div class="col-lg-4">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form name="searchForm" action="/coupon/list" method="get" onSubmit='return checkValid()'>
                                <input type="text"  id="keyword" name="keyword" placeholder="쿠폰명 검색...">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        
                        <div class="blog__sidebar__categories" style =" width : 250px; text-align: center;">
                            <h3><i class="fa fa-money">&nbsp;&nbsp;</i>내 포인트</h3><hr>
                            <h5>: ${myPoint.myPoint} P </h5>
                        </div>
                        
                        <div class="blog__sidebar__categories" style =" width : 250px; text-align: center;">
                            <h4>Categories</h4>&nbsp;<hr>
                            <ul style="font-size: 25px;">
                                <li><a href="/coupon/list">전체</a></li>
                                <c:forEach items="${requestScope.categoryList}" var="cate">
                                <li><a href="/coupon/list/?category=${cate.cpcaNo}">${cate.cpcaName}<span></span></a></li>
                                </c:forEach>
                                
                            </ul>
                        </div>
                        
                        
                       
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