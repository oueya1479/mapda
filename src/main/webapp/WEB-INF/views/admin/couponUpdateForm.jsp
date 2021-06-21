<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<style type="text/css">
	span {
		font-weight: bold;
	}
	ul li {
		list-style: none;
	}
</style>
</head>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
 <script type="text/javascript">
 	function update() {
 		location.href="${pageContext.request.contextPath}/coupon/update";
 	}
 	
 	function checkValid() {
 		var f = window.document.updateForm;
 		if(f.cpcaNo.value==0) {
 			alert("카테고리를 입력해주세요");
 			f.cpcaNo.focus();
 			return false;
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
                   <form method="post" enctype="multipart/form-data" name="updateForm" onsubmit="return checkValid()" action="${pageContext.request.contextPath}/coupon/updateCoupon/coupon=${coupon}/cpNo=${coupon.cpNo}">
                        	<fieldset>
                           <img src="${coupon.cpImgpath}">
                           <input type="hidden" value="${coupon.cpNo}" name="cpNo"/>
                           <input type="hidden" value="${coupon.cpImgpath}" name="cpImgpath"/>
                           <input type="hidden" value="${coupon.couponCategory}" name="couponCategory"/>
                           <input type="hidden" value="${coupon.member}" name="member"/>
                        </div>
                        <div class="blog__item__text" style = "text-align : center;">
                            <ul>
                            <li>
                           <span style="font-weight: bold;">이미지 수정 : </span><input type="file" name="file"/>
                           </li>
                           <li>&nbsp;</li>
                            <legend>
                            <span style="font-weight: bolder;">쿠폰이름 : </span>&nbsp;<input type="text" name="cpName" value="${coupon.cpName}"/>
                            </legend>
                           <li>&nbsp;</li>
                            <li>
                                   <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i>&nbsp;<span>교환처 : </span> <input type="text" name="cpPlace" value="${coupon.cpPlace}"/> </h5>
                 			</li>
                           <li>&nbsp;</li>
                 			<li>
                               <h5><i class="fa fa-money"></i>&nbsp;<span>가격 : </span> <input type="text" name="cpPrice" value="${coupon.cpPrice}"/> </h5>
                 			</li>
                           <li>&nbsp;</li>
                            <li>
                           		<h5><i class="fa fa-sliders" aria-hidden="true"></i>&nbsp;<span>카테고리 </span></h5>
                           	</li>   
                           	  <div class="nice-select" style="margin-left: 300px">
                           		<select class="nice-select" name="couponCategory" id="cpcaNo" style="display:block;">
                           			<option selected="selected" value="0"> 전체 </option>
                           			<option value="1"> 카페 </option>
                           			<option value="2"> 문화 </option>
                           			<option value="3"> 식품 </option>
                           			<option value="4"> 패션 </option>
                           			<option value="5"> 건강 </option>
                           			<option value="6"> 스포츠 </option>
                           			<option value="7"> 미용 </option>
                           		</select>
                           		</div>
                            </ul>
                           		<div style="padding-bottom: 50px;">
                           			
                           		</div>
                        </div>
                    </div>
                    <div class="blog__item__large">
                        
                        <div class="blog__item__text" style = "text-align : center;">
                            
                            <h3>제품 설명</h3>&nbsp;
                            <h5><input type="text" name="cpDetail" value="${coupon.cpDetail}"/> </h5>
                            <hr>
                            <h3>제품 사용 유의사항</h3>&nbsp;
                            <h5><input type="text" name="cpUsingdetail" value="${coupon.cpUsingdetail}"/> </h5>
                            </fieldset>
                                <hr><button type="submit" class="site-btn" style="background-color:#3498DB" id="updateBtn">수정 완료</button>
                            </form>
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