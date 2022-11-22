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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/static/css/xdmin/style.css">
	<title>회원등록</title>
	
	<style>
		.frontSection {
			/* border-bottom: 1px solid #dee2e6; */
			height: 120px;
			text-align: center;
			padding: 20px;
		}
		
		.codeInfo {
			background-color : white;
			border : 1px solid #dee2e6;
			margin: 5px;
			padding : 10px;
		}
		
		.genderBtn {
			background-color: #2DD4CE;
			color : white;
		}
		
		.text-input {
			width : 100%;
			margin-top : 5px;
			margin-bottom: 10px;
		}
		
		#ui-datepicker-div {
			width : 320px;
		}
		
		#idCheck {
		   width: 80px;
		}
	</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/xdmin/jsp/menu.jsp" />
			<section class="col-10 p-4">
				<div class="frontSection">
					<span><b>STEP1.정보입력</b></span>
					<span>STEP2.등록완료</span>
					<h4 class="mt-4">회원 정보를 입력해주세요</h4>
				</div>
				<form method="post" name="form" id="form" autocomplete="off" enctype="multipart/form-data">
					<input type="hidden" name="seq" value="${vo.seq }">
					<div class="d-flex h-100">
						<div class="codeInfo col-6">
							<div>이름<input type="text" name="name" id="name" class="form-control text-input" placeholder="이름" <c:if test="${not empty item.name }">value="${item.name  }"</c:if>></div>
							<div>아이디
								<div class="d-flex">
									<input type="text" name="loginId" id="loginId" class="form-control text-input" placeholder="아이디" <c:if test="${not empty item.loginId }">value="${item.loginId  }"</c:if>>
									<button type="button" id="idCheck" class="btn btn-sm">중복확인</button>
								</div>
								<small class="text-danger d-none idFail">중복된 아이디 입니다.</small>
								<small class="text-success d-none idSuccess">사용가능한 아이디 입니다.</small>
							</div>
							<div>비밀번호<input type="password" name="password" id="password" class="form-control text-input" placeholder="비밀번호"></div>
							<div>비밀번호 확인<input type="password" name="passwordRe" id="passwordRe" class="form-control text-input" placeholder="비밀번호 확인"></div>
							<span>이메일</span>
							<c:set var="listCodeEmail" value="${CodeServiceImpl.selectListCachedCode('1001')}"/>
							<div class="d-flex">
								<input type="text" class="form-control text-input" name="email" id="email" <c:if test="${not empty item.emailFull }">value="${fn:split(item.emailFull, '@')[0]}"</c:if>><span style="margin: 10px 10px 0 10px;">@</span>
								<select class="form-select text-input" name="useNy" id="useNy" name="domain" id="domain">
									<option value="0">선택</option>
									<c:forEach items="${listCodeEmail}" var="listEmail" varStatus="statusEmail">
										<option value="${listEmail.seq }" <c:if test="${fn:containsIgnoreCase(item.emailFull, listEmail.ccNameEng)}">selected</c:if>><c:out value="${listEmail.ccNameEng }"></c:out></option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="codeInfo col-6">
							<div>성별
								<select class="form-select text-input" name="gender" id="gender">
									<option value="0">선택</option>
									<option value="90" <c:if test="${item.gender eq 90 }">selected</c:if>>남</option>
									<option value="89" <c:if test="${item.gender eq 89 }">selected</c:if>>여</option>
								</select>
							</div>
							<div>생년월일<input type="text" name="birth" id="birth" class="form-control text-input" <c:if test="${not empty item.birth }">value="${item.birth }"</c:if> placeholder="YYYYMMDD"></div>
							<div>상태
								<select class="form-select text-input" name="adminNy" id="adminNy">
									<option value="0" <c:if test="${item.adminNy eq 0 }">selected</c:if>>사용자</option>
									<option value="1" <c:if test="${item.adminNy eq 1 }">selected</c:if>>관리자</option>
								</select>
							</div>
							<div>전화번호<input type="text" name="phone" id="phone" class="form-control text-input" placeholder="전화번호" <c:if test="${not empty item.phone }">value="${item.phone }"</c:if>></div>
							<span>주소</span>
							<div id="addressWrap">
								<div class="d-flex">
									<input type="text" class="form-control text-input mb-2 mr-2" name="postcode" id="postcode" placeholder="우편번호" <c:if test="${not empty item.postcode }">value="${item.postcode }"</c:if>>
									<button type="button" id="reset" class="btn btn-sm"><i class="fa-solid fa-trash"></i></button>
								</div>
								<input type="text" class="form-control text-input mb-2" name="address" id="address" placeholder="주소">
								<div class="d-flex mb-2"> 
									<input type="text" class="form-control text-input" name="detailAddress" id="detailAddress" placeholder="상세주소" style="width : 60% !important; margin-right: 10px;">
									<input type="text" class="form-control text-input" name="extraAddress" id="extraAddress" placeholder="참고항목" style="width : 40% !important">
								</div>
								<div class="d-flex">
									<input type="text" class="form-control text-input col-6 mr-2" name="x" id="x" placeholder="x" style="width : 30% !important; margin-right: 10px;">
									<input type="text" class="form-control text-input col-6" name="y" id="y" placeholder="y" style="width : 30% !important">
								</div>
							</div>
							<div>
								<span>삭제여부</span>
								<select class="form-select text-input" name="delNy" id="delNy">
									<option value="0" <c:if test="${item.delNy eq 0 }">selected</c:if>>N</option>
									<option value="1" <c:if test="${item.delNy eq 1 }">selected</c:if>>Y</option>
								</select>
							</div>
						</div>
					</div>
				</form>
				<div class="d-flex justify-content-between" style="padding-bottom: 10px;">
					<button type="button" class="btn prevBtn">이전</button>
					<c:choose>
						<c:when test="${not empty item.seq }">
							<div class="d-flex">
								<button type="button" class="btn ueleteBtn" id="uelete">X</button>
								<button type="button" class="btn deleteBtn" id="delete">삭제</button>
								<!-- <button type="submit" class="btn saveBtn">수정</button> -->
							</div>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn saveBtn">등록</button>
						</c:otherwise>
					</c:choose>
					<!-- <button type="submit" class="btn createBtn" data-bs-toggle="modal" data-bs-target="#memberRegModal">등록하기</button> -->
				</div>
			</section>
		</section>
	</div>
	
	<%@include file="../../../include/xdmin/jsp/deleteModal.jsp"%>
	
	<!-- 카카오 지도 api -->
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
	                document.getElementById("detailAddress").focus();
	                
	                geocoder.addressSearch(addr, callback);
	            }
	        }).open();
	    }
		
		var geocoder = new kakao.maps.services.Geocoder();
		
		var callback = function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            console.log(result);
	            document.getElementById('x').value = result[0].x;
	           	document.getElementById('y').value = result[0].y;
	            
	        }
	    };
	    
	 	// 핸드폰번호 체크
		function checkMobile(phoneNum) {
			var regExp =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
			if(regExp.test(phoneNum)){
				return true;
			} else {
				return false;
			}
		}
	 	
		$(document).ready(function(){
			$("#birth").datepicker({
				changeYear: true //option값 년 선택 가능
		        , changeMonth: true //option값  월 선택 가능   
                , showButtonPanel: true
                , currentText: '오늘'
                , dateFormat: "yymmdd"
                , dayNamesMin:['월', '화', '수', '목', '금', '토', '일']
			});
			
			$(".passwordRe").on("mouseleave", function(){
				var password = $(".password").val().trim();
				var passwordRe = $(".passwordRe").val().trim();
				
				if(password != passwordRe) {
					$(".passwordError").removeClass("d-none");
				} else {
					$(".passwordError").addClass("d-none");
				}
			});
			
			$("#postcode").on("click", function(){
				execDaumPostcode();
			})
			
	    	$("#reset").on("click", function(){
	    		var input = $("#addressWrap").find('input[type=text]')
			    input.val('');
	    	});
			
			var seq = $("input:hidden[name=seq]");
			var form = $("form[name=form]");
			
			//체크안함 
			var isIdCheck = false;
			//중복
			var isIdDuplicate = true;
			
			$(".saveBtn").on("click", function(){
				var phone = $("#phone").val().trim().replaceAll("-","");
				
				if(seq.val() == 0 || seq.val() == "") { //insert
					if(isIdCheck == false) {
						alert("아이디 중복체크를 해주세요.");
						return;
					}
				
					if(isIdDuplicate == true) {
						alert("아이디가 중복되었습니다.");
						return;
					}
					
					if(phone == null || phone == "") {
						alert("휴대폰 번호를 입력하세요");
						$("#phone").focus();
						
						return false;
					} else {
						if(checkMobile(phone)) {
						//pass
						} else {
							alert("핸드폰번호를 다시 입력해주세요.")
							return false;
						}
					}
					
					form.attr("action", "/admin/memberInst").submit();
					alert("저장완료");
				} else { //update
					form.attr("action", "/admin/memberUpdate").submit();
					alert("수정완료");
				}
				
			});
			
			$(".prevBtn").on("click", function(){
				location.href="/admin/memberList";
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
					, url:"/member/idCheck"
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
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>