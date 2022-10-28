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
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/static/css/xdmin/style.css">
	
	<title>회원관리</title>
	
	<style>
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
			<%@include file="../../../include/xdmin/jsp/menu.jsp" %>
				<section class="col-10">
 					<span class="m-4"><b>회원관리</b></span>
 					<form method="post" id="form" name="form">
 					<input type="hidden" name="seq" value="<c:out value="${vo.seq}"/>"/>
					<div id="searchSection">
						<div class="d-flex">
							<select id="shDelNy" name="shDelNy" class="form-select text-input">
								<option value="">삭제여부</option>
								<option value="0" <c:if test="${vo.shDelNy eq 0 }">selected</c:if>>N</option>
								<option value="1" <c:if test="${vo.shDelNy eq 1 }">selected</c:if>>Y</option>
							</select>
							<select id="shDate" name="shDate" class="form-select text-input">
								<option value="0">날짜구분</option>
								<option value="1" <c:if test="${vo.shDate eq 1 }">selected</c:if>>등록일</option>
								<option value="2" <c:if test="${vo.shDate eq 2 }">selected</c:if>>수정일</option>
							</select>
							<input type="text" name="shStartDate" class="form-control text-input" placeholder="시작일" id="startDate" value="<c:out value="${vo.shStartDate }"/>">
							<input type="text" name="shEndDate" class="form-control text-input" placeholder="종료일" id="endDate" value="<c:out value="${vo.shEndDate }"/>">
						</div>
						<div class="d-flex">
							<select id="shOption" name="shOption" class="form-select text-input">
								<option value="0">검색구분</option>
								<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>이름</option>
								<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>이메일</option>
								<option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>전화번호</option>
							</select>
							<input type="text" id="shValue" name="shValue" class="form-control text-input" placeholder="검색어" value="<c:out value="${vo.shValue }"/>">
							<!-- <input type="submit" class="btn searchBtn"> -->
							<button type="submit" class="btn searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
							<button type="button" class="btn resetBtn"><i class="fa-solid fa-rotate-right"></i></button>
						</div>
					</div>
					<div class="memberList">
						<div class="d-flex p-2 justify-content-between">
							<div class="mt-2">
								<span class="p-2">검색 결과 회원수 : N</span>
								<span class="p-2 memberCount">총 회원수 : N</span>
							</div>
							<div>
								<button type="button" class="btn excelBtn"><i class="fa-solid fa-file-excel"></i></button>
								<a href="#" class="btn createBtn"><i class="fa-solid fa-circle-plus"></i></a>
							</div>
						</div>
						<table class="table text-center memberTable">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" id="chkAll"></th>
									<th scope="col">No</th>
									<th scope="col">이름</th>
									<th scope="col">성별</th>
									<th scope="col">생년월일</th>
									<th scope="col">이메일</th>
									<th scope="col">전화번호</th>
									<th scope="col">가입날짜</th>
									<th scope="col">마지막 접속 날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) eq 0}">
										<tr class="memberView">
											<td colspan="9">There is no data</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="list" varStatus="status">
											<tr class="memberView">
												<th scope="col"><input type="checkbox" class="chk"></th>
												<th scope="row">${status.count }</th>
												<td>${list.name }</td>
												<%-- <td>
													<c:choose>
														<c:when test="${list.gender eq 0}">남</c:when>
														<c:otherwise>여</c:otherwise>
													</c:choose>
												</td> --%>
												<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('1000')}"/>
												<td>
													<c:forEach items="${listCodeGender}" var="listGender" varStatus="statusGender">
														<c:if test="${list.gender eq listGender.seq}"><c:out value="${listGender.ccName }"/></c:if>
													</c:forEach>
												</td>
												<td><fmt:formatDate value="${list.birth}" pattern="yyyy-MM-dd"/></td>
												<td>${list.emailFull }</td>
												<td>
													<c:set var="phone1" value="${fn:substring(list.phone,0,3)}" />
													<c:set var="phone2" value="${fn:substring(list.phone,3,7)}" />
													<c:set var="phone3" value="${fn:substring(list.phone,7,11)}" />
													${phone1 }-${phone2 }-${phone3 }
												</td>
												<td><fmt:formatDate value="${list.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><fmt:formatDate value="${list.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<!-- pagination s -->
						<div class="d-flex justify-content-end">				
							<div>
								<button type="button" class="btn cancelBtn"><i class="fa-solid fa-xmark"></i></button>
								<button type="button" class="btn deleteBtn" data-bs-toggle="modal" data-bs-target="#memberDeleteModal" data-bs-whatever="true"><i class="fa-solid fa-trash-can"></i></a>
							</div>
						</div>
					</div>
					</form>
				</section>
			</section>
		</div>
	</div>
	
	<!-- modal -->
	<div class="modal fade" id="memberDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" role="document">
				<div class="modal-header">
					<h5 class="modal-title">회원삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body d-flex align-items-center">
					<p>삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn deleteBtn">삭제하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			/* var tableRow = document.getElementsByTagName('tr');
			tableRowCount = tableRow.length -1;
			console.log(tableRowCount);
			
			var memberCount = document.getElementsByClassName('memberCount');
			memberCount[0].innerHTML='<span class="p-2 memberCount">총 회원수 : ' + (tableRowCount) + '</span>'; */
			
			var form = $("form[name=form]");
			var seq = $("input:hidden[name=seq]");
			console.log(seq.val())
			
			goForm = function(keyValue) {
		    	seq.val(keyValue);
				form.attr("action", "/admin/memberRegForm").submit();
			}
			
			goList = function(thisPage) {
				$("input:hidden[name=thisPage]").val(thisPage);
				form.submit();
			}
		
			$('#memberDeleteModal').on('show.bs.modal', function () {
				if($(".chk").is(":checked") == false) {
					var button = $(event.relatedTarget);
					var recipient = button.data('whatever');
					var modal = $(this);
					modal.find('.modal-body p').text('삭제할 항목을 선택해주세요.');
					modal.find('.btn').text('확인');
					modal.find('.deleteBtn').remove();
					
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
			
			$(".resetBtn").on("click", function(){
				location.href="memberList";
			});
			
			$(".createBtn").on("click", function(){
				goForm(0);
			});
			
			$(".deleteBtn").on("click", function(e){
				var chkValue = $(this).data("chk-id");
				console.log(chkValue);
				
				/* var chkValue = $(".chk").is(":checked");
				console.log(chkValue); */
				
				if(chkValue == false) {
					alert("dd")
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
