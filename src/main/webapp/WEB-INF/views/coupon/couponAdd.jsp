<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<style>
	form fieldset {
		margin-bottom: 25px;
	}
	
	form legend {
		font-size: 25px;
		font-weight: 600;
	}
	
	form ul li {
		list-style: none;
		margin: 15px 0;
		font-size: 14px;
	}
	select.right {
		float: right;
	}
	
	
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	/* function saveImage() {
		
		//FormData 객체 생성
		let formData = new FormData();
		let cpNameVal = document.getElementById('cpName').value;
		let cpPlaceVal = document.getElementById('cpPlace').value;
		let cpPriceVal = document.getElementById('cpPrice').value;
		let cpDetailVal = document.getElementById('cpDetail').value;
		let files = document.getElementsByName('file');
		
		/*
			추가된 file의 수만큼
			file의 정보를 formData에 추가
		*/
		/* for(var i=0, i<files.length; i++) {
			formData.append('files',document.getElementsByName('file')[i].files[0]);	
		} */
		formData.append('files',formData);
		formData.append('cpName',cpNameVal);
		formData.append('cpPlace',cpPlaceVal);
		formData.append('cpPrice',cpPriceVal);
		formData.append('cpDetail',cpDetailVal);
		
		$.ajax({
			type: "post",
			enctype: 'multipart/form-data',
			url: "/coupon/insert"
			data: formData,
			processData: false,
			contentType: false,
			cache: false,
			tiemout: 600000,
			sucess: function(data) {
				alert("쿠폰 등록이 완료되었습니다 !");
			},
			error: function(e) {
				console.log("쿠폰 등록에 실패하였습니다. :(");
			}
		});
		
	} */
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
                        		<div id="photoUpload" style="text-align: center; vertical-align: top;">사진을 등록하세요</div>
                           <img src="${coupon.cpImgpath}">
                        </div>
                        <div class="blog__item__text" style = "text-align : center;">
                        	<form method="post" enctype="multipart/form-data" id="fileData" action="${pageContext.request.contextPath}/coupon/insert">
                        		<fieldset>
                        			<legend>쿠폰 등록</legend>
                        				<ul>
	                        				<li>
											사진 업로드 : <input type="file" name="file"/>                 				
	                        				</li>
	                 		    			<li>		
	                 		    			카테고리 : 
	                 		    			<select class="form-control" name="cpcaNo" id="cpcaNo" size="8" required="required" style="display: inline-block; text-align: right; margin-left: 500px;">
			                 					<option selected="selected">선택</option>
			                 					<option value="1">카페</option>
			                 					<option value="2">문화</option>
			                 					<option value="3">식품</option>
			                 					<option value="4">패션</option>
			                 					<option value="5">건강</option>
			                 					<option value="6">스포츠</option>
			                 					<option value="7">미용</option>
	                 				       </select> 
	                 				       </li> <br><br>
		                 			<li>
	                 				<input type="hidden" name="cpNo" value="1"/>
	                 				</li>
		                 			<li>
	                 				<input type="hidden" name="memNo" value="55"/>
	                 				</li>
	                 				<!-- <input type="hidden" name="cpcaNo" value=""/> -->
		                 			<li>
	                 				쿠폰이름 : <input type="text" name="cpName"/> <br>
	                 				</li>
		                 			<li>
	                 				사용처  : &nbsp;&nbsp;&nbsp;<input type="text" name="cpPlace"/> <br>
	                 				</li>
	                 				<input type="hidden" name="cpImgpath" value="1"/>
		                 			<li>
	                 				쿠폰가격 : <input type="text" name="cpPrice"/> <br>
	                 				</li>
		                 			<li>
	                 				쿠폰설명 : <input type="text" name="cpDetail"/>
	                 				</li>
	                 				<input type="hidden" name="cpUsingdetail" value=""/>
	                 				<input type="hidden" name="cpState" value="1"/>
	                 				<input type="hidden" name="cpImg" value=""/>
	                 				<li>
	                                <hr><button type ="submit" class="site-btn" >등록</button>
	                                </li>
                        		</ul>
                        		</fieldset>
                        	</form>
                        </div>
                    </div>
                    <div class="blog__item__large">
                    </div>
                
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
<!--                         <button type="submit">Subscribe</button>
 -->                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Newslatter Section End -->


</html>