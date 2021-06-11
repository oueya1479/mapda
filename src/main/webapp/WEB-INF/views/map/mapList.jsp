<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script>
	 $(function(){
		  
		   $("input[value=Modify]").click(function(){
			   var mapNo = $(this).attr("id")
			   alert(mapNo);
			   var url = "${pageContext.request.contextPath}/map/modifyForm?mapNo="+mapNo;
			   $(location).attr('href',url);
		   })
		   
	   });
	
	</script>
</head>

<body>


	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-area set-bg"
		data-setbg="/img/breadcrumb/breadcrumb-blog.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Our All Maps</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Blog Section Begin -->
	<section class="most-search spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>All our Maps in here!</h2>
						<p>You can find fanciest places with Mapda's various Maps~</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="most__search__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab"> <span
									class="flaticon-039-fork"></span> Restaurent
							</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab"> <span class="flaticon-030-kebab"></span>
									Shopping
							</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab"> <span
									class="flaticon-032-food-truck"></span> Travel
							</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-4" role="tab"> <span
									class="flaticon-017-croissant"></span> Beauty
							</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-5" role="tab"> <span
									class="flaticon-038-take-away"></span> Event
							</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-6" role="tab"> <span
									class="flaticon-031-delivery"></span> Rental
							</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</section>



	<div class="container">
		<div class="row">
		
			<c:forEach items="${mapList.content}" var="map">
				
				<div class="col-lg-8">
					<div class="blog__item__large">
						<!-- 이미지 넣어야 할다~~~ -->
						<div class="blog__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/img/blog/blog-large.jpg">

						</div>
						<div class="blog__item__text">
							<ul class="blog__item__tags">

								<li><i class="fa fa-tags"></i>
									${map.mapCategory.categoryName}</li>

							</ul>
							<h3>
								<a
									href="${pageContext.request.contextPath}/map/mapRead/${map.mapNo}">${map.mapTitle}</a>
							</h3>
							<ul class="blog__item__widget">
								<li><i class="fa fa-clock-o"></i> ${map.mapRegdate}</li>
								<li><i class="fa fa-user"></i> ${map.member.memId}</li>
							</ul>
							<p>${map.mapContent}</p>
							<p style="text-align: right;"><img src="${pageContext.request.contextPath}/img/map/view.png"alt="" 
											style="height:20px; width:20px;" > ${map.mapReadnum}</p>
							<p style="text-align: right;"><img src="${pageContext.request.contextPath}/img/map/heart.png"alt="" 
											style="height:20px; width:20px;" > ${map.mapLike}</p><p><br>
								<input type="button" class="btn btn-outline-danger" value="Modify" id="${map.mapNo}" name="modifyMap" style="width:100px"/>
								<input type="button" class="btn btn-outline-dark" value="Delete" name="deleteMap" style="width:100px; float: right;"/>
						</div>
						
			</c:forEach>
			
						
		</div>




		<div class="blog__pagination">
			<a href="#"><i class="fa fa-long-arrow-left"></i> Pre</a> <a href="#">1</a>
			<a href="#">2</a> <a href="#">3</a> <a href="#">Next <i
				class="fa fa-long-arrow-right"></i>
			</a>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="blog__sidebar">
			<div class="blog__sidebar__search">
				<form action="#">
					<input type="text" placeholder="Searching...">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
			<div class="blog__sidebar__recent">
				<h5>Recent Post</h5>
				<a href="#" class="blog__sidebar__recent__item">
					<div class="blog__sidebar__recent__item__pic">
						<img src="img/blog/recent-1.jpg" alt="">
					</div>
					<div class="blog__sidebar__recent__item__text">
						<span><i class="fa fa-tags"></i> Shopping</span>
						<h6>Tortoise grilled on salt</h6>
						<p>
							<i class="fa fa-clock-o"></i> 19th March, 2019
						</p>
					</div>
				</a> <a href="#" class="blog__sidebar__recent__item">
					<div class="blog__sidebar__recent__item__pic">
						<img src="img/blog/recent-2.jpg" alt="">
					</div>
					<div class="blog__sidebar__recent__item__text">
						<span><i class="fa fa-tags"></i> Hotels</span>
						<h6>Shrimp floured and fried</h6>
						<p>
							<i class="fa fa-clock-o"></i> 22th March, 2019
						</p>
					</div>
				</a> <a href="#" class="blog__sidebar__recent__item">
					<div class="blog__sidebar__recent__item__pic">
						<img src="img/blog/recent-3.jpg" alt="">
					</div>
					<div class="blog__sidebar__recent__item__text">
						<span><i class="fa fa-tags"></i> Restaurant</span>
						<h6>Sweet and sour pork ribs</h6>
						<p>
							<i class="fa fa-clock-o"></i> 25th March, 2019
						</p>
					</div>
				</a> <a href="#" class="blog__sidebar__recent__item">
					<div class="blog__sidebar__recent__item__pic">
						<img src="img/blog/recent-4.jpg" alt="">
					</div>
					<div class="blog__sidebar__recent__item__text">
						<span><i class="fa fa-tags"></i> Videos</span>
						<h6>Crab fried with tamarind</h6>
						<p>
							<i class="fa fa-clock-o"></i> 19th March, 2019
						</p>
					</div>
				</a> <a href="#" class="blog__sidebar__recent__item">
					<div class="blog__sidebar__recent__item__pic">
						<img src="img/blog/recent-5.jpg" alt="">
					</div>
					<div class="blog__sidebar__recent__item__text">
						<span><i class="fa fa-tags"></i> Travel</span>
						<h6>Tortoise grilled on salt</h6>
						<p>
							<i class="fa fa-clock-o"></i> 19th March, 2019
						</p>
					</div>
				</a>
			</div>
			<div class="blog__sidebar__categories">
				<h5>Categories</h5>
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
				<a href="#">Business</a> <a href="#">Marketing</a> <a href="#">Payment</a>
				<a href="#">Travel</a> <a href="#">Finance</a> <a href="#">Videos</a>
				<a href="#">Ideas</a> <a href="#">Unique</a> <a href="#">Music</a> <a
					href="#">Key</a>
			</div>
		</div>
	</div>
	</div>
	</div>

	<!-- Blog Section End -->

	<!-- Newslatter Section Begin -->

	<!-- Newslatter Section End -->
</html>