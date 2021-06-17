<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

<sec:authentication property="principal.memNo" var="mno" />

 <script type="text/javascript">
	$(function(){
		$(document).on('click', '.site-btn', function() {
			let couponNo = $(this).attr('name');
			$.ajax({
				url:"${pageContext.request.contextPath}/coupon/subscribe",
				type:"get",
				dataType:"json",
				data: {"couponNoStr" : $(this).attr('name'), "memNoStr" : ${mno}},
				success: function(data){
					if(data == -1){
	                    alert("발급 오류","error","확인",function(){});
	                } else if(data==1){
						alert()
					} 
				},
				error : function(err) {
					console.log(err + "에러 발생");
				}
			});
		});//클릭function 끝
	});//script 끝
</script>
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
                            <ul class="blog__item__tags">
                                <li><i class="fa fa-tags"></i> ${coupon.couponCategory.cpcaName}</li>
                            
                            </ul>
                            <h3>${coupon.cpName}</h3>&nbsp;
                            
                               <h5><i class="fa fa-money"></i>포인트 :  ${coupon.cpPrice}point</h5>
                 
	                           <h5><i class="fa fa-user"></i>이용매장 : ${coupon.cpPlace}</h5>  
                           
                           		<h5><i class="fa fa-user"></i>교환처 : ${coupon.member.entName}</h5>  
                            
                                <hr><button class="site-btn" name="${coupon.cpNo}">발급</button>
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