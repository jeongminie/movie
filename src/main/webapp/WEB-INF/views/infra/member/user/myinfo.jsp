<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" href="/resources/static/css/mypage.css">
	
  	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
  	<!-- google font -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
	<title>마이페이지</title>
	
	<style>
		

	</style>
		
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/user/jsp/header_white.jsp" />
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<i class="fa-solid fa-house" onclick='location.href="/"' style="cursor:pointer"></i>
					<a href="#">마이페이지</a>
				</div>
			</div>
		</div>
		<div class="inner-wrap">
			<jsp:include page="../../../include/user/jsp/mypageAside.jsp" />
			<div id="contents" class="">
				<h2 class="tit">회원정보</h2>
				<div class="member-wrap">
					<strong>회원님의 개인정보 보호를 위해 등록된 휴대폰 번호로 인증을 하셔야 합니다.</strong>
						<div class="table-wrap">
							<table class="board-form">
								<caption>아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표<!--아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표--></caption>
								<colgroup>
									<col style="width:130px;">
									<col>
								</colgroup>
								<tbody>
									<!--<input id="ibxSchPwdLoginId" type="hidden" value="wjdals6861">아이디-->
									<!--<input id="ibxSchPwdMbNm" type="hidden" value="윤정민">이름-->
									<tr>
										<th scope="row"><label for="ibxSchPwdMblpTelno">휴대폰 번호<!--휴대폰 번호--></label></th>
										<td>
											<input type="hidden" id="ibxSchPwdMblpTelno" value="${sessPhone }">
											<c:set var="phone" value="${sessPhone }" />
											<input type="text" value="${fn:substring(phone, 0, 3)}-****-${fn:substring(phone, 7, 12)}" placeholder="'-' 없이 입력" class="input-text w230px" disabled>
											<button id="btnSchPwdMbCertNoSend" type="button" class="button gray w75px ml08">인증요청<!--인증요청--></button>
										</td>
									</tr>
									<tr id="schPwdMblpCertRow">
										<th scope="row"><label for="ibxSchPwdMblpCharCertNo">인증번호<!--인증번호--></label></th>
										<td>
											<div class="chk-num">
												<div class="line">
													<input maxlength="4" type="text" id="ibxSchPwdMblpCharCertNo" class="input-text w180px" title="인증번호 입력"><!--인증번호 입력-->
													<div class="time-limit" id="schPwdtimer">
														03:00
													</div>
												</div>
											</div>
											<button id="btnSchPwdMblpCharCert" type="button" class="button gray-line w75px ml08 disabled" disabled="disabled">인증확인<!--인증확인--></button>
											<!-- <div id="schPwdMblpNo-error-text" class="alert"></div> -->
										</td>
									</tr>
								</tbody>
							</table>
						</div>
				</div>
				<div class="btn-group">
					<button class="button large" id="cancelBtn" title="취소">취소
					</button><button class="button large purple" id="ckBtn" onclick="location.href='/mypage/userinfo'" title="확인" disabled="">확인
				</button></div>
			</div>
		</div> <!-- innerwrap -->
	</div>
		
		
		
	<script>
		function setEmptyImage(img) {
			img.src='/resources/static/image/noImg2.png';
			$(img).addClass('noImg');
		}
		
		function readURL(input) {
			var file = input.files[0];
			
			if(file.type.startsWith("image")) {
				var reader = new FileReader();

				reader.onload = function (e) {
					$("img").attr("src", e.target.result); 
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				alert("이미지 파일만 가능합니다.")
			}
		}
		
		var timer = null;
		var isRunning = false;
		
		//타이머
		function startTimer(count, display) {
			var minutes, seconds;
			
			timer = setInterval(function () {
				minutes = parseInt(count / 60, 10);
				seconds = parseInt(count % 60, 10);
				
				minutes = minutes < 10 ? "0" + minutes : minutes;
				seconds = seconds < 10 ? "0" + seconds : seconds;
				
				display.html(minutes + ":" + seconds);
				
				// 타이머 끝
				if (--count < 0) {
					clearInterval(timer);
					display.html("03:00");
					$("#btnSchPwdMblpCharCert").attr("disabled", true);
					isRunning = false;
				}
			}, 1000);
			
			isRunning = true;
		}
		
		$(document).ready(function(){
				 
			$("#profileUploaded").change(function(e){
				readURL(this);
			});
				
			$(".fa-circle-plus").on("click", function(){
				$("#profileUploaded").click();
			});
			
			$("#profileUploaded").on("change", function(e){
				console.log($("#profileUploaded")[0].files[0])
			
				/* $("#form").submit(); */
				
 				var formData = new FormData();
				formData.append("profileUploaded", $("#profileUploaded")[0].files[0]);
				
				$.ajax({
					type : "POST",
					enctype:"mutipart/form-data",
					url:"profileUploaded",
					processData: false,
					contentType: false,
					data: formData,
					dataType: "json",
				});
				
				alert("프로필 사진이 등록되었습니다.")
			})
			
		})
		
		$("#ibxSchPwdMblpCharCertNo").keyup(function(){
			var inputLength = $(this).val().length;
			
			if(inputLength >= 4){
				$("#btnSchPwdMblpCharCert").removeClass("disabled");
				$("#btnSchPwdMblpCharCert").removeAttr("disabled");
			} else {
				$("#btnSchPwdMblpCharCert").addClass("disabled");
				$("#btnSchPwdMblpCharCert").attr("disabled", "disabled");
			}
		})

		$("#btnSchPwdMbCertNoSend").on("click", function(){
			alert("인증번호를 전송하였습니다. 시간초과시 재전송을 눌러주세요.");
			$("#btnSchPwdMbCertNoSend").html("재전송");
			
			var display = $("#schPwdtimer");
			// 유효시간 설정
			var leftSec = 180;
			  
			// 버튼 클릭 시 시간 연장
			if (isRunning){
				clearInterval(timer);
				display.html("");
				startTimer(leftSec, display);
			}else{
				startTimer(leftSec, display);
			}
			  
			var phone = $("#ibxSchPwdMblpTelno").val();
			
			$.ajax({
				type : "post",
				url : "/check/sendSMS",
				data : {"phone":phone},
				success : function(response){
					$("#btnSchPwdMblpCharCert").on("click", function(){
						if(response.trim() == $("#ibxSchPwdMblpCharCertNo").val()) {
							alert("인증이 완료되었습니다.");
							$("#schPwdMblpCertRow").remove();
							$("#btnSchPwdMbCertNoSend").attr("disabled", true);
							
							$("#ckBtn").removeAttr("disabled");
							
						} else {
							alert("인증번호를 다시 입력해주세요.");
						}
						
					})
				}
			})
			
		});
	
	</script>
	
	
</body>
</html>