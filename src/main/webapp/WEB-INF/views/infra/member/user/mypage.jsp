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
	
	.inner-wrap {
		width: 1100px;
    	margin: 0 auto;
    	
	}
	
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
	
	.lnb-area {
	    float: left;
	    width: 200px;
	    padding: 40px 0 0 0;
	    background-color: #fff;
	}
	
	#lnb {
	    margin: 0;
	    padding: 0;
	}
	
	#lnb .tit {
	    overflow: hidden;
	    margin: 0;
	    padding: 0;
	    border-radius: 10px 10px 0 0;
	    background: url(https://img.megabox.co.kr/static/pc/images/common/bg/bg-lnb-tit.png) 0 0;
	}
	
	#lnb .tit a {
	    display: block;
	    width: 100%;
	    font-size: 1.2em;
	    line-height: 90px;
	    text-align: center;
	    color: #fff;
	    text-decoration: none;
	}
	
	#lnb>ul {
	    border: 1px solid #d8d9db;
	    border-left-width: 2px;
	    border-right-width: 2px;
	    border-bottom-width: 2px;
	    border-radius: 0 0 10px 10px;
	}
	
	#lnb>ul>li {
	    border-top: 1px solid #d8d9db;
	}

	#lnb>ul>li>a {
	    display: block;
	    color: #222;
	    padding: 10px 15px;
	    font-weight: 400;
	    background-color: #f2f4f5;
	}
	
	#lnb .depth3 {
	    padding: 20px 0;
	}

	#lnb .depth3>li>a {
	    position: relative;
	    padding: 2px 0 2px 24px;
	    color: #666;
	}
	
	#contents {
	    margin: 0;
	    padding: 40px 0 0 0;
	    float: right;
	    width: calc(100% - 260px);
	}
	
	.my-magabox-info {
	    overflow: hidden;
	    height: 367px;
	    border-radius: 10px;
	    background-color: #f3f4f6;
	    margin-left: 50px;
	}
	
	.my-magabox-info .top {
	    position: relative;
	    height: 198px;
	    padding: 30px 30px 0 0;
	}


.my-magabox-info .top .photo {
    float: left;
    width: 200px;
    padding: 20px 0 0 60px;
}

.my-magabox-info .top .photo .wrap {
    position: relative;
    width: 93px;
    margin: 0;
    padding: 0 0 7px 0;
    background: url(https://img.megabox.co.kr/static/pc/images/mypage/bg-photo-back.png) no-repeat center bottom;
}

.my-magabox-info .top .photo .wrap i {
    overflow: hidden;
    display: block;
    position: absolute;
    right: 0;
    top: 10px;
    margin: 0;
    border-radius: 19px;
    box-shadow: -2px 2px 5px 0 rgb(45 45 45 / 30%);
}

.my-magabox-info .top .photo .wrap .img {
    overflow: hidden;
    display: block;
    width: 93px;
    height: 93px;
    border-radius: 93px;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 0;
    line-height: 0;
    background-color: transparent;
    box-shadow: 0 5px 5px 0 rgb(45 45 45 / 20%);
}

.my-magabox-info .top .photo .wrap .img img {
    width: 100%;
    height: 100%;
    border-radius: 93px;
}

.my-magabox-info .top .grade {
    float: left;
    padding-top: 20px;
}

.my-magabox-info .top .grade .name {
    font-size: 1.8666em;
    line-height: 1.3;
    color: #222;
}

.my-magabox-info .top .grade .link {
    padding: 15px 0 0 0;
}

.my-magabox-info .top .grade .link a {
    margin-right: 10px;
    color: #666;
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
		<div class="inner-wrap">
			<div class="lnb-area">
				<nav id="lnb">
					<p class="tit"><a href="/mypage" title="나의 메가박스">나의 메가박스</a></p>
					<ul>
						<li><a href="/mypage/moviestory" titel="나의 무비스토리">나의 무비스토리</a></li>
						<li>
							<a href="/mypage/myinfo?returnURL=info" title="회원정보">회원정보</a>
							<ul class="depth3">
								<li class="on"><a href="/mypage/myinfo?returnURL=info" title="개인정보 수정">개인정보 수정</a></li>
								<li><a href="/mypage/additionalinfo" title="선택정보 수정">선택정보 수정</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
			<div id="contents">
				<div class="my-magabox-info ">
					<!-- top -->
					<div class="top">
						<div class="photo" id="myPhoto">
							<div class="wrap">
								<form method="post" id="form" action="profileUploaded" enctype="multipart/form-data">
									<input type="file" id="profileUploaded" name="profileUploaded" class="d-none">
									<input type="hidden" name="fileMbNo" value="12089821">
								</form>
		
								<i class="fa-solid fa-circle-plus"></i>
		
								<button type="button" class="img">
									<img src="https://img.megabox.co.kr/SharedImg/2022/10/07/l9vVLIk4eQ4vsPMsTYyCpzKM81rvmcSO_640.png" alt="윤정민" onerror="noImg(this, 'human')">
								</button>
							</div>
						</div>
		
						<div class="grade">
							<p class="name">윤정민님은<br>일반등급입니다.</p>
		
							<div class="link">
								<a href="/mypage/myinfo?returnURL=info" title="개인정보수정 페이지로 이동">개인정보수정 <i class="iconset ico-arr-right-reverse"></i></a>
								<a href="#layer_before_grade" id="bfrClassSearch" class="btn-modal-open" w-data="400" h-data="400" title="지난등급 상세보기">
									지난등급조회 <i class="iconset ico-arr-right-reverse"></i>
								</a>
							</div>
						</div>
					</div>
					<!--// top -->
				</div>
			</div>
		</div>
 		<!-- <form method="post" id="form" action="profileUploaded" enctype="multipart/form-data">
			<input type="file" id="profileUploaded" name="profileUploaded" class="col-10 mb-2 d-none" accept="image/*">
			<div id="preview" class="profile-img border" style="cursor:pointer;">
			   <img id="imageSection" src="#" class="w-100 d-none"/>
			</div>
			<button type="button" id="saveBtn" class="btn saveBtn d-flex justfy-content-center">저장</button>
		</form> -->
	</div> 
	
	<script>
		function readURL(input) {
			var file = input.files[0];
			console.log(file)
			
			if(file.type.startsWith("image")) {
				var reader = new FileReader();
				console.log($("#profileUploaded")[0].files[0])

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
				 
			$("#profileUploaded").change(function(e){
				$("#imageSection").removeClass("d-none");
				readURL(this);
			});
				
			$("#preview").on("click", function(){
				$("#profileUploaded").click();
			});
			
			$("#saveBtn").on("click", function(e){
				console.log($("#profileUploaded")[0].files[0])
			
				$("#form").submit();
				
/* 				var formData = new FormData();
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
				}); */
			})
			
		})
	
	</script>
	
	
</body>
</html>