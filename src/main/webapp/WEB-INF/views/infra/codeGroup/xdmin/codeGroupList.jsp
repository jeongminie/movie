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
	
	<link rel="stylesheet" href="/resources/static/css/xdmin/style.css">
	
	<title>코드그룹 관리</title>
	
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
		
		#shPageNum {
			width : 15px;
			height: 36px;
  			margin-right: 10px;
  			padding-left: 10px;
    		width: 68px;
		}
		
		.fa-circle-plus {
			margin-top: 6px;
		}
	</style>
	
</head>
<body>
	<div id="wrap">
		<div>
			<%@include file="../../../include/jsp/menu.jsp" %>
 					<span class="m-4"><b>코드그룹 관리</b></span>
 					<form method="post" action="/codeGroup/codeGroupList">
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
									<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>코드그룹 코드</option>
									<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>코드그룹 이름(한글)</option>
									<option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>코드그룹 이름(영문)</option>
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
								<span class="p-2">검색 결과 : ${shTotal }</span>
								<span class="p-2 totalCount">Total : ${total }</span>
							</div>
							<div class="d-flex">
								<select name="shPageNum" id="shPageNum" class="form-select">
									<option value="5" <c:if test="${vo.shPageNum eq 5 }">selected</c:if>>5</option>
									<option value="10" <c:if test="${vo.shPageNum eq 10 }">selected</c:if>>10</option>
									<option value="15" <c:if test="${vo.shPageNum eq 15 }">selected</c:if>>15</option>
								</select>
								<button type="button" class="btn excelBtn"><i class="fa-solid fa-file-excel"></i></button>
								<a href="#" class="btn createBtn"><i class="fa-solid fa-circle-plus"></i></a>
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
								<c:choose>
									<c:when test="${fn:length(list) eq 0}">
										<tr class="codeGroupView">
											<td colspan="8">There is no data</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list }" var="list" varStatus="status">
											<tr class="codeGroupView" onclick="location.href='codeGroupForm?seq=${list.seq}'">
												<th scope="col"><input type="checkbox" class="chk" data-cg-seq="${list.seq }"></th>
												<th scope="row">${status.count }</th>
												<td>${list.cgSeq }</td>
												<td>${list.cgName }</td>
												<td>${list.cgNameEng }</td>
												<td>${list.cnt }</td>
												<td><fmt:formatDate value="${list.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><fmt:formatDate value="${list.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<nav aria-label="Page navigation example" class="d-flex justify-content-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li class="page-item">
										<a class="page-link" href="<c:url value='codeGroupList?nowPage=${pageMaker.startPage-1 }&shPageNum=${vo.shPageNum }' />">이전</a>
									</li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
									<li class="page-item">
										<a class="page-link" href="<c:url value='codeGroupList?nowPage=${pageNum}&shPageNum=${vo.shPageNum }'/>">${pageNum}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
									<li class="page-item">
										<a class="page-link" href="<c:url value='codeGroupList?nowPage=${pageMaker.endPage+1 }&shPageNum=${vo.shPageNum }' />">다음</a>
									</li>
								</c:if>
							</ul>
						</nav>
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
						<button type="button" class="btn deleteBtn modalDeleteBtn" id="cgDeleteBtn">삭제</button>
					</div>
				</div>
			</div>
		</div>
	
	<script>
		$("#startDate").datepicker({
			dateFormat: "yy-mm-dd",
	        dayNamesMin:['월', '화', '수', '목', '금', '토', '일'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        showMonthAfterYear: true,
	        yearSuffix: '년',
	        onSelect:function (dateText) { //날짜가 선택되었을때 발생하는 이벤트
	            $("#endDate").datepicker('option', 'minDate', dateText);
	        }
		});
		
		$("#endDate").datepicker({
			minDate : 0, //minDate에 0을 주면 오늘날짜부터 선택
	        dateFormat: "yy-mm-dd",
	        dayNamesMin:['월', '화', '수', '목', '금', '토', '일'],
	        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        showMonthAfterYear: true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔줌
	        yearSuffix: '년'
		});
		
		$(document).ready(function(){
			
			$("#shPageNum").on("change", function(){
				$("form").submit();
			});

			/* $(".searchBtn").on("click", function(){
				var shDate = $("#shDate option:selected").val()
				var startDate = $("#startDate").val();
				var endDate = $("#endDate").val();
				alert(startDate)
				
				if(shDate == 0 && !startDate.equals("")) {
					alert("날짜구분선택")
				}
			}); */
			
		
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
			
			$("#chkAll").on("click", function(){
				if ($(this).is(":checked")) {
					$(".chk").prop("checked", true);
				} else {
					$(".chk").prop("checked", false);
				}
				console.log($(this).prop("checked"))
			});
			
			$(".chk").on("click", function(e){
				e.stopPropagation();
				
				var chkSeq = $(this).data("cg-seq");
				$("#cgDeleteBtn").data("cg-seq", chkSeq);
			});
			
			$(".createBtn").on("click", function(){
				location.href = 'codeGroupForm';
			});
			
			$(".resetBtn").on("click", function(){
				location.href="codeGroupList";
			});
			
			$("#cgDeleteBtn").on("click", function(e){
				var chkSeq = $(this).data("cg-seq");
				alert(chkSeq)
				$.ajax({
					type:"post"
					, url:"codeGroupDelete"
					, data:{"seq":chkSeq}
					, success:function(data){
						if(data.result) {
							alert("삭제 완료");
							location.href="codeGroupList";
						}
					}
				});
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>