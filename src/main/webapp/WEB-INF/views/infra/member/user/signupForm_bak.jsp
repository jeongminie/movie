<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.jeongmini.movie.modules.code.CodeServiceImpl"/>
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
  	
  	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
  	
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
  		
  		#idCheck, #reset {
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
  		
  		.signupBtn {
  			border : 1px solid #BEB4AF;
  			width : 200px;
  			color : white;
  			background-color : #BEB4AF;
  			border : 0px;
  		}
  		
  		.signupBtn:hover {
			color : white;
  			background-color : #BEB4AF;
  			border : 0px;
  		}
  		
  		#detailAddress {
  			padding: 0px;
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
			<form method="post" action="memberInst" id="signupForm" autocomplete="off">
				<section class="d-flex justify-content-center input-box">
					<table class="table">
						<caption>회원정보를 입력해주세요.</caption>
						<tr>
							<th class="col-5">이름</th>
							<td><input type="text" class="text-input" name="name" id="name" autocomplete="off"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="text" class="text-input" name="birth" id="birth" placeholder="YYYYMMDD"></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="text" class="text-input"name="phone" id="phone"></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
								<div class="d-flex">
									<input type="text" class="text-input mr-2" name="loginId" id="loginId">
									<button type="button" id="idCheck" class="btn btn-sm">중복확인</button>
								</div>
								<small class="text-danger d-none idFail">중복된 아이디 입니다.</small>
								<small class="text-success d-none idSuccess">사용가능한 아이디 입니다.</small>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" class="text-input" name="password" id="password"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" class="text-input" id="passwordRe"><br>
								<small class="text-danger d-none pwFail">비밀번호가 일치하지 않습니다.</small>
							</td>
						</tr>
						<tr>
							<c:set var="listCodeEmail" value="${CodeServiceImpl.selectListCachedCode('1001')}"/>
							<th>이메일 주소</th>
							<td>
								<div class="d-flex">
									<input type="text" class="text-input col-5" name="email" id="email">
									<span style="margin : 0 4px 0 4px;">@</span>
									<select class="text-input col-5" name="domain" id="domain">
										<option value="0">선택</option>
										<c:forEach items="${listCodeEmail}" var="listEmail" varStatus="statusEmail">
											<option value="${listEmail.seq }"><c:out value="${listEmail.ccNameEng }"></c:out></option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td id="addressWrap">
								<div class="d-flex">
									<input type="text" class="text-input mb-2 mr-2" name="postcode" id="postcode" placeholder="우편번호" onclick="execDaumPostcode()">
									<button type="button" id="reset" class="btn btn-sm"><i class="fa-solid fa-trash"></i></button>
								</div>
								<input type="text" class="text-input mb-2" name="address" id="address" placeholder="주소">
								<div class="d-flex">
									<input type="text" class="text-input col-7 mr-2" name="detailAddress" id="detailAddress" placeholder="상세주소">
									<input type="text" class="text-input col-5" name="extraAddress" id="extraAddress" placeholder="참고항목">
								</div>
							</td>
						</tr>
						<tr>
							<th>마케팅 활용을 위한 개인정보 수집 이용 안내(선택)</th>
							<td>
								<label class="mr-2">동의<input type="radio" class="ml-1" name="marketingAgree" value="1"></label>
								<label>비동의<input type="radio" class="ml-1" name="marketingAgree" value="0"></label>
							</td>
						</tr>
					</table>
				</section>
				<section class="d-flex justify-content-center">
					<button type="button" class="btn signupBtn">회원가입</button>
				</section>
			</form>
		</div>
	</div>
		
	<!-- 카카오 주소 api -->
	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	    }
	    
	    $(document).ready(function(){
	    	$("#reset").on("click", function(){
	    		var input = $("#addressWrap").find('input[type=text]')
			    input.val('');
	    	})
	    })
	</script>
	
	
	<script>
		$(document).ready(function(){
			//체크안함 
			var isIdCheck = false;
			//중복
			var isIdDuplicate = true;

			$(".signupBtn").click(function(e){
				e.preventDefault();
				
				var name = $("#name").val().trim();
				var birth = $("#birth").val().trim();
				var phone = $("#phone").val().trim();
				var loginId = $("#loginId").val().trim();
				var password = $("#password").val().trim();
				var passwordRe = $("#passwordRe").val().trim();
				var email = $("#email").val().trim();
				var domain = $("#domain").val().trim();
				
				var postcode = $("#postcode").val().trim();
				var address = $("#address").val().trim();
				var detailAddress = $("#detailAddress").val().trim();
				
				if(name == null || name == "") {
					alert("이름을 입력하세요");
					$("#name").focus();
					
					return false;
				}
				
				if(birth == null || birth == "") {
					alert("생년월일을 입력하세요");
					$("#birth").focus();
					
					return false;
				}
				
				if(phone == null || phone == "") {
					alert("휴대폰 번호를 입력하세요");
					$("#phone").focus();
					
					return false;
				}
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요");
					$("#loginId").focus();
					
					return false;
				}
				
				if(isIdCheck == false) {
					alert("아이디 중복체크를 해주세요.");
					return;
				}
				
				if(isIdDuplicate == true) {
					alert("아이디가 중복되었습니다.");
					return;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력하세요");
					$("#password").focus();
					
					return false;
				}
				
				if(password != passwordRe) {
					$(".pwFail").removeClass("d-none");
					
					return false;
				} 
				
				if(email == null || email == "" || domain == 0) {
					alert("이메일을 입력하세요");
					$("#email").focus();
					
					return false;
				}
				
				if(postcode == null || postcode == "") {
					alert("우편번호를 입력하세요");
					$("#postcode").focus();
					
					return false;
				}
				
				if(detailAddress == null || detailAddress == "") {
					alert("상세주소를 입력하세요");
					$("#detailAddress").focus();
					
					return false;
				}
				
				$("#signupForm").submit();
				
			})
			
			$("#idCheck").on("click", function(){
				var loginId = $("#loginId").val().trim();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요");
					$("#loginId").focus();
					
					return false;
				}
				
				$.ajax({
					type:"get"
					, url:"idCheck"
					, data:{"loginId":loginId}
					, success:function(data) {
						isIdCheck = true;
						
						if(data.duplication) {
							isIdDuplicate = true;
							$(".idFail").removeClass("d-none");
							$(".idSuccess").addClass("d-none");
						} else {
							isIdDuplicate = false;
							$(".idSuccess").removeClass("d-none");
							$(".idFail").addClass("d-none");
						}
					}
					, error:function(e){
						alert("에러")
					}
				})
				
			})
		})
	</script>
</body>
</html>