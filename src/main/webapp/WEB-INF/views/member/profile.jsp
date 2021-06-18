<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
</head>

<body>

    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="/img/listing/details/listing-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="${member.memImage}" alt="" style="width: 80px; height: 80px">
                        </div>
                        <div class="listing__hero__text" style="color:white; boarder:none;">
                            <h2>${member.memName}</h2>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						ID :  ${member.memId}<br>
						Address : ${member.memAddr}<br>
						Account : ${member.memAccount}<br>
						Grade : ${member.memGrade}
					</form>
                    </div>
                </div>
                <div class="col-lg-4" ><!--버튼을 오른쪽으로 보내고 싶어요-->
                    <div class="listing__hero__btns" style="float: right;">
                        <li><a href="${pageContext.request.contextPath}/member/updateForm" class="primary-btn share-btn"> Update</a></li>
                        <li><a href="#" class="primary-btn"><i class="fa fa-bookmark"></i>Subscribe</a></li> 
                        <li><a href="#" class="primary-btn">Withdrawal</a></li> 
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Section End -->

    <!-- Listing Details Section Begin -->
    <section class="listing-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__details__text">
                        <div class="listing__details__about">
                            <h4>Recently My Maps</h4>
                            ${mapList.content}
                        </div>
                        <div class="listing__details__comment">
                            <h4>Recently My Comments</h4>
                              
                              
                        </div>
                    </div>
                    
                </div>
                
            </div>
        </div>
    </section>
    <!-- Listing Details Section End -->

</body>

</html>