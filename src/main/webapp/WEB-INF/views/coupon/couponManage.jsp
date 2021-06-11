<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script>
	$(function(){
		
		$(document).on("click","#stop", function() {
			$.ajax({
				async: false,
				type: 'POST',
				url: '${pageContext.request.contextPath}/coupon/stop',
				data: '0',
				error: function( {
					alert("실패");	
				
				})
				success: function({
					alert($(this))	
					
				})
				
			})
		})
		
	});
</script>

</head>

<body>
<h1>제휴 관리</h1>
    <!-- Hero Section Begin -->
<%--     <section class="hero set-bg" data-setbg="${pageContext.request.contextPath}/img/hero/hero-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__text">
                        <div class="section-title">
                            <h2>Discover The Best Services Near You</h2>
                            <p>1.118.940.376 The best service package is waiting for you</p>
                        </div>
                        <div class="hero__search__form">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <div class="select__option">
                                    <select>
                                        <option value="">Choose Categories</option>
                                    </select>
                                </div>
                                <div class="select__option">
                                    <select>
                                        <option value="">Choose Location</option>
                                    </select>
                                </div>
                                <button type="submit">Explore Now</button>
                            </form>
                        </div>
                        <ul class="hero__categories__tags">
                            <li><a href="#"><img src="img/hero/cat-1.png" alt=""> 전체 </a></li>
                            <li><a href="#"><img src="img/hero/cat-2.png" alt=""> 카페 </a></li>
                            <li><a href="#"><img src="img/hero/cat-3.png" alt=""> 문화 </a></li>
                            <li><a href="#"><img src="img/hero/cat-4.png" alt=""> 식품 </a></li>
                            <li><a href="#"><img src="img/hero/cat-5.png" alt=""> 패션</a></li>
                            <li><a href="#"><img src="img/hero/cat-5.png" alt=""> 건강</a></li>
                            <li><a href="#"><img src="img/hero/cat-5.png" alt=""> 스포츠</a></li>
                            <li><a href="#"><img src="img/hero/cat-5.png" alt=""> 미용</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section> --%>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <!-- <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Most Popular Categories</h2>
                        <p>Travelocity empowers travelers who are giving back on their trips in ways big and small</p>
                    </div>
                    <div class="categories__item__list">
                        <div class="categories__item">
                            <img src="img/categories/cat-1.png" alt="">
                            <h5>Food & Drink</h5>
                            <span>78 Listings</span>
                        </div>
                        <div class="categories__item">
                            <img src="img/categories/cat-2.png" alt="">
                            <h5>Restaurent</h5>
                            <span>32 Listings</span>
                        </div>
                        <div class="categories__item">
                            <img src="img/categories/cat-3.png" alt="">
                            <h5>Hotels</h5>
                            <span>16 Listings</span>
                        </div>
                        <div class="categories__item">
                            <img src="img/categories/cat-4.png" alt="">
                            <h5>Beauty & Spa</h5>
                            <span>55 Listings</span>
                        </div>
                        <div class="categories__item">
                            <img src="img/categories/cat-5.png" alt="">
                            <h5>Shopping</h5>
                            <span>23 Listings</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- Categories Section End -->

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
                    <div align="center">
                    <table>
                    	<thead>
                    	<tr>
						<th>쿠폰명</th><th>발급 상태</th><th>교환처</th><th>가격</th><th>카테고리</th><th>중단</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${couponList}" var="coupon" varStatus="count">
						<tr>
							<td>${coupon.cpName}</td>
							<td>${coupon.cpState}</td>
							<td>${coupon.cpPlace}</td>
							<td><fmt:formatNumber value="${coupon.cpPrice}"/></td>
							<td>${coupon.cpState}</td>
							<td><button id="stop"> - </button></td>
						</tr>
						</c:forEach>
						</tbody>
                    </table>
                    </div>
                    </div>
                  </div>
                </div>
             </div>
</body>
</html>