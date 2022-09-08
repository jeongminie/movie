<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
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
  		
  		.id-check {
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
  		
  		.signup-btn {
  			border : 1px solid #BEB4AF;
  			width : 200px;
  			color : white;
  			background-color : #BEB4AF;
  			border : 0px;
  		}
  		
  		.signup-btn:hover {
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
			<form method="post" action="memberInst">
				<section class="d-flex justify-content-center input-box">
					<table class="table">
						<caption>회원정보를 입력해주세요.</caption>
						<tr>
							<th class="col-5">이름</th>
							<td><input type="text" class="text-input" name="name"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" class="text-input" placeholder="YYYYMMDD" name="birth"></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="text" class="text-input" name="phone"></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
								<div class="d-flex">
									<input type="text" class="text-input mr-2" name="loginId">
									<button type="button" class="btn btn-sm id-check">중복확인</button>
								</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" class="text-input" name="password"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" class="text-input"></td>
						</tr>
						<tr>
							<th>이메일 주소</th>
							<td>
								<div class="d-flex">
									<input type="text" class="text-input col-5" name="email">
									<span style="margin : 0 4px 0 4px;">@</span>
										<select class="text-input col-5" name="domain">
											<c:forEach items="${code }" var="code" varStatus="status">
												<option value="${code.seq }">${code.ccNameEng }</option>
											</c:forEach>
										</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>마케팅 활용을 위한 개인정보 수집 이용 안내(선택)</th>
							<td>
								<label class="mr-2">동의<input type="radio" class="ml-1" name="agreement"></label>
								<label>비동의<input type="radio" class="ml-1" name="agreement"></label>
							</td>
						</tr>
					</table>
				</section>
				<section class="d-flex justify-content-center">
					<button type="submit" class="btn signup-btn">회원가입</button>
				</section>
			</form>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
		});
	</script>
</body>
</html>