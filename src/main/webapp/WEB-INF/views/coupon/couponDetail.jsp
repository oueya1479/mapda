<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

<sec:authentication property="principal.memNo" var="mno" />



 <script type="text/javascript">
		$(document).on('click', '.site-btn', function() {
			let p = '${coupon.cpPrice}';
			if(confirm("발급하시겠습니까?") == true){
				
				$.ajax({	
					url:"${pageContext.request.contextPath}/couponAjax/issue",
					type:"get",
					dataType:"json",
					data: {"couponNoStr" : $(this).attr('name')},
					success: function(data){
						if(data == -1){
		                    alert("발급 오류! 포인트 잔액을 확인해주세요","error","확인",function(){});
		                } else if(data==1){
							alert("발급 완료");
							$('#point').html($('#point').text() - p);
						} 
					},
					error : function(err) {
						console.log(err + "에러 발생");
					}
				})
				
			}else{
				return;
			}
		
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
                        <h2>쿠폰 상세</h2>
                        <div class="breadcrumb__option">
                            <a href="#"><i class="fa fa-home"></i> Coupon</a>
                            <span></span>
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
                           <img src="${pageContext.request.contextPath}/resources/${coupon.cpImgpath}" style="width: 300px; height: 300px;">
                        </div>
                        <div class="blog__item__text" style = "text-align : center;">
                            <ul class="blog__item__tags">
                                <li><i class="fa fa-tags"></i> ${coupon.couponCategory.cpcaName}</li>
                            
                            </ul>
                            <h3>${coupon.cpName}</h3>&nbsp;
                            
                               <h5><i class="fa fa-money"></i>포인트 :  ${coupon.cpPrice}point</h5>
                 
	                           <h5><i class="fa fa-user"></i>이용매장 : ${coupon.cpPlace}</h5>  
                           
                           		<h5><i class="fa fa-user"></i>교환처 : ${coupon.member.entName}</h5>  
                            	<c:if test="${not empty mno}">
                                <hr><button class="site-btn" name="${coupon.cpNo}">발급</button>
                                </c:if>
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
                        
                        
                        <div class="blog__sidebar__categories" style =" width : 250px; text-align: center;">
                            <h3><i class="fa fa-money">&nbsp;&nbsp;</i>내 포인트</h3><hr>
                            <h5 style="display: inline">: </h5>
                            <h5 style="display: inline" id="point">${myPoint.myPoint}</h5>
                            <h5 style="display: inline"> P</h5>
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