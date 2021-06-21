<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!doctype html>
<html lang="zxx">

<head>
 <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MapDa</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
<!-- nice select CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/nice-select.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/flaticon.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/slick.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/price_rangs.css">
<!-- style CSS -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/style.css">
       <style>
		    #mainLogo{width:250px; height:45px}
		    @import url(//db.onlinewebfonts.com/c/537c29c4b78689a51f1c48cd802a503f?family=ITC+Grouch);
		    @import url(//db.onlinewebfonts.com/c/789f9065baf48309d73fd0ff02fe4aec?family=Big+Caslon+Black);
		    @import url('https://fonts.googleapis.com/css2?family=Archivo:wght@100&display=swap');
		    .dropdown-item{font-family: ITC Grouch;}
		    #loginTitle{font-family: "Noto Sans KR", sans-serif; font-size:35px; text-align:center; color:gray;}
		    #loginStart{font-family: "Noto Sans KR", sans-serif;}
		    #password{font-family: 'Archivo', sans-serif; }
		    #idPlace{font-family: 'Archivo', sans-serif; }
		    #remember{font-family: adobe-caslon-pro, serif;}
		    h2, h3, h4, h5, h6, p{ffont-family: "Noto Sans KR", sans-serif; font-style: normal; font-weight: 700}
		    #joinTitle{text-align: center; font-family: ITC Grouch;}
		    input.underline { border-left-width:0; border-right-width:0; border-top-width:0; border-bottom-width:1; width:450px; } 
			#joinForm{display: inline-block; text-align: center;}
			#joinbutton{font-family: ITC Grouch; background-color: gray; align:right; border:0; outline:0; padding:10px 30px; font-size: 15px}
			#sbox{all:none;}
			#checkbutton{font-family: ITC Grouch; background-color: gray; border:0; outline:0; padding:8px 20px; font-size: 12px}
			#id{width:405px}
			#pw{width:485px}
			#pwc{width:450x}
			#name{width:485px}
			.nice-select{width:190px; height:30px; text-align-last: center; text-align: center;-ms-text-align-last: center; -moz-text-align-last: center;}
			#accountNum{width:285px}
			#con1{width:155px}
			#con2{width:155px}
			#con3{width:155px}
			
			#addr1{width:395px}
			#bb{font-family: ITC Grouch; background-color: gray; border:0; outline:0; padding:6px 17px; font-size: 15px; color:black;}
			#oti{font-family:ITC Grouch; font-size: 100px; text-align: center; color:white;}
	
	
	
	
		</style>

		</script>
		
    	 <script type="text/javascript">
    		//id 중복체크
    	 	$(function(){
    	 		$("#id").keyup(function() {
					if($(this).val()==""){
						$("#idCheck").html("");
						return;
					}
 					$.ajax({
						url:"${pageContext.request.contextPath}/member/idcheckAjax",
						dataType:"text",
						type:"post",
						data:{id:$(this).val()},
						success:function(result){$("#idCheck").text(result)},
						error:function(err){
							alert(err+"아이디 조회 에러.")
						}
					}	
					)
				})
				//비밀번호 일치 체크
				$("#pw").keyup(function() {
					if($(this).val()==""){
						$("#pwCheck").html("");
						return;
					}
					$.ajax({
						url:"member/pwCheck",
						datatype:"text",
						type:"post",
						data:{pwc:$(this).val(),pw:$("#pw").val()},
						success:function(result){$("#pwCheck").text(result)},
						error:function(err){
							alert(err+"비밀번 조회 에러.")
						}
					}	
					)
				})
    	 	})				
				
		
    	 
    	 	 
    	 </script> 
    	 
    	
    	 
    	 <script >
    	 $(document).ready(function() {
    		 
    		 
    		 $('input[type="checkbox"][name="memGrade"]').click(function(){
    		 
    		  if($(this).prop('checked')){
    		 
    		     $('input[type="checkbox"][name="memGrade"]').prop('checked',false);
    		 
    		     $(this).prop('checked',true);
    		 
    		    }
    		  
    		   });
    		  
    		 });
    	 
    	 </script>
    	 
</head>
<body>
	<br><br><br><br><br><br>

        <div style="margin:auto;text-align:center;">
        <h2>Member Register Form</h2><p>
        	<form name="joinForm" style="display:inline-block;" action="${pageContext.request.contextPath}/member/registerMember" method=post onsubmit="return validate();" accept-charset="UTF-8">
				<br><br><br>
				<input type="text" class="underline"  placeholder="ID" id="id" name="memId"><span id="idCheckAjax"></span><br><br>
				<input type="password" class="underline" placeholder="PASSWORD" id="pw" name="memPw"> <br><br>
				<input type="text" class="underline"  placeholder="NAME" id="name" name="memName"> <br><br>
				<input type="text" class="underline" placeholder="AGE" id="age" name="memAge"><br><br>
				<input type="text" class="underline"  placeholder="ADDRESS" id="addr" name="memAddr"> <br><br>
				<input type="checkbox"  id="User" name="memGrade" value="User" onclick='checkOnlyOne(this)'> <label for="User">User</label> 
				<input type="checkbox"  id="Enterprise" name="memGrade" value="Enterprise" onclick='checkOnlyOne(this)'> <label for="Enterprise">Enterprise</label> <br><br>
				<input type="text" class="underline" placeholder="ACCOUNT NUMBER" id="accountNum" name="memAccount"> <br><br>
				<input type="submit" title="Create as Account" id="joinbutton" value="Create an Account">
    		</form>	
    
    
    	</div>
    
</body>
</html>