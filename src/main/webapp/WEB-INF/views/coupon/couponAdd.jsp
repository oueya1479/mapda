<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
  	
</head>

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
                           <img src="${coupon.cpImgpath}">
                        </div>
                        <div class="blog__item__text" style = "text-align : center;">
                            	
                 				쿠폰이름 : <input type="text" id="cpName"/> <br>
                 				사용처 : <input type="text" id="cpPlace"/> <br>
                 				쿠폰가격 : <input type="text" id="cpPrice"/> <br>
                 				쿠폰설명 : <input type="text" id="cpDetail"/>
                            
                                <hr><button type="submit" class="site-btn">등록</button>
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
                <div class="col-lg-4">
                    <div class="blog__sidebar">
                        
                        
                        <div class="blog__sidebar__categories">
                            <h5>My Point</h5>
                            <ul>
                                <li><a href="#">Finance <span>18</span></a></li>
                                <li><a href="#">Business <span>20</span></a></li>
                                <li><a href="#">Loan <span>07</span></a></li>
                                <li><a href="#">Consulting <span>22</span></a></li>
                                <li><a href="#">Credit <span>19</span></a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__tags">
                            <h5>Popular Tag</h5>
                            <a href="#">Business</a>
                            <a href="#">Marketing</a>
                            <a href="#">Payment</a>
                            <a href="#">Travel</a>
                            <a href="#">Finance</a>
                            <a href="#">Videos</a>
                            <a href="#">Ideas</a>
                            <a href="#">Unique</a>
                            <a href="#">Music</a>
                            <a href="#">Key</a>
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