<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<style type="text/css">
	table {
		width: 45em;
		height: 5rem;
		border: 1px solid;
		border-collapse: collapse;
		padding: 50px;
	}
	thead {
		border: 1px solid;
		border-collapse: collapse;
		padding: 50px;
		margin: 50px;
    }
    
    tbody {
		border: 1px solid;
		border-collapse: collapse;
		padding: 50px;
		margin: 50px;
    }
    button {
    	font-weight : bold;
    	color : white;
    	border-radius : 10px;
    	border-color : #F03250;
		padding: 6px 12px;
		background-color: #F03250;
	}
	a:link {
		color: #F03250;
		text-decoration: none;
		/* text-shadow: 0 0 5px; */ 
	}
	a:visited {
		text-decoration: none;
		/* text-shadow: 0 0 5px; */ 
	}
	a:hover {
		color: #F03250;
	}
	.cpbtn {
		text-shadow: 0 0 24px;
	}
	#cpAdd {
		font-family: "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
  		font-weight: 300;
  		background-image: linear-gradient(rgba(0, 195, 6, 0.2) 100%, transparent 0); background-position: 0 0.85em; background-repeat: repeat-x; background-size: 1px 0.5em;

	}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script>
	function checkValid() {
		var f = window.document.searchForm;
		if (f.keyword.value == "") {
			alert("검색어를 입력해 주세요.");
			f.keyword.focus();
			return false;
		}
		return true;
	}
	
	$(function() {
		$(document).on("click", "#stop", function() {
			
			 var stop = confirm("발급상태를 변경하시겠습니까?");
			
			 /* var cpNo = ${coupon.cpNo} */
			 var cpNo = $(this).attr('name');
			 
			if(stop) {
				$(location).attr('href', "${pageContext.request.contextPath}/coupon/stop/cpNo="+cpNo);
			}
		})
		
		
	})
	
	
	</script>
	
	<script>
		$(function(){
			
			
			
			$(document).on("click","#stop", function() {
				
				alert(1)
				/* $.ajax({
					async: false,
					type: 'POST',
					url: '${pageContext.request.contextPath}/coupon/stop',
					data: '0',
					error: function( {
						alert("실패");	
					
					})
					success: function({
						alert($(this))	
						
					}) */
					
				})
			})
			
		});
</script>

</head>

<body>
  

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-area set-bg" data-setbg="../img/breadcrumb/breadcrumb-blog.jpg">
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

    <!-- Most Search Section Begin -->
    <section class="most-search spad">
    <h3 style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제휴 관리</h3>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>쿠폰 목록</h2>
                        <p>※엔터프라이즈 회원들이 발행한 전체 쿠폰 내역입니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="most__search__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-047-menu"></span>
                                    전체
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-040-coffee-cup"></span>
                                    카페
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-017-croissant"></span>
                                    문화
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-039-fork"></span>
                                    식품
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-039-fork"></span>
                                    패션
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-049-breakfast"></span>
                                    건강
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-039-fork"></span>
                                    스포츠
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-039-fork"></span>
                                    미용
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                    <div style="margin-left: 840px; margin-bottom: 10px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-plus-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zM8.5 8a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V12a.5.5 0 0 0 1 0v-1.5H10a.5.5 0 0 0 0-1H8.5V8z"/>
</svg>&nbsp;<a href="${pageContext.request.contextPath}/coupon/insert" style="font-style: normal;" id="cpAdd">쿠폰등록</a>
					</div>
                    <div align="center">
                    <table>
                    	<thead>
                    	<tr>
						<th>쿠폰명</th><th>발급 상태</th><th>교환처</th><th>가격</th><th>카테고리</th><th>상태전환</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${couponList.content}" var="coupon">
						<tr>
							<td><a href="${pageContext.request.contextPath}/coupon/couponAdminDetail?cpNo=${coupon.cpNo}" class="cpbtn">${coupon.cpName}</a></td>
							<td>
							<c:choose>
								<c:when test="${coupon.cpState eq 1}">
									발급 가능
								</c:when>
								<c:otherwise>
									발급 중단	
								</c:otherwise>
							</c:choose>
							</td>
							<td>${coupon.cpPlace}</td>
							<td><fmt:formatNumber value="${coupon.cpPrice}"/></td>
						    <td>${coupon.couponCategory.cpcaName}</td>
							<td>
							<c:choose>
								<c:when test="${coupon.cpState eq 1}">
									<button id="stop" name="${coupon.cpNo}" style="padding-left: 14px;padding-right: 14px;"> - </button>
								</c:when>
								<c:otherwise>
									<button id="stop" name="${coupon.cpNo}"> + </button>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						</c:forEach>
						
						</tbody>
                    </table>
                    </div>
    				
                    <!-- 페이징처리 -->
            
                    <div class="blog__pagination" style="text-align: center">
                 
                        <!-- 이전 -->
                        <c:choose> 
                        <c:when test="${couponList.first}">
                        </c:when> 
                        <c:otherwise> 
                        <a href="/coupon/admin/?nowPage=${couponList.number-1}"><i class="fa fa-long-arrow-left"></i>Pre</a> 
                        </c:otherwise> 
                        </c:choose>

                        <c:forEach begin="0" end="${couponList.totalPages-1}" var="i"> <!-- pageList.getTotalPages() 호출 -->
   							<c:choose>
     							<c:when test="${couponList.number==i}"> <!-- pageList.getNumver() 호출 -->
         							<a href="${pageContext.request.contextPath}/coupon/admin?nowPage=${i}" style="color:red">  ${i+1}  </a>
     							</c:when>
    						<c:otherwise>
         						<a href="${pageContext.request.contextPath}/coupon/admin?nowPage=${i}">  ${i+1}  </a>
     						</c:otherwise>
   							</c:choose>
   
 						</c:forEach>
                        <!-- 다음 -->
                        <c:choose> 
                        <c:when test="${couponList.last}">
                        </c:when> 
                        <c:otherwise> 
                        <a href="/coupon/admin/?nowPage=${couponList.number+1}"><i class="fa fa-long-arrow-right"></i>Next</a> 
                        </c:otherwise> 
                        </c:choose>
                        
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog__sidebar"  style="">
                        <div class="blog__sidebar__search">
                            <form name="searchForm" action="/coupon/list" method="post" onSubmit='return checkValid()'>
                	<div style="padding-left: 400px"></div>
                                <input type="text"  id="keyword" name="keyword" placeholder="쿠폰명 검색...">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        
                       <%--  <div class="blog__sidebar__categories">
                            <h5>Categories</h5>
                            <ul>
                                <li><a href="/coupon/list">전체</a></li>
                                <c:forEach items="${requestScope.categoryList}" var="cate">
                                <li><a href="/coupon/list/${cate.cpcaNo-1}">${cate.cpcaName}<span></span></a></li>
                                </c:forEach>
                                
                            </ul>
                        </div> --%>
                       
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