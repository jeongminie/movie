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
    <style type="text/css">
    	.wrap{background-color: rgba(204,204,204,0.2); width: 100%; height: 937px; margin: auto;}
    	.header{height: 50px;}
    	.name{background-color: #503396; color: white; display: block; height: 5%; font-size: 18px; padding-top: 5px;}
        .box{border-radius: 8px; width: 100%; overflow: hidden; text-align: center; height: 750px;}
        .box img{width: 100%; height: 95%;}
        .imgbutton{width: 100px; height: 40px; opacity: 0; margin-top: 380px; border-radius: 10px; background-color: #503396; color: white; border : 0px;}
        a{position: relative; margin-bottom: -750px; width: 100%; height: 750px; display: block;}
		a:hover{background-color: rgba(255,255,255,0.5); transition: background 0.6s ease-out;}
		a:hover .imgbutton{opacity:1; transition: 1s;}     
    </style>
</head>
<body>
<!-- start -->

	<div class="wrap">
	    <!-- header -->
	    <div class="header">
	    </div>
	    <!-- contents -->
	    <div class="container">
		    <div class="row">
		    	<div class="col" style="width: 100%; height:100%; margin-left: 15px;">
		            <div class="box">
		                <a href="/">
		                	<button type="button" class="imgbutton">들어가기</button>
		                </a>
		                <img src="/resources/static/image/userpage.PNG" alt="user mainPage">
		                <div class="name">
		                	<span>유저 화면</span>
		                </div>
		            </div>
		        </div>
		        <div class="col" style="width: 100%; height: 100%; margin-right: 15px;">
		            <div class="box">
		                <a href="/code/codeList">
		                	<button type="button" class="imgbutton">들어가기</button>
		                </a>
		                <img src="/resources/static/image/adminpage.PNG" alt="user mainPage">
		                <div class="name">
		                	<span>관리자 화면</span>
		                </div>
		            </div>
		        </div>
		     </div>			 
		</div>    		
	</div>

<!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/188ea9a4c6.js" crossorigin="anonymous"></script>	
</body>
</html>