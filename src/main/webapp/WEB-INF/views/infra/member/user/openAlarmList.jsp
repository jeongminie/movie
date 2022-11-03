<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.*" %>
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
	
  	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
  	<!-- google font -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
	<title>마이페이지</title>
	
	<style>
		h2.tit {
		    padding: 0 0 26px 0;
		    font-size: 1.8666em;
		    font-weight: 400;
		    letter-spacing: -1px;
		    line-height: 1.1;
		    color: #222;
		}
		
		ol, ul {
		    list-style-type: none;
		    margin: 0;
		    padding: 0;
		}
		
		.dot-list>li:before {
		    content: '';
		    display: block;
		    position: absolute;
		    top: 9px;
		    left: 0;
		    background-color: #503396;
		    width: 3px;
		    height: 3px;
		}
		
		.mt0 {
		    margin-top: 0!important;
		}
		
		list-util:before {
		    content: '';
		    display: table;
		}
		
		.board-list-util .result-count {
		    position: relative;
		    float: left;
		    margin: 0;
		    padding-top: 15px;
		    line-height: 1.1;
		    vertical-align: top;
		}
		
		.table-wrap {
		    position: relative;
		    border-top: 1px solid #555;
		    margin-top : 10px;
		}
		
		.board-list {
		    line-height: 1.3;
		}
		
		table caption {
		    overflow: hidden;
		    width: 0;
		    height: 0;
		    font-size: 0;
		    line-height: 0;
		    opacity: 0;
		}
		
		.board-list>thead>tr>th {
		    height: 45px;
		    padding: 3px 10px;
		    color: #222;
		    border: 1px solid #eaeaea;
		    border-width: 0 0 1px 0;
		    background-color: #f2f4f5;
		    text-align: center;
		}
		
		table {
		    width: 100%;
		    margin: 0;
		    border: 0;
		    table-layout: fixed;
		    border-collapse: collapse;
		    empty-cells: show;
		}
		
		.board-list>tbody>tr>td, .board-list>tbody>tr>th {
		    height: 45px;
		    padding: 10px;
		    border: 1px solid #eaeaea;
		    border-width: 0 0 1px 0;
		    text-align: center;
		    font-weight: normal;
		}
		
		tbody {
			font-weight: lighter !important;
		}
		
.inner-wrap:after, .inner-wrap:before {
    content: '';
    display: table;
}

.inner-wrap:after {
    clear: both;
}
	</style>
		
</head>
<body>
	<div id="wrap">
		<input type="hidden" name="userSeq" value="${sessSeq }">
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
			<div id="contents">
				<h2 class="tit">예매오픈 알림 신청 내역</h2>
				<ul class="dot-list">
					<li>예매오픈 알림 신청 내역을 확인하실 수 있습니다.</li>
				</ul>
				<div class="table-wrap">
					<table class="board-list">
						<caption>게시판 목록 제목</caption>
						<colgroup>
							<col style="width:50px;">
							<col style="width:80px;">
							<col style="width:100px;">
							<col style="width:130px;">
							<col style="width:100px;">
							<col style="width:50px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">속성</th>
								<th scope="col">극장</th>
								<th scope="col">영화</th>
								<th scope="col">날짜</th>
								<th scope="col">알림상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) eq 0}">
									<tr><td colspan="6" class="a-c">조회된 내역이 없습니다.</td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list }" var="list" varStatus="status">
										<tr>
											<th>${status.count }</th>
											<th>${list.theabNm }</th>
											<th>${fn:replace(list.brchNm, '메가박스', '')}</th>
											<th>${list.movieNm }</th>
											<fmt:parseDate var="playDe" value="${list.playDe}" pattern="yyyyMMdd"/>
											<fmt:formatDate var="playDe2" value="${playDe}" pattern="yyyy-MM-dd"/>
											<th>${playDe2 }</th>
											<c:choose>
												<c:when test="${list.state eq 1}">
													<th>알림 예약</th>
												</c:when>
												<c:otherwise>
													<th>알림 완료</th>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- pagination -->
				<!--// pagination -->
			</div>
		</div>
	</div>
	<jsp:include page="../../../include/user/jsp/footer.jsp" />
	
	<jsp:include page="../../../include/user/jsp/loginModal.jsp" /> 
	
	<script>
		function setEmptyImage(img) {
			img.src='/resources/static/image/noImg2.png';
			$(img).addClass('noImg');
		}
		
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
		
		$(document).ready(function(){
				 
			$("#profileUploaded").change(function(e){
				readURL(this);
			});
				
			$(".fa-circle-plus").on("click", function(){
				$("#profileUploaded").click();
			});
			
			$("#profileUploaded").on("change", function(e){
				console.log($("#profileUploaded")[0].files[0])
			
				/* $("#form").submit(); */
				var filePath = $("input[name='filePath']").val();
				
 				var formData = new FormData();
				formData.append("profileUploaded", $("#profileUploaded")[0].files[0]);
				formData.append("filePath", filePath);
				
				$.ajax({
					type : "POST",
					enctype:"mutipart/form-data",
					url:"profileUploaded",
					processData: false,
					contentType: false,
					data: formData,
					dataType: "json",
					success : function(data) {
					}
				});
				
				alert("프로필 사진이 등록되었습니다.")
			})
			
		})
	
	</script>
	
	
</body>
</html>