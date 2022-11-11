<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>firstPage</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="fontawesome-free-5.15.1-web/css/fontawesome.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>	
    
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
	  display: flex;
	  justify-content : center;
	  flex-direction: row;
	  align-items: center;
	  padding: 30px;
	  width : 50%;
	  margin: auto;
	}
	
	div.container div.myform{
	  height : 300px;
	  width: 270px;
	  margin-right: 60px;
	  background-color: white;
	  box-shadow: 0 50px 50px -50px darkslategray;
	  padding: 30px;
	  cursor: pointer;
	}
	
	div.container div.myform h2{
	  color: #1c1c1e;
	  margin-bottom: 40px;
	  text-align: center;
	}
	
	i{
	  font-size : 150px;
	}
	
	.myform {
	  transition: all 0.2s linear;
	  overflow: hidden;
	}
	
	.myform:hover {
	  transform: scale(1.1);
	}
    </style>
</head>
<body>
	<div class="container">
	  <div class="myform" onclick="location.href='/admin/login'">
	      <h2>ADMIN</h2>
	      <i class="fa-solid fa-screwdriver-wrench" style="margin-left : 30px;"></i>
	  </div>
	  <div class="myform" onclick="location.href='/'">
	      <h2>USER</h2>
	      <i class="fa-solid fa-users-between-lines" style="margin-left : 15px;"></i>
	  </div>
	</div>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/188ea9a4c6.js" crossorigin="anonymous"></script>	
</body>
</html>