<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="zxx">

<head>

<!-- memNo 변수설정 -->
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.memNo" var="mno" />
</sec:authorize>

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
</style>

<SCRIPT>

$(document).on('click','#plus',function(){
	if(confirm("적립 해당 게시물은 30일간 삭제불가합니다. 적립하시겠습니까?") == true){
		
		$.ajax({
			url: "${pageContext.request.contextPath}/point/pointPlus",
			type: "get",
			dataType: "json",
			data: {"pointNoStr" : $(this).attr('name')},
			success: function(data){
				if(data == -1){
                    alert("발급 오류","error","확인",function(){});
                } else if(data==1){
					alert("발급 완료")
				} 
			},
			error : function(err) {
				console.log(err + "에러 발생");
			}
			
			
		})
	}else{
		return;
	}
	
	
	
});

</SCRIPT>

</head>

<body>
  
	
	
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-area set-bg" data-setbg="/img/breadcrumb/breadcrumb-blog.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Point</h2>
                        <div class="breadcrumb__option">
                            <a href="#"><i class="fa fa-home"></i> Home</a>
                            <span>My Page</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Blog Section Begin -->
   

    <section class="blog-section spad">
     
    
    <jsp:useBean id="now" class="java.util.Date" />
    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
    <h3 style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TODAY : <c:out value="${today}"/> </h3>&nbsp;
    
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                    <div align="center">
                    
                    <h3 style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;테마지도</h3>&nbsp;
                    

                    <table style="text-align: center;">
                    
                    	<thead>
                    	<tr>
						<th>No.</th><th>내용</th><th>적립</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${requestScope.myThemeList}" var="myTheme" varStatus="status">
						
						<fmt:parseDate value="${myTheme.mapRegdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
						
						<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd" var="writeDate"/>

						<tr>
						
						<c:if test="${today == writeDate }">
							<td>${status.count}</td>
							<td>&nbsp;${myTheme.mapTitle}</td>
							<td><button id="plus"> 적립 </button></td>

							</c:if>
						</tr>				
						</c:forEach>
						</tbody>
                    </table>
                    
                    
                    <hr>
                    <br>
                    <h3 style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;플레이스</h3>&nbsp;
                    <br>
                    <table style="text-align: center;">
                   
                    	<thead>
                    	<tr>
						<th>No.</th><th>내용</th><th>적립</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${requestScope.myPlaceList}" var="myPlace" varStatus="status">
						
						<fmt:parseDate value="${myPlace.placeRegdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime2" type="both"/>
						
						<fmt:formatDate value="${parsedDateTime2}" pattern="yyyy-MM-dd" var="writeDate2"/>

						<tr>
						<c:if test="${today > writeDate2 }">
							<td>${status.count}</td>
							<td>&nbsp;${myPlace.placeTitle}</td>
							<td><button id="plus" name="${myPlace.placeNo}"> 적립 </button></td>

							</c:if>
						</tr>				
						</c:forEach>
						</tbody>
                    </table>
                    
                    <hr>
                    <br>
                    <h3 style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포토후기</h3>&nbsp;
                    <br>
                    <table style="text-align: center;">
                   
                    	<thead>
                    	<tr>
						<th>No.</th><th>내용</th><th>적립</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${requestScope.myPhotoReviewList}" var="myReview" varStatus="status">
						
						<fmt:parseDate value="${myReview.pprRegdate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime3" type="both"/>
						
						<fmt:formatDate value="${parsedDateTime3}" pattern="yyyy-MM-dd" var="writeDate3"/>

						<tr>
						<c:if test="${today == writeDate3 }">
							<td>${status.count}</td>
							<td>&nbsp;${myReview.place.placeTitle} 에 대한 포토리뷰</td>
							<td><button id="plus" > 적립 </button></td>

							</c:if>
						</tr>				
						</c:forEach>
						</tbody>
                    </table>
                    
                    </div>
                    </div>
                    
                    
                     
                     
                </div>
                
                
                 <div class="col-lg-4">
                 
         
                 
                 
                    <div class="blog__sidebar">
                        
                        
                        
                        <div class="blog__sidebar__categories" style =" width : 250px; text-align: center;">
                            <h3>Menu</h3><hr>
                            
                            
                            <ul style="font-size: 25px;">
                                <li><a href="/point/myPoint"><h5>My Point</h5></a></li>
                                <li><a href="/point/myPointHistory"><h5>My Point History</h5></a></li> 
                            </ul>
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