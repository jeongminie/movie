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
	
	<title>로그인</title>
	
	<style>
	*{
	  padding: 0;
	  margin: 0;
	  box-sizing: border-box;
	  font-family: poppins;
	}
	
	body{
	  background-color: #E8EDF2;
	}
	
	div.container{
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%,-50%);
	  width : 35%;
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	
	  background-color: white;
	  padding: 30px;
	  box-shadow: 0 50px 50px -50px darkslategray;
	}
	
	div.container div.myform{
	  width: 270px;
	  margin-right: 30px;
	}
	
	div.container div.myform h2{
	  color: #1c1c1e;
	  margin-bottom: 20px;
	}
	
	div.container div.myform input{
	  border: none;
	  outline: none;
	  border-radius: 0;
	  width: 100%;
	  border-bottom: 2px solid #1c1c1e;
	  margin-bottom: 25px;
	  padding: 7px 0;
	  font-size: 14px;
	}
	div.container div.myform button{
	  color: white;
	  background-color: #1c1c1e;
	  border: none;
	  outline: none;
	  border-radius: 2px;
	  font-size: 14px;
	  padding: 5px 12px;
	  font-weight: 500;
	}
	div.container div.image img{
	  width: 300px;
	}
	</style>
	
</head>
<body>
	<div class="container">
	  <div class="myform">
	    <form method="post" action="../admin/loginProc" id="login">
	      <h2>ADMIN LOGIN</h2>
	      <input type="text" id="loginId" name="loginId" placeholder="Admin Name" value="admin">
	      <input type="password" id="password" name="password" placeholder="Password" value="admin">
	      <button type="button" id="loginBtn">LOGIN</button>
	    </form>
	  </div>
	  <div class="image">
	    <img src="/resources/static/image/admin_login.jpg">
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
