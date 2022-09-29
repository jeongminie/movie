<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.jeongmini.movie.modules.code.CodeServiceImpl"/>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/static/css/xdmin/style.css">
	
	<title>로그인</title>
	
	<style>
	.login-box {
		background-color: white;
		border: 1px solid #dee2e6;
		box-shadow: 2px 2px 1px #e8eaeb;
		padding: 30px;
		margin: auto;
		margin-top: 50px;
		width : 400px;
	}
	
	.login-btn {
		border : 1px solid #DADADA;
		width : 200px;
		background-color : #e8eaeb;
		border : 0px;
		border-radius: .375rem;
	}
	
	.login-btn:hover {
		background-color : #e8eaeb;
		border : 0px;
	}
	
	</style>
	
</head>
<body>
	<div id="wrap">
		<div class="login-box">
			<form method="post" action="../admin/loginProc" id="login">
				<h4 style="text-align: center; margin-bottom: 10px;">로그인</h4>
				<input type="text" id="loginId" name="loginId" class="form-control mb-2" placeholder="아이디">
				<input type="password" id="password" name="password" class="form-control mb-3" placeholder="비밀번호">
				<button type="button" id="loginBtn" class="btn login-btn w-100 mb-3">로그인</button>
			</form>
		</div>
	</div>

	<script>
		$(document).ready(function(){
			$("#loginBtn").on("click", function(){
				var loginId = $("#loginId").val();
				var password = $("#password").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력해주세요");
					
					return;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력해주세요");
					
					return;
				}
				
				$("#login").submit();
			})
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
