<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/static/css/style.css">
  	
  	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	
  	<!-- google font -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
	<title>회원가입 완료</title>
	
	<style>
		body {
			background-color: #F5F5F5;
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
					<li class="step mr-4">STEP3. 정보입력</li>
					<li class="step on">STEP4. 가입완료</li>
				</ul>
			</section>
			<section class="text-center">
				<p class="mt-5">회원가입을 환영합니다.<br>
				이제부터 다양한 혜택과 서비스를 이용하실 수 있습니다.</p>
				<button type="button" class="btn home-btn mt-5">메인으로</button>
				<button type="button" class="btn login-btn mt-5" data-bs-toggle="modal" data-bs-target="#loginModal">로그인 하기</button>
			</section>
		</div>
	</div>

	<jsp:include page="../../../include/user/jsp/loginModal.jsp" />
	
	<script>
		$(document).ready(function(){
			$(".home-btn").on("click", function(){
				location.href= "/"
			});
		});
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>