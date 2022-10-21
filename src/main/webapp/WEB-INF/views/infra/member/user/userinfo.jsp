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
	<h2 class="tit">개인정보 수정</h2>
	<ul class="dot-list mb10">
	    <li>회원님의 정보를 정확히 입력해주세요.</li>
	</ul>
	<div class="table-wrap">
		<table class="board-form">
			<caption>프로필사진, 아이디 항목을 가진 표</caption>
			<colgroup>
				<col style="width:180px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">프로필 사진</th>
					<td>
						<div class="profile-photo">
							<form name="fileForm">
								<input type="file" id="profileTarget" name="file" style="display: none;">
							</form>
							<div class="profile-img">
								<img src="../../../static/pc/images/mypage/bg-profile.png" alt="프로필 사진 샘플">
							</div>
							<button type="button" class="button small gray-line" id="addProfileImgBtn">이미지 등록</button>
							<a href="/mypage/goodbye-megabox" class="button small member-out" title="회원탈퇴">회원탈퇴</a>
						</div>
						<!-- <p style="font-size:0.8em; color:#999; margin-top:10px; padding:0; text-align:left; position:absolute; top:22px; left:194px;">
			            	※ 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</p> -->
					</td>
				</tr>
				<tr>
					<th scope="row">아이디</th>
					<td>wjdals6861</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="tit-util mt40 mb10">
		<h3 class="tit">기본정보</h3>
		<div class="right">
			<p class="reset"><em class="font-orange">*</em> 필수</p>
		</div>
	</div>
	
	
	
<form name="mbInfoForm">
<input type="hidden" name="mbNo" value="12089821">
<input type="hidden" name="phoneNo" value="010-2511-6861">
<input type="hidden" name="zipcd" value="">
<input type="hidden" name="mbAddr" value="">
<input type="hidden" name="mbProfilFileNo" value="">
<input type="hidden" id="mbByymmdd" value="19971007">

<div class="table-wrap mb40">
<table class="board-form">
<caption>이름, 생년월일, 휴대폰, 이메일, 비밀번호, 주소 항목을 가진 기본정보 표</caption>
<colgroup>
<col style="width:180px;">
<col>
</colgroup>
<tbody>
<tr>
<th scope="row">
이름 <em class="font-orange">*</em>
</th>
<td>
<span class="mbNmClass">윤정민</span>
<a href="#layer_name" class="button small gray-line ml10 mr10 btn-modal-open" w-data="600" h-data="350" title="이름변경">이름변경</a>
</td>
</tr>
<tr>
<th scope="row">
생년월일 <em class="font-orange">*</em>
</th>
<td>
1997년
10월
07일
</td>
</tr>
<tr>
<th scope="row">
<label for="num">휴대폰</label> <em class="font-orange">*</em>
</th>
<td>
<div class="clearfix">
<p class="reset float-l w170px lh32 changeVal" data-name="phoneNo">
010-2511-6861
</p>
<div class="float-l">
<button type="button" class="button small gray-line change-phone-num" id="phoneChgBtn" title="휴대폰번호 변경">휴대폰번호 변경</button>
</div>
</div>

<div class="change-phone-num-area">
<div class="position">
<label for="chPhone" class="label">변경할 휴대폰</label>
<input type="text" id="chPhone" class="input-text w160px numType" placeholder="'-'없이 입력해 주세요" title="변경할 휴대폰 번호 입력" maxlength="11">
<button type="button" class="button small gray-line" id="sendNumberBtn">인증번호 전송</button>
</div>

<div class="position" style="display: none;">
<label for="chkNum" class="label">인증번호 입력</label>

<div class="chk-num small">
<div class="line">
<input type="text" id="chkNum" class="input-text w180px" title="인증번호 입력" placeholder="인증번호를 입력해 주세요" maxlength="4">

<div class="time-limit" id="timeLimit">3:00</div>
</div>
</div>
<button type="button" class="button small gray-line" id="chgBtn">변경완료</button>
</div>
</div>
</td>
</tr>
<tr>
<th scope="row">
<label for="email">이메일</label> <em class="font-orange">*</em>
</th>
<td>
<input type="text" id="email" name="mbEmail" class="input-text w500px" value="jeongminiee@naver.com">
</td>
</tr>
<tr>
<th scope="row">비밀번호 <em class="font-orange">*</em></th>
<td>
<a href="/on/oh/ohh/Mypage/userPwdChangePage.do" class="button small gray-line" title="비밀번호 변경">비밀번호 변경</a>
</td>
</tr>
<tr>
<th scope="row">주소</th>
<td>
<span></span>
<a href="#none" id="addrBtn" class="button small gray-line ml10" title="우편번호 검색">우편번호 검색</a>
<p class="reset mt10"></p>
</td>
</tr>
</tbody>
</table>
</div>
</form>



	<div class="btn-group mt40">
	    <button class="button large" id="cancelBtn">취소</button>
	    <button class="button purple large" id="updateBtn">등록</button>
	</div>
    </div>
    
		</div> <!-- innerwrap -->
		
		
		
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
	
	</script>
	
	
</body>
</html>