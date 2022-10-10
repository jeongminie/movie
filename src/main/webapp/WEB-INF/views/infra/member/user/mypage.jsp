<!-- jsoup -->
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script type="text/javascript" src="/resources/static/js/header.js"></script>
	<link rel="stylesheet" href="/resources/static/css/style.css">
	
  	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
  	<!-- google font -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
	<title>마이페이지</title>
	<style>
	.profile-img {
		width:100px;
		height:100px;
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
		overflow:hidden;
		border-radius: 50%;
		position: relative;
	}
	
	#imageSection {
		position: absolute; top:0; left: 0;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.profileWrap {
		width: 500px;
		height: 500px;
		margin: auto;
	}	
	
	#preview,#saveBtn {
		margin: auto;
	}
	</style>	
		
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/jsp/header_white.jsp" />
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<i class="fa-solid fa-house" onclick='location.href="/"' style="cursor:pointer"></i>
					<a href="#">마이페이지</a>
				</div>
			</div>
		</div>
<!-- 		<form method="post" id="profileUploaded" action="profileUploaded" enctype="multipart/form-data"> -->
			<input type="file" id="fileInput" name="fileInput" class="col-10 mb-2 d-none" accept="image/*">
			<div id="preview" class="profile-img border" style="cursor:pointer;">
			   <img id="imageSection" src="#" class="w-100 d-none"/>
			</div>
			<button type="button" id="saveBtn" class="btn saveBtn d-flex justfy-content-center">저장</button>
		<!-- </form> -->
	</div> 
	
	<script>
		function readURL(input) {
			var file = input.files[0];
			console.log(file)
			
			if(file.type.startsWith("image")) {
				var reader = new FileReader();
				console.log($("#fileInput")[0].files[0])

				reader.onload = function (e) {
					$("#imageSection").attr("src", e.target.result); 
					$("#imageSection").removeClass("d-none")
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				alert("이미지 파일만 가능합니다.")
			}
		}
		
		$(document).ready(function(){
				 
			$("#fileInput").change(function(e){
				$("#image_section").removeClass("d-none");
				readURL(this);
			});
				
			$("#preview").on("click", function(){
				$("#fileInput").click();
			});
			
			$("#saveBtn").on("click", function(){
				var formData = new FormData();
				formData.append("fileInput", $("#fileInput")[0].files);
				
				$.ajax({
					enctype:"mutipart/form-data",
					type:"POST",
					url:"/member/profileUploaded",
					processData: false,
					contentType: false,
					data: formData,
					dataType : 'json',
					success:function(data){
						if(data.result == "success") {
							alert("등록되었습니다");
						} else {
							alert("실패");
						}
					},
					error:function(e){
						alert("에러");
					}
				});
			})
			
		})
	
	</script>
	
	
</body>
</html>