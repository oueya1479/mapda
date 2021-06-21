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
	.readthis{
		
		border: 1px solid;
		margin: 10px;
		background-color: #DCDCDC;
		position: relative;
		width: 60%;
		margin-left : 10%;
		
	}
</style>

<SCRIPT>
$(document).on('click','#plus',function(){
	let name = $(this).attr('name');
	let value = $(this).val();
	
	//alert(value + " " + name);
	if(confirm("적립 해당 게시물은 30일간 삭제불가합니다. 적립하시겠습니까?") == true){
			$.ajax({
				url: "${pageContext.request.contextPath}/point/pointPlus",
				type: "get",
				dataType: "json",
				data: {'classNo' : name, 'className' : value},
				success: function(data){
					if(data == -1){
	                    alert("각 게시물의 적립은 3번만 가능합니다.");
	                } else if(data==1){
						alert("적립 완료")
						location.reload();
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
                        <h2>적립 가능 포인트</h2>
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
   

    <section class="blog-section spad" style="text-align: center;">
     <div class="readthis"  >
     <h2>※안내사항※</h2><br>
     포인트 적립은 해당일에 등록한 지도, 플레이스, 포토후기에 적용가능합니다.<br>
     - 부적합한 행위의 포인트적립이 발견되면 페널티가 적용됩니다.(1번:경고, 2번: 포인트 차감, 3번: 탈퇴조치)<br>
     - 최대 적립 가능한 포인트 적립기준은 다음과 같습니다.<br>
     - 각 게시물당 3번씩 적립 가능 / 하루기준<br>
     - 적립 1회당 지급 포인트 점수<br>
     - 테마지도 : 100point, 플레이스: 50point, 포토후기 : 10point<br>
     - 적립이 완료된 지도, 플레이스, 포토후기는 30일간 삭제가 어렵습니다.<br>
       30일 경과 전에 삭제를 원하실 경우, 1:1문의를 이용해주세요.<br><br>
     </div>
    <br><br><br>
    <jsp:useBean id="now" class="java.util.Date" />
    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
    <h3 style="font-weight: bold">&nbsp;TODAY : <c:out value="${today}"/> </h3>&nbsp;
    <br>
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
							<td>
							<c:choose>
								<c:when test="${myTheme.mapPoint eq 0}">
									<button id="plus" name="${myTheme.mapNo}" value="theme"> 적립 </button>
								</c:when>
								<c:otherwise>
									적립완료	
								</c:otherwise>
							</c:choose>

							</td>

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
						<c:if test="${today == writeDate2 }">
							<td>${status.count}</td>
							<td>&nbsp;${myPlace.placeTitle}</td>
							<td>
							<c:choose>
								<c:when test="${myPlace.placePoint eq 0}">
									<button id="plus" name="${myPlace.placeNo}" value="place"> 적립 </button>
								</c:when>
								<c:otherwise>
									적립완료	
								</c:otherwise>
							</c:choose>

							</td>

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
							<td>&nbsp;${myReview.place.placeTitle} 에 대한 포토리뷰  ${fn:length(requestScope.myPhotoReviewList)}</td>
							<td>
							
							<c:choose>
								<c:when test="${myReview.pprPoint eq 0}">
									<button id="plus" name="${myReview.pprNo}" value="review"> 적립 </button>
								</c:when>
								
								<c:otherwise>
									적립완료
								</c:otherwise>
							
								
							</c:choose>

							</td>

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
                            <h3><i class="fa fa-money">&nbsp;&nbsp;</i>내 포인트</h3><hr>
                            <h5 style="display: inline">: </h5>
                            <h5 style="display: inline" id="point">${myPoint.myPoint}</h5>
                            <h5 style="display: inline"> P</h5>
                        </div>
                        
                        
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
        
    </section>
    <!-- Newslatter Section End -->


</html>