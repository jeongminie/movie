<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.jeongmini.movie.modules.code.CodeServiceImpl"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<link rel="stylesheet" href="/resources/static/css/style.css">
  	
  	<!-- google font -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
	<title>회원가입</title>
	
	<style>
		body {
			background-color: #F5F5F5;
		}
		
  		.table {
  			width : 501px;
  		}
  		
  		.table th {
  			background-color: #F7F8F9;
  			text-align: center;
  		}
  		
  		#idCheck {
  			display:block;
  			border : 1px solid #DADADA;
  			height: 26px;
  		}
  		
  		caption {
  			caption-side: top
  		}
  		
  		label {
  			padding: inherit;
  		}
  		
  		.signupBtn {
  			border : 1px solid #BEB4AF;
  			width : 200px;
  			color : white;
  			background-color : #BEB4AF;
  			border : 0px;
  		}
  		
  		.signupBtn:hover {
			color : white;
  			background-color : #BEB4AF;
  			border : 0px;
  		}
	  			
	</style>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<section class="d-flex justify-content-center step-box">
				<ul>
					<li class="step mr-4">STEP1. 본인인증</li>
					<li class="step mr-4">STEP2. 약관동의</li>
					<li class="step on mr-4">STEP3. 정보입력</li>
					<li class="step">STEP4. 가입완료</li>
				</ul>
			</section>
			<form method="post" action="memberInst" id="signupForm">
				<section class="d-flex justify-content-center input-box">
					<table class="table">
						<caption>회원정보를 입력해주세요.</caption>
						<tr>
							<th class="col-5">이름</th>
							<td><input type="text" class="text-input" name="name" id="name" autocomplete="off"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" class="text-input" name="birth" id="birth" autocomplete="off" placeholder="YYYYMMDD"></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="text" class="text-input"name="phone" id="phone" autocomplete="off"></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
								<div class="d-flex">
									<input type="text" class="text-input mr-2" name="loginId" id="loginId" autocomplete="off">
									<button type="button" id="idCheck" class="btn btn-sm">중복확인</button>
								</div>
								<small class="text-danger d-none idFail">중복된 아이디 입니다.</small>
								<small class="text-success d-none idSuccess">사용가능한 아이디 입니다.</small>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" class="text-input" name="password" id="password"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" class="text-input" id="passwordRe"><br>
								<small class="text-danger d-none pwFail">비밀번호가 일치하지 않습니다.</small>
							</td>
							
						</tr>
						<tr>
							<c:set var="listCodeEmail" value="${CodeServiceImpl.selectListCachedCode('1001')}"/>
							<th>이메일 주소</th>
							<td>
								<div class="d-flex">
									<input type="text" class="text-input col-5" name="email" id="email" autocomplete="off">
									<span style="margin : 0 4px 0 4px;">@</span>
										<select class="text-input col-5" name="domain" id="domain">
											<option value="0">선택</option>
											<c:forEach items="${listCodeEmail}" var="listEmail" varStatus="statusEmail">
												<option value="${listEmail.seq }"><c:out value="${listEmail.ccNameEng }"></c:out></option>
											</c:forEach>
										</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>마케팅 활용을 위한 개인정보 수집 이용 안내(선택)</th>
							<td>
								<label class="mr-2">동의<input type="radio" class="ml-1" name="marketingAgree" value="1"></label>
								<label>비동의<input type="radio" class="ml-1" name="marketingAgree" value="0"></label>
							</td>
						</tr>
					</table>
				</section>
				<section class="d-flex justify-content-center">
					<button type="button" class="btn signupBtn">회원가입</button>
				</section>
			</form>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			//체크안함 
			var isIdCheck = false;
			//중복
			var isIdDuplicate = true;

			$(".signupBtn").click(function(e){
				e.preventDefault();
				
				var name = $("#name").val().trim();
				var birth = $("#birth").val().trim();
				var phone = $("#phone").val().trim();
				var loginId = $("#loginId").val().trim();
				var password = $("#password").val().trim();
				var passwordRe = $("#passwordRe").val().trim();
				var email = $("#email").val().trim();
				var domain = $("#domain").val().trim();
				
				if(name == null || name == "") {
					alert("이름을 입력하세요");
					$("#name").focus();
					
					return false;
				}
				
				if(birth == null || birth == "") {
					alert("생년월일을 입력하세요");
					$("#birth").focus();
					
					return false;
				}
				
				if(phone == null || phone == "") {
					alert("휴대폰 번호를 입력하세요");
					$("#phone").focus();
					
					return false;
				}
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요");
					$("#loginId").focus();
					
					return false;
				}
				
				if(isIdCheck == false) {
					alert("아이디 중복체크를 해주세요.");
					return;
				}
				
				if(isIdDuplicate == true) {
					alert("아이디가 중복되었습니다.");
					return;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력하세요");
					$("#password").focus();
					
					return false;
				}
				
				if(password != passwordRe) {
					$(".pwFail").removeClass("d-none");
					
					return false;
				} 
				
				if(email == null || email == "" || domain == 0) {
					alert("이메일을 입력하세요");
					$("#email").focus();
					
					return false;
				}
				
				$("#signupForm").submit();
				
			})
			
			$("#idCheck").on("click", function(){
				var loginId = $("#loginId").val().trim();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요");
					$("#loginId").focus();
					
					return false;
				}
				
				$.ajax({
					type:"get"
					, url:"idCheck"
					, data:{"loginId":loginId}
					, success:function(data) {
						isIdCheck = true;
						
						if(data.duplication) {
							isIdDuplicate = true;
							$(".idFail").removeClass("d-none");
							$(".idSuccess").addClass("d-none");
						} else {
							isIdDuplicate = false;
							$(".idSuccess").removeClass("d-none");
							$(".idFail").addClass("d-none");
						}
					}
					, error:function(e){
						alert("에러")
					}
				})
				
			})
		})
	</script>
</body>
</html>