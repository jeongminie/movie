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
	
	<!-- js -->
	<script type="text/javascript" src="/resources/static/js/xdmin/commonXdmin.js"></script>
	<!-- <script type="text/javascript" src="/resources/static/js/xdmin/constantsXdmin.js"></script> -->
	<script type="text/javascript" src="/resources/static/js/common/common.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/static/css/xdmin/style.css">
	
	<title>코드그룹 등록</title>
	
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
					<h4 class="mt-4">코드그룹 정보를 입력해주세요</h4>
				</div>
				<form method="post" name="form" id="form" autocomplete="off" enctype="multipart/form-data">
					<input type="hidden" name="seq" value="${vo.seq }">
					<div class="d-flex h-100">
						<div class="codeInfo col-6">
							<div>코드그룹 코드<input type="text" name="cgSeq" id="cgSeq" class="form-control text-input" placeholder="코드그룹 코드" <c:if test="${not empty item.cgSeq }">value="${item.cgSeq  }"</c:if>></div>
							<div>코드그룹 이름 (한글)<input type="text" name="cgName" id="cgName" class="form-control text-input" placeholder="코드그룹 코드" <c:if test="${not empty item.cgName }">value="${item.cgName  }"</c:if>></div>
							<div>
								<span>사용여부</span>
								<select class="form-select text-input" name="useNy" id="useNy">
									<option value="1" <c:if test="${item.useNy eq 1 }">selected</c:if>>Y</option>
									<option value="0" <c:if test="${item.useNy eq 0 }">selected</c:if>>N</option>
								</select>
							</div>
							<div>설명<textarea cols="30" class="form-control text-input"></textarea></div>
							<div>예비1 (varchar type)<input type="text" class="form-control text-input" placeholder="영문(대소문자),숫자"></div>
							<div>예비3 (varchar type)<input type="text" class="form-control text-input" placeholder="영문(대소문자),숫자"></div>
							<div>예비1 (int type)<input type="text" class="form-control text-input" placeholder="숫자"></div>
							<div>예비3 (int type)<input type="text" class="form-control text-input" placeholder="숫자"></div>
							<div>이미지첨부 
								<input type="file" id="fileInput" class="col-10 mb-2 d-none" multiple="multiple" onChange="upload('fileInput', 0, 1, 0, 0);">
								<i id="imageUploadBtn" class="fa-regular fa-image" style="position: relative; top: 90px; left: 115px; cursor:pointer;"></i>
								<div style="width: 420px; height: 150px; background-color: #ECECF1;"></div>
							</div>
							
						</div>
						<div class="codeInfo col-6">
							<div>코드그룹 코드 (Another)<input type="text" class="form-control text-input" placeholder="코드그룹 코드"></div>
							<div>코드그룹 이름 (영문)<input type="text" name="cgNameEng" id="cgNameEng" class="form-control text-input" <c:if test="${not empty item.cgNameEng }">value="${item.cgNameEng  }"</c:if> placeholder="코드그룹 코드"></div>
							<div>순서<input type="text" class="form-control text-input" placeholder="코드그룹 코드"></div>
							<div>
								<span>삭제여부</span>
								<select class="form-select text-input" name="delNy" id="delNy">
									<option value="0" <c:if test="${item.delNy eq 0 }">selected</c:if>>N</option>
									<option value="1" <c:if test="${item.delNy eq 1 }">selected</c:if>>Y</option>
								</select>
							</div>
							<div style="margin-top:35px">예비2 (varchar type)<input type="text" class="form-control text-input" placeholder="영문(대소문자),숫자"></div>
							<div style="margin-top:85px">예비2 (int type)<input type="text" class="form-control text-input" placeholder="숫자"></div>
						</div>
					</div>
					<%@include file="codeGroupVo.jsp"%>
				</form>
				<div class="d-flex justify-content-between" style="padding-bottom: 10px;">
					<button type="button" class="btn prevBtn">이전</button>
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
					<!-- <button type="submit" class="btn createBtn" data-bs-toggle="modal" data-bs-target="#memberRegModal">등록하기</button> -->
					</div>
			</section>
		</section>
	</div>
	
	<!-- modal -->
	<div class="modal fade" id="codeGroupDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" role="document">
				<div class="modal-header">
					<h5 class="modal-title">코드그룹 삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body d-flex align-items-center">
					<p>삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn closeBtn" data-bs-dismiss="modal"></button>
					<button type="button" class="btn deleteBtn" id="cgDeleteBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- form -->
	<form method="post" name="formVo" id="formVo">
		<%@include file="codeGroupVo.jsp"%>
	</form>
		
	<script>
		$(document).ready(function(){
			
			//최대첨부파일수, 허용확장자, 각허용가능사이즈, 토탈허용사이즈
			upload = function(objName, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize) {
			
				var totalFileSize = 0;
				var obj = $("#" + objName +"")[0].files;
				var fileCount = obj.length;
				console.log(obj)
				
				allowedMaxTotalFileNumber = allowedMaxTotalFileNumber == 0 ? MAX_TOTAL_FILE_NUMBER : allowedMaxTotalFileNumber;
				allowedEachFileSize = allowedEachFileSize == 0 ? MAX_EACH_FILE_SIZE : allowedEachFileSize;
				allowedTotalFileSize = allowedTotalFileSize == 0 ? MAX_TOTAL_FILE_SIZE : allowedTotalFileSize;
				
				//최대 첨부 파일수 확인
				if(checkUploadedTotalFileNumber(obj, allowedMaxTotalFileNumber, fileCount) == false) { return false; }

				//확장자, 개별 파일 사이즈 확인
				for (var i = 0 ; i < fileCount ; i++) {
					if(checkUploadedExt($("#" + objName +"")[0].files[i].name, allowedExtdiv) == false) { return false; }
					if(checkUploadedEachFileSize($("#" + objName +"")[0].files[i], allowedEachFileSize) == false) { return false; }
					totalFileSize += $("#" + objName +"")[0].files[i].size;
				}
				
				if(checkUploadedTotalFileSize(totalFileSize, allowedTotalFileSize) == false) { return false; }
			}
			
			
			$("#imageUploadBtn").on("click", function(){
				$("#fileInput").click();
			});
			
			var action;
			var modal = $("#codeGroupDeleteModal");
			var deleteurl = "codeGroupDelete";
			var ueleteurl = "codeGroupUelete";
			
			var form = $("form[name=form]");
			var formVo = $("form[name=formVo]");
			
			/* var submitType = $("button[type=submit]").val(); //0수정 1등록 */
			var seq = $("input:hidden[name=seq]");
			console.log(seq)
			
 			$(".saveBtn").on("click", function(){
				
				var cgSeq = $("#cgSeq").val();
				var cgName = $("#cgName").val();
				var cgNameEng = $("#cgNameEng").val();
				var useNy = $("#useNy").val();
				var delNy = $("#delNy").val();
				
				if(cgSeq == '' || cgSeq == null) {
					alert("코드그룹 코드를 입력하세요.");
					$("#cgSeq").focus();
					
					return false;
				}
				
				if(cgName == '' || cgName == null) {
					alert("코드 이름을 입력하세요.");
					$("#cgName").focus();
					
					return false;
				}
				
				if(cgNameEng == '' || cgNameEng == null) {
					alert("코드영문 이름을 입력하세요.");
					$("#cgNameEng").focus();
					
					return false;
				}
				
				if(seq.val() == 0 || seq.val() == "") { //insert
					form.attr("action", "/codeGroup/codeGroupInst").submit();
					alert("저장완료");
				} else { //update
					form.attr("action", "/codeGroup/codeGroupUpdate").submit();
					alert("수정완료");
				}
				
			});
			
			/* uelete 버튼 */
			$("#uelete").on("click", function(){
				action = "uelete";
				modal.modal('show');
			});
			
			/* delete 버튼 */
			$("#delete").on("click", function(){
				action = "delete"
				modal.modal('show');
			});
			
			$("#cgDeleteBtn").on("click", function(e){
				if(action == "uelete") {
					$.ajax({
						type:"post"
						, url:ueleteurl
						, data:{"seq":seq.val()}
						, success:function(data){
							if(data.result) {
								alert("삭제 완료");
								location.href="codeGroupList";
							}
						}
					});
				} else if(action == "delete") {
					$.ajax({
						type:"post"
						, url:deleteurl
						, data:{"seq":seq.val()}
						, success:function(data){
							if(data.result) {
								alert("삭제 완료");
								location.href="codeGroupList";
							}
						}
					});
				}
			});
			
			$("#birth").datepicker({
				changeYear: true //option값 년 선택 가능
		        , changeMonth: true //option값  월 선택 가능   
                , showButtonPanel: true
                , currentText: '오늘'
                , dateFormat: "yy-mm-dd"
                , dayNamesMin:['월', '화', '수', '목', '금', '토', '일']
			});
			
			$(".prevBtn").click(function(){
				formVo.attr("action", "/codeGroup/codeGroupList").submit();
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>