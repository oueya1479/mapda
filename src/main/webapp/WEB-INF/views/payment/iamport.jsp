<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix = "sec" uri="http://www.springframework.org/security/tags"%>
<%-- <%
    String name = (String)request.getAttribute("name");
    String email = (String)request.getAttribute("email");
    String phone = (String)request.getAttribute("phone");
    String address = (String)request.getAttribute("address");
    int totalPrice = (int)request.getAttribute("totalPrice");    
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
</head>
<body>

alert('<sec:authentication property="principal.memName"/>');

	<script>
		$(function() {
			IMP.init('imp55454347'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : 'kakaopay',
				merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
				name : ' Mapda 정기결제',
				amount : 3000,
				tax_free : 100, //면세공급가액(누락되면 0원으로 처리)
				buyer_name : '<sec:authentication property="principal.memName"/>',
				buyer_Id : '<sec:authentication property="principal.memId"/>', //누락되면 이니시스 결제창에서 오류
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				naverPopupMode : true, //리디렉션모드 vs 팝업모드
				naverProducts : [ { //상품정보(필수전달사항) 네이버페이 매뉴얼의 productItems 파라메터와 동일합니다.
					"categoryType" : "BOOK",
					"categoryId" : "GENERAL",
					"uid" : "107922211",
					"name" : "한국사",
					"payReferrer" : "NAVER_BOOK",
					"count" : 10
				}, {
					"categoryType" : "MUSIC",
					"categoryId" : "CD",
					"uid" : "299911002",
					"name" : "러블리즈",
					"payReferrer" : "NAVER_BOOK",
					"count" : 1
				} ]
			}, function(rsp) {
				if (rsp.success) {
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "${pageContext.request.contextPath}/payment/complete", //cross-domain error가 발생하지 않도록 주의해주세요
						type : 'POST',
						dataType : 'json',
						data : {
							imp_uid : rsp.imp_uid
						//기타 필요한 데이터가 있으면 추가 전달
						}
					}).done(function(data) {
						//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if (everythings_fine) {
							var msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\n결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;

							alert(msg);
						} else {
							//[3] 아직 제대로 결제가 되지 않았습니다.
							//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;

					alert(msg);
				}
			});
		});
	</script>

</body>
</html>
