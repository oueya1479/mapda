<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">
	
	<style>
		span {
			font-weight: bold;
		}
	
	</style>
</head>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
 
 <script type="text/javascript">
 	$(function() {
 		
 		$(document).on("click", "#deleteBtn", function() {
 			confirm("해당 쿠폰을 정말 삭제하시겠습니까?");
 		})
 	});
 	
 	function update(cpNo) {
 		
 		var answer;
 		answer = confirm("쿠폰 수정 페이지로 이동합니다.");
 		
 		if(answer==true) {
			location.href = "${pageContext.request.contextPath}/coupon/updateForm?cpNo=" + cpNo; 		
 		} else {
 			alert("다시 시도해 주세요.");
 		}
 	}
 	
 	
 </script>

<body>
  

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-area set-bg" data-setbg="/img/blog/details/blog-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Our Blog</h2>
                        <div class="breadcrumb__option">
                            <a href="#"><i class="fa fa-home"></i> Home</a>
                            <span>Our Blog</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog__item__large">
                        <div class="blog__item__pic set-bg">
                           <img src="${pageContext.request.contextPath}/resources/${coupon.cpImgpath}" style="height: 300px; width: 300px;">
                        </div>
                        <div class="blog__item__text" style = "text-align : center;">
                            <ul class="blog__item__tags">
                                <li><i class="fa fa-tags"></i> ${coupon.couponCategory.cpcaName}</li>
                            
                            </ul>
                            <h3>${coupon.cpName}</h3>&nbsp;
                            
                               <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i>&nbsp;<span>교환처 : </span>  ${coupon.cpPlace}</h5>
                 
                               <h5><i class="fa fa-money"></i>&nbsp;<span>가격 : </span> ${coupon.cpPrice}point</h5>
                 
	                           <h5><i class="fa fa-cart-plus" aria-hidden="true"></i>&nbsp;<span>이용매장 : </span> ${coupon.cpPlace}</h5>  
                           
                           		<h5><i class="fa fa-sliders" aria-hidden="true"></i>&nbsp;<span>카테고리 : </span> ${coupon.couponCategory.cpcaName}</h5>  
                            
                                <%-- <hr><button type="button" class="site-btn" style="background-color:#3498DB" id="updateBtn" onclick="update(${coupon.cpNo});">수정</button> --%>
                                	&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="blog__item__large">
                        
                        <div class="blog__item__text" style = "text-align : center;">
                            
                            <h3>제품 설명</h3>&nbsp;
                            <h5>${coupon.cpDetail} </h5>
                            <hr>
                            <h3>제품 사용 유의사항</h3>&nbsp;
                            <h5>${coupon.cpUsingdetail} </h5>
                              
                 
	                          
                            
                               
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