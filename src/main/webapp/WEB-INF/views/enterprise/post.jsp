<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Blog Hero Begin -->
	<div class="blog-details-hero set-bg" data-setbg="${pageContext.request.contextPath}/resources/${post.epLogo}">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="blog__hero__text">
						<div class="label">${post.epTag}</div>
						<h2>${post.epTitle}</h2>
						<ul>
							<li><i class="fa fa-clock-o"></i>${post.epRegdate}</li>
							<li><i class="fa fa-user"></i>${post.enterprise.entName}</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Blog Hero End -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog__details__text">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
							<c:set var="c" value="0" />
								<c:forEach items="${post.imageList}" var="image">
									<c:if test="${c eq 0}">
										<div class="carousel-item active">
											<img class="d-block w-100" src="${pageContext.request.contextPath}/resources/${image.imageSource}" style="max-height: 500px; object-fit: cover;"
												alt="First slide">
										</div>
									</c:if>
									<c:if test="${c > 0}">
										<div class="carousel-item">
											<img class="d-block w-100" src="${pageContext.request.contextPath}/resources/${image.imageSource}" style="max-height: 500px; object-fit: cover;"
												alt="First slide">
										</div>
									</c:if>
								<c:set var="c" value="1" />
								</c:forEach>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
						${post.epContent}
					</div>
					<div class="blog__details__tags">
						<span>Tags</span> 
						${post.epTag}
					</div>
					<div class="listing__details__comment">
						<h4>Comment</h4>
						<c:forEach items="${replyList}" var="reply">
							<div class="listing__details__comment__item">
								<div class="listing__details__comment__item__pic">
									<img src="${reply.member.memImage}" alt="">
								</div>
								<div class="listing__details__comment__item__text">
									<span>
										<fmt:parseDate value="${reply.erRegdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>        
	                        	    	<fmt:formatDate value="${parsedDateTime}" pattern="yyyy.MM.dd"/>
                        	    	</span>
									<h5>${reply.erName}</h5>
									${reply.erContent}
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="blog__details__comment__form">
						<div class="blog__details__comment__title">
							<h4>Leave A Reply</h4>
						</div>
						<form action="${pageContext.request.contextPath}/enterprise/addReply/${post.epNo}" class="contact__form">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<input type="text" placeholder="${name}" value="${name}"  name="erName" readonly="readonly">
								</div>
							</div>
							<textarea placeholder="Message" name="erContent"></textarea>
							<button type="submit" class="site-btn">등록</button>
						</form>
					</div>
				</div>
				<div class="col-lg-4">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Searching...">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__recent">
                            <h5>Recent Post</h5>
                        <c:forEach items="${enterprisePostList.content}" var="post" begin="0" end="5">
                            <a href="${pageContext.request.contextPath}/enterprise/post/${post.epNo}" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__text">
                                    <span><i class="fa fa-tags"></i>${post.epTag}</span>
                                    <h6>${post.epTitle}</h6>
                                    <p><i class="fa fa-clock-o"></i>${post.epRegdate}</p>
                                </div>
                            </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->

</body>
</html>