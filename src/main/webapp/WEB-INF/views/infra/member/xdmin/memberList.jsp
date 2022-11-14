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
			<%@include file="../../../include/xdmin/jsp/menu.jsp" %>
				<section class="col-10">
 					<span class="m-4"><b>회원관리</b></span>
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
							<button type="button" class="btn searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
							<button type="button" class="btn resetBtn"><i class="fa-solid fa-rotate-right"></i></button>
						</div>
					</div>
					<div class="memberList">
					</div>
					</form>
				</section>
			</section>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			setLita();
			
			$(".searchBtn").on("click", function(){
				setLita();
			});
			
			/* var tableRow = document.getElementsByTagName('tr');
			tableRowCount = tableRow.length -1;
			console.log(tableRowCount);
			
			var memberCount = document.getElementsByClassName('memberCount');
			memberCount[0].innerHTML='<span class="p-2 memberCount">총 회원수 : ' + (tableRowCount) + '</span>'; */
			
			//var form = $("form[name=form]");
			//var seq = $("input:hidden[name=seq]");
			
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
			
			var page = 0;
			
			function setLita() {
				$.ajax({
					async: true 
					,cache: false
					,type: "post"
					,url: "/admin/memberLita"
					,data : $("#form").serialize()
					,success: function(response) {
						console.log(response)
						$(".memberList").empty();
						$(".memberList").append(response);
						page++;
						
					}
					,error : function(jqXHR, textStatus, errorThrown){
						alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
					}
				});
			}
			
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
