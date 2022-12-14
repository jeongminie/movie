<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/static/css/xdmin/style.css">
	<title></title>
	
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
			padding : 20px;
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
			width : 350px;
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
					<h4 class="mt-4">코드 정보를 입력해주세요</h4>
				</div>
				<form method="post" name="form" id="form">
				<input type="hidden" name="seq" value="${vo.seq }">
				<%@include file="codeVo.jsp"%>	
					<div class="d-flex">
						<div class="codeInfo col-6">
							<div>
								<span>코드그룹</span>
								<select class="form-select text-input" name="cgSeq" id="cgSeq">
									<option value="0" selected>선택</option>
									<c:forEach items="${list }" var="list" varStatus="status">
										<option value="${list.cgSeq }">${list.cgName }</option>
									</c:forEach>
								</select>
							</div>
							<div>코드<input type="text" class="form-control text-input" placeholder="자동생성" disabled></div>
							<div>코드 이름 (한글)<input type="text" name="ccName" id="ccName" class="form-control text-input" <c:if test="${not empty item.ccName }">value="${item.ccName  }"</c:if>></div>
							<div>
								<span>사용여부</span>
								<select name="useNy" id="useNy" class="form-select text-input">
									<option value="1">Y</option>
									<option value="0">N</option>
								</select>
							</div>
							<div>설명<textarea cols="30" class="form-control text-input"></textarea></div>
							<div>예비1 (varchar type)<input type="text" class="form-control text-input" placeholder="영문(대소문자),숫자"></div>
							<div>예비3 (varchar type)<input type="text" class="form-control text-input" placeholder="영문(대소문자),숫자"></div>
							<div>예비1 (int type)<input type="text" class="form-control text-input" placeholder="숫자"></div>
							<div>예비3 (int type)<input type="text" class="form-control text-input" placeholder="숫자"></div>
						</div>
						<div class="codeInfo col-6">
							<div style="margin-top:77px">코드 (Another)<input type="text" name="ccAnother" id="ccAnother" class="form-control text-input"></div>
							<div>코드 이름 (영문)<input type="text" name="ccNameEng" id="ccNameEng" class="form-control text-input" <c:if test="${not empty item.ccNameEng }">value="${item.ccNameEng  }"</c:if>></div>
							<div>순서<input type="text" id="order" class="form-control text-input"></div>
							<div>
								<span>삭제여부</span>
								<select name="delNy" id="delNy" class="form-select text-input">
									<option value="0">N</option>
									<option value="1">Y</option>
								</select>
							</div>
							<div style="margin-top:35px">예비2 (varchar type)<input type="text" class="form-control text-input" placeholder="영문(대소문자),숫자"></div>
							<div style="margin-top:85px">예비2 (int type)<input type="text" class="form-control text-input" placeholder="숫자"></div>
						</div>
					</div>
					<div class="d-flex justify-content-between">
						<button type="button" id="prevBtn" class="btn prevBtn">이전</button>
						<c:choose>
							<c:when test="${not empty item.seq }">
								<div class="d-flex">
									<button type="button" class="btn ueleteBtn" id="uelete">X</button>
									<button type="button" class="btn deleteBtn" id="delete">삭제</button>
									<button type="submit" class="btn saveBtn">수정</button>
								</div>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn saveBtn">등록</button>
							</c:otherwise>
						</c:choose>
						<!-- <button type="button" class="btn createBtn" data-bs-toggle="modal" data-bs-target="#memberRegModal">등록하기</button> -->
					</div>
				</form>
			</section>
		</section>
	</div>
	
	<%@include file="../../../include/xdmin/jsp/deleteModal.jsp"%>
	
	<form name="formVo" id="formVo" method="post">
		<%@include file="codeVo.jsp"%>		<!-- #-> -->
	</form>
		
	<script>
		function test(){
			var cgSeq = $("#cgSeq").val();
			var ccName = $("#ccName").val();
			var useNy = $("#useNy").val();
			var ccAnother = $("#ccAnother").val();
			var ccNameEng = $("#ccNameEng").val();
			var order = $("#order").val();
			var delNy = $("#delNy").val();
			
			if(cgSeq == 0) {
				alert("코드그룹을 선택하세요.");
				$("#cgSeq").focus();
				
				return;
			}
			
			if(ccName == '' || ccName == null) {
				alert("코드 이름을 입력하세요.");
				$("#ccName").focus();
				
				return;
			}
			if(ccNameEng == '' || ccNameEng == null) {
				alert("코드영문 이름을 입력하세요.");
				$("#ccNameEng").focus();
				
				return;
			}
			
			if(ccAnother == '' || ccAnother == null) {
				alert("Another 코드를 입력하세요.");
				$("#ccAnother").focus();
				
				return;
			}
			
			if(order == '' || order == null) {
				alert("순서를 입력하세요.");
				$("#order").focus();
				
				return;
			}
			
		}
		
		$(document).ready(function(){
			var form = $("form[name=form]");
			var formVo = $("form[name=formVo]");
			
			var seq = $("input:hidden[name=seq]").val();
			console.log(seq)
			
			$(".saveBtn").on("click", function(){
				if(seq == 0 || seq == "") { //insert
					form.attr("action", "/code/codeInst").submit();
					alert("저장완료");
				} else { //update
					form.attr("action", "/code/codeUpdate").submit();
					alert("수정완료");
				}
			});
			
			$("#prevBtn").on("click", function(){
				formVo.attr("action", "codeList").submit();
			});
			
			$("#birth").datepicker({
				changeYear: true //option값 년 선택 가능
		        , changeMonth: true //option값  월 선택 가능   
                , showButtonPanel: true
                , currentText: '오늘'
                , dateFormat: "yy-mm-dd"
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
			
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>