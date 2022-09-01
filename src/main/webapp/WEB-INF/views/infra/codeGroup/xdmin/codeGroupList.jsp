<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/static/css/style.css">
	
	<title>회원관리</title>
	
	<style>
		.text-input {
			width : 250px;
			margin-right: 10px;
			margin-top: 10px;
		}
		
		#ui-datepicker-div {
			width : 250px;
		}
		
		.page-link {
			color : black;
		}
		
		.page-link:hover {
			color : black;
		}
	</style>
	
</head>
<body>
	<div id="wrap">
		<div>
			<header class="d-flex">
				<a href="memberList.html" class="display-4 text-dark col-1" id="logo">Title</a>
				<nav class="sub-menu col-11 d-flex align-items-center justify-content-end">
					<ul class="nav">
					    <!-- <li class="nav-item"><a href="#" class="nav-link small-link"><i class="fa-solid fa-circle-user"></i></a></li> -->
					    <li class="nav-item"><a href="#" class="nav-link">로그인</a></li>
					    <li class="nav-item"><a href="#" class="nav-link">회원가입</a></li>
					</ul>                        
				</nav>
			</header>
			<section class="d-flex">
				<aside class="col-2">
					<nav class="main-nav">
						<ul class="nav flex-column">
							<li class="nav-item"><a href="#" class="nav-link">코드그룹관리</a></li>				
							<li class="nav-item"><a href="#" class="nav-link">코드관리</a></li>
							<li class="nav-item"><a href="memberList.html" class="nav-link">회원관리</a></li>
						</ul>
					</nav>
				</aside>
				<section class="col-10">
<!-- 				
					<div class="noticeSection d-flex justify-content-around">
						<div class="box">
							<span>공지사항</span>
						</div>
						<div class="box">
							<span>1:1문의</span>
						</div>
						<div class="box">
							<span>1:1문의</span>
						</div>
						<div class="box">
							<span>1:1문의</span>
						</div>
					</div>
 -->				
 					<span class="m-4"><b>코드그룹 관리</b></span>
					<div id="searchSection">
						<div class="d-flex">
							<select class="form-select text-input">
								<option>삭제여부</option>
								<option>N</option>
								<option>Y</option>
							</select>
							<select class="form-select text-input">
								<option>날짜구분</option>
								<option>수정일</option>
								<option>등록일</option>
							</select>
							<input type="text" class="form-control text-input" placeholder="시작일" id="startDate">
							<input type="text" class="form-control text-input" placeholder="종료일" id="endDate">
						</div>
						<div class="d-flex">
							<select class="form-select text-input">
								<option>검색구분</option>
								<option>코드그룹 이름</option>
								<option>코드그룹 코드</option>
							</select>
							<input type="text" class="form-control text-input" placeholder="검색어">
							<button type="button" class="btn searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
							<button type="button" class="btn resetBtn"><i class="fa-solid fa-rotate-right"></i></button>
						</div>
					</div>
					<div class="memberList">
						<div class="d-flex p-2 justify-content-between">
							<div class="mt-2">
								<span class="p-2">검색 결과 : N</span>
								<span class="p-2 totalCount">Total : N</span>
							</div>
							<div>
								<button type="button" class="btn excelBtn"><i class="fa-solid fa-file-excel"></i></button>
								<a href="memberRegForm.html" class="btn createBtn"><i class="fa-solid fa-circle-plus"></i></a>
							</div>
						</div>
						<table class="table text-center codeGroupTable">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" id="chkAll"></th>
									<th scope="col">No</th>
									<th scope="col">코드그룹 코드</th>
									<th scope="col">코드그룹 이름(한글)</th>
									<th scope="col">코드그룹 이름(영문)</th>
									<th scope="col">코드 갯수</th>
									<th scope="col">등록일</th>
									<th scope="col">수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="list" varStatus="status">
									<tr class="memberView">
										<th scope="col"><input type="checkbox" class="chk"></th>
										<th scope="row">${status.count }</th>
										<td>${list.cgSeq }</td>
										<td>${list.cgName }</td>
										<td>${list.cgNameEng }</td>
										<td></td>
										<td><fmt:formatDate value="${list.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><fmt:formatDate value="${list.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<nav aria-label="Page navigation example" class="d-flex justify-content-center">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
							</ul>
						</nav>
						<div class="d-flex justify-content-end">				
							<div>
								<button type="button" class="btn cancelBtn"><i class="fa-solid fa-xmark"></i></button>
								<button type="button" class="btn deleteBtn" data-bs-toggle="modal" data-bs-target="#codeGroupDeleteModal" data-bs-whatever="true"><i class="fa-solid fa-trash-can"></i></button>
							</div>
						</div>
					</div>
				</section>
			</section>
		</div>
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
						<p></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn closeBtn" data-bs-dismiss="modal"></button>
						<button type="button" class="btn deleteBtn modalDeleteBtn">삭제</button>
					</div>
				</div>
			</div>
		</div>
	
	<script>
		$(document).ready(function(){
			var tableRow = document.getElementsByTagName('tr');
			tableRowCount = tableRow.length -1;
			console.log(tableRowCount);
			
			var totalCount = document.getElementsByClassName('totalCount');
			totalCount[0].innerHTML='<span class="p-2 totalCount">Total : ' + tableRowCount + '</span>';
		
			$('#codeGroupDeleteModal').on('shown.bs.modal', function() {
				var button = $(event.relatedTarget);
				var recipient = button.data('whatever');
				var modal = $(this);
				
				if($(".chk").is(":checked") == false) {
					modal.find('.modal-body p').text('삭제할 항목을 선택해주세요.');
					modal.find('.closeBtn').text('확인');
					$(".modalDeleteBtn").css("display", "none");
				} else {
					modal.find('.modal-body p').text('삭제하시겠습니까?');
					modal.find('.closeBtn').text('취소');
					$(".modalDeleteBtn").css("display", "inline");
				}
			});

			$("#startDate").datepicker({
                showButtonPanel: true, 
                currentText: '오늘',
                dateFormat: "yy-mm-dd",
                dayNamesMin:['월', '화', '수', '목', '금', '토', '일']
			});
			
			$("#endDate").datepicker({
                showButtonPanel: true, 
                dateFormat: "yy-mm-dd",
                dayNamesMin:['월', '화', '수', '목', '금', '토', '일']
			});
			
			$("#chkAll").on("click", function(){
				if ($(this).is(":checked")) {
					$(".chk").prop("checked", true);
				} else {
					$(".chk").prop("checked", false);
				}
				console.log($(this).prop("checked"))
			});
			
			$(".chk").on("click", function(){
				event.cancelBubble=true;
			});
			
			$("#createBtn").on("click", function(){
				location.href = 'create.html'
			});
			
			$(".deleteBtn").on("click", function(e){
				var chkValue = $(this).data("chk-id");
				console.log(chkValue);
				
				/* var chkValue = $(".chk").is(":checked");
				console.log(chkValue); */
				
				if(chkValue == false) {
					alert("hi")
				}
			});
			
			$(".memberView").on("click",function(){
				location.href="memberView.html";
			});
			
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>