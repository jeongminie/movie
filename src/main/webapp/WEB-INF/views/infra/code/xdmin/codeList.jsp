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
	
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<!-- 제이쿼리 ui css -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- 제이쿼리 js -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- 제이쿼리 ui js -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/static/css/xdmin/style.css">
	
	
	<title>코드관리</title>
	
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
			<jsp:include page="../../../include/jsp/menu.jsp" />				
 					<span class="m-4"><b>코드 관리</b></span>
 					<form method="post" id="form" name="form">
 					<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
					<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
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
								<input type="text" name="shStartDate" class="form-control text-input" placeholder="시작일" id="startDate">
								<input type="text" name="shEndDate" class="form-control text-input" placeholder="종료일" id="endDate">
							</div>
							<div class="d-flex">
								<select id="shOption" name="shOption" class="form-select text-input" data-selected="${vo.shOption }">
									<option value="0">검색구분</option>
									<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>코드</option>
									<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>코드 이름(한글)</option>
									<option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>코드 이름(영문)</option>
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
								<span class="p-2"><c:out value="Total : ${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></span>
							</div>
							<div>
								<button type="button" class="btn excelBtn"><i class="fa-solid fa-file-excel"></i></button>
								<button type="button" id="createBtn" class="btn createBtn"><i class="fa-solid fa-circle-plus"></i></button>
							</div>
						</div>
						<table class="table text-center codeGroupTable">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" id="chkAll"></th>
									<th scope="col">No</th>
									<th scope="col">코드그룹 코드</th>
									<th scope="col">코드그룹 이름(한글)</th>
									<th scope="col">코드</th>
									<th scope="col">대체 코드</th>
									<th scope="col">코드 이름(한글)</th>
									<th scope="col">코드 이름(영문)</th>
									<th scope="col">사용</th>
									<th scope="col">등록일</th>
									<th scope="col">수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) eq 0}">
										<tr class="memberView">
											<td colspan="8">There is no data</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="list" varStatus="status">
											<tr class="memberView" onclick="javascript:goForm(<c:out value="${list.seq }"/>)">
												<th scope="col"><input type="checkbox" class="chk"></th>
												<th scope="row">${status.count }</th>
												<td>${list.cgSeq }</td>
												<td>${list.cgName }</td>
												<td>${list.seq }</td>
												<td>${list.ccAnother }</td>
												<td>${list.ccName }</td>
												<td>${list.ccNameEng }</td>
												<td>
													<c:choose>
														<c:when test="${list.useNy eq 1 }">Y</c:when>
														<c:otherwise>N</c:otherwise>
													</c:choose>
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
						<%@include file="../../../include/jsp/pagination.jsp"%>
						<!-- pagination e -->
						<div class="d-flex justify-content-end">				
							<div>
								<button type="button" class="btn cancelBtn"><i class="fa-solid fa-xmark"></i></button>
								<button type="button" class="btn deleteBtn" data-bs-toggle="modal" data-bs-target="#codeGroupDeleteModal" data-bs-whatever="true"><i class="fa-solid fa-trash-can"></i></button>
							</div>
						</div>
					</div>
				</form>
				</section>
			</section>
		</div>
	</div>
	
	<!-- modal -->
	<jsp:include page="../../../include/jsp/loginModal.jsp" />
	<div class="modal fade" id="codeGroupDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" role="document">
				<div class="modal-header">
					<h5 class="modal-title">코드 삭제</h5>
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
		
		<!-- form -->

	
	<script>
		$(document).ready(function(){
			var form = $("form[name=form]");
			var seq = $("input:hidden[name=seq]");
			
			/* var tableRow = document.getElementsByTagName('tr');
			tableRowCount = tableRow.length -1;
			console.log(tableRowCount);
			
			var totalCount = document.getElementsByClassName('totalCount');
			totalCount[0].innerHTML='<span class="p-2 totalCount">Total : ' + tableRowCount + '</span>'; */
		
			$('#codeGroupDeleteModal').on('shown.bs.modal', function() {
				var button = $(event.relatedTarget);
				var recipient = button.data('whatever');
				var modal = $(this);
				
				if($(".chk").is(":checked") == false) {
					modal.find('.modal-body p').text('삭제할 항목을 선택해주세요.');
					modal.find('.closeBtn').text('확인');
					$(".modalDeleteBtn").hide();
				} else {
					modal.find('.modal-body p').text('삭제하시겠습니까?');
					modal.find('.closeBtn').text('취소');
					$(".modalDeleteBtn").show();
				}
			});

			$("#startDate").datepicker({
                dateFormat: "yy-mm-dd",
                dayNamesMin:['월', '화', '수', '목', '금', '토', '일'],
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                showMonthAfterYear: true,
                yearSuffix: '년',
                onSelect:function (dateText) { 
                    $( "#endDate" ).datepicker('option', 'minDate', dateText);
                }
			});
			
			$("#endDate").datepicker({
                dateFormat: "yy-mm-dd",
                dayNamesMin:['월', '화', '수', '목', '금', '토', '일'],
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                showMonthAfterYear: true,
                yearSuffix: '년'
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
			
			$('#createBtn').on("click", function() {
				goForm(0);                
			});
			
			goForm = function(keyValue) {
		    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
		    	seq.val(keyValue);
				form.attr("action", "codeForm").submit();
			}

			goList = function(thisPage) {
				$("input:hidden[name=thisPage]").val(thisPage);
				form.submit();
			}
			
			$(".resetBtn").on("click", function(){
				location.href="codeList";
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
			
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
