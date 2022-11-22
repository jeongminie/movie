<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.*" %>
<jsp:useBean id="CodeServiceImpl" class="com.jeongmini.movie.modules.code.CodeServiceImpl"/>
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
											<input type="file" id="profileUploaded" name="file" style="display: none;">
											<input type="hidden" name="filePath" value="${profile.path }${profile.uuidName }">
										</form>
										<div class="profile-img">
											<c:choose>
												<c:when test="${not empty profile}">
													<img src="<c:out value="${profile.path }${profile.uuidName }"/>" onerror="setEmptyImage(this)">
												</c:when>
												<c:otherwise>
													<img src="#" onerror="setEmptyImage(this)">
												</c:otherwise>
											</c:choose>
										</div>
										<button type="button" class="button small gray-line" id="addProfileImgBtn">이미지 등록</button>
										<a href="/mypage/goodbye-megabox" class="button small member-out" title="회원탈퇴">회원탈퇴</a>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">아이디</th>
								<td>${loginId }</td>
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
					<div class="table-wrap mb40">
						<table class="board-form">
							<caption>이름, 생년월일, 휴대폰, 이메일, 비밀번호, 주소 항목을 가진 기본정보 표</caption>
							<colgroup>
								<col style="width:180px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">이름 <em class="font-orange">*</em></th>
									<td>
										<span class="mbNmClass">${member.name }</span>
									</td>
								</tr>
								<tr>
									<th scope="row">생년월일 <em class="font-orange">*</em></th>
									<td>
									${fn:substring(member.birth, 0, 4)}년 ${fn:substring(member.birth, 4, 6)}월 ${fn:substring(member.birth, 6, 9)}일
									</td>
								</tr>
								<tr>
									<th scope="row">
										<label for="num">휴대폰</label> <em class="font-orange">*</em>
									</th>
									<td>
										<div class="clearfix">
											<input type="text" name="phone" id="phone" class="input-text w300px" oninput="autoHyphen(this)" value="${fn:substring(member.phone, 0, 3)}-${fn:substring(member.phone, 3, 7)}-${fn:substring(member.phone, 7, 12)}">
											<p class="reset float-l w170px lh32 changeVal" data-name="phoneNo"></p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">
										<label for="email">이메일</label> <em class="font-orange">*</em>
									</th>
									<td>
										<c:set var="listCodeEmail" value="${CodeServiceImpl.selectListCachedCode('1001')}"/>
										<input type="text" name="email" id="email" class="input-text w300px  mr10" value="${fn:split(member.emailFull, '@')[0]}">
										<span class="mr10">@</span>
										<select class="input-text w150px" name="domain" id="domain">
											<option value="0">선택</option>
											<c:forEach items="${listCodeEmail}" var="listEmail" varStatus="statusEmail">
												<option value="${listEmail.seq }" <c:if test="${fn:containsIgnoreCase(member.emailFull, listEmail.ccNameEng)}">selected</c:if>><c:out value="${listEmail.ccNameEng }"></c:out></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">현재 비밀번호 <em class="font-orange">*</em></th>
									<td>
										<input type="password" id="pwnow" name="pwnow" class="input-text w300px" value="">
									</td>
								</tr>
								<tr>
									<th scope="row">새 비밀번호 </th>
									<td>
										<input type="password" id="pwnew" name="pwnew" class="input-text w300px" value="">
									</td>
								</tr>
								<tr>
									<th scope="row">새 비밀번호 재입력 </th>
									<td>
										<input type="password" id="repwnew" name="repwnew" class="input-text w300px mr10" value="">
										<small class="text-danger d-none pwFail">비밀번호가 일치하지 않습니다.</small>
									</td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td>
										<span></span>
										<input type="text" class="input-text w300px" name="postcode" id="postcode" placeholder="우편번호" value="${member.postcode }">
										<a href="#none" id="addrBtn" class="button small gray-line ml10" title="우편번호 검색">우편번호 검색</a>
										<a href="#none" id="reset" class="button small gray-line ml10"><i class="fa-solid fa-trash"></i></a>
										<div class="d-flex mt10">
											<input type="text" class="input-text w300px mr10" name="address" id="address" placeholder="주소" value="${member.address }">
											<input type="text" class="input-text w300px" name="extraAddress" id="extraAddress" placeholder="참고항목">
										</div>
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
	</div>
	<jsp:include page="../../../include/user/jsp/footer.jsp" />
	
	<jsp:include page="../../../include/user/jsp/loginModal.jsp" /> 
	<jsp:include page="../../../include/user/jsp/alterModal.jsp" /> 
	
	<!-- 카카오 주소 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07294d6c3c28278176fbea6c96ff7670&libraries=services"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
		function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	               /*  document.getElementById("detailAddress").focus(); */
	                
	                geocoder.addressSearch(addr, callback);
	            }
	        }).open();
	    }
		
		var geocoder = new kakao.maps.services.Geocoder();
		
		var callback = function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            console.log(result);
	           /*  document.getElementById('x').value = result[0].x;
	           	document.getElementById('y').value = result[0].y; */
	            
	        }
	    };
	
		 $(document).ready(function(){
			$("#addrBtn").on("click", function(){
				execDaumPostcode();
			})
			
	    	$("#reset").on("click", function(){
	    		var input = $("#addressWrap").find('input[type=text]')
			    input.val('');
	    	})
	    })
	</script>
	
	<script>
		function setEmptyImage(img) {
			img.src='/resources/static/image/noImg2.png';
			$(img).addClass('noImg');
		}
		
		//이미지 미리보기(사용 x)
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
		
		const autoHyphen = (target) => {
			target.value = target.value
			   .replace(/[^0-9]/g, '')
			   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		}
		
		function pageBack(){
			sessionStorage.setItem("sessAuth", "false");
			$("#alertModal").find('.modal-body p').html('<p>인증시간이 초과되었습니다.<br>다시 인증해주세요</p>');
			$("#alertModal").modal('show');
			
			$('#alertModal').on('hide.bs.modal', function() {
				window.history.back();
			});
		}
		
		$(document).ready(function(){
			setTimeout('pageBack()', 180000);
			
			if(sessionStorage.getItem("sessAuth") == "false" ) {
				pageBack();
			}
			
			$("#addProfileImgBtn").on("click", function(){
				$("#profileUploaded").click();
			});
			
			$("#profileUploaded").on("change", function(e){
				console.log($("#profileUploaded")[0].files[0])
			
				var filePath = $("input[name='filePath']").val();
				
 				var formData = new FormData();
				formData.append("profileUploaded", $("#profileUploaded")[0].files[0]);
				formData.append("filePath", filePath);
				
				$.ajax({
					type : "POST",
					enctype:"mutipart/form-data",
					url:"/profileUploaded",
					processData: false,
					contentType: false,
					data: formData,
					dataType: "json",
					success : function(data) {
						setTimeout(function() {
							$("#alertModal").find('.modal-body p').html('<p>프로필 사진이 등록되었습니다.</p>');
							$("#alertModal").modal('show');
						}, 3000);
					}
				});
			});
			
			$("#repwnew").on("keyup", function(){
				var pwnew = $("#pwnew").val();
				var repwnew = $("#repwnew").val();
				
				if(pwnew != repwnew) {
					$(".pwFail").removeClass("d-none");
				} else if(repwnew == '' || repwnew == null || pwnew == repwnew) {
					$(".pwFail").addClass("d-none");
				}
			});
			
			$("#updateBtn").on("click", function(){
				var phone = $("#phone").val().trim().replaceAll("-","");
				var pwnow = $("#pwnow").val().trim();
				var pwnew = $("#pwnew").val().trim();
				var repwnew = $("#repwnew").val();
				var email = $("#email").val().trim();
				var domain = $("#domain").val().trim();
				var postcode = $("#postcode").val().trim();
				var address = $("#address").val().trim();
				
				if (pwnow == null || pwnow == ''){
					$("#alertModal").find('.modal-body p').html('<p>비밀번호를 입력해주세요.</p>');
					$("#alertModal").modal('show');
					$("#pwnow").focus();
					return false;
				}
				
				if(pwnew != null && repwnew != null && pwnew != repwnew) {
					$("#alertModal").find('.modal-body p').html('<p>비밀번호가 일치하지 않습니다.</p>');
					$("#alertModal").modal('show');
					$("#repwnew").focus();
					return false;
				}
				
				$.ajax({
					type : "POST"
					, url:"/member/update"
					, data:{"phone":phone, "pwnow":pwnow, "pwnew":pwnew, "phone":phone, "email":email, "domain":domain, "postcode":postcode, "address":address}
					, success:function(data) {
						$("#alertModal").find('.modal-body p').text('회원정보 수정이 완료되었습니다.');
						$("#alertModal").modal('show');
					}
				});
			});
			
		})
	
	</script>
	
	
</body>
</html>