<!-- jsoup -->
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
	
	<title>상영시간표</title>
		
</head>
<body>
	<div id="wrap">
	${data}
		<jsp:include page="../../../include/jsp/header_white.jsp" />
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<i class="fa-solid fa-house" onclick='location.href="/"' style="cursor:pointer"></i>
					<a href="theater">극장</a>
					<a href="premovie">위치</a>
				</div>
			</div>
		</div>
		<div class="theater-detail-page">
			<div class="bg-img" style="background-image:url('/resources/static/image/img-theater-detail.jpg');"></div>
			<div class="bg-mask"></div>
			<div class="theater-all">
				<div class="theater-area-list">
					<ul class="area-depth1">
						<li class="on">
							<a href="" class="depth1" title="서울 선택">서울</a>
							<div class="area-depth2">
								<ul>
									<li class="on">
										<a href="/theater?brchNo=1372" title="강남 상세보기">강남
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=0023" title="강남대로(씨티) 상세보기">강남대로(씨티)
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1341" title="강동 상세보기">강동
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1431" title="군자 상세보기">군자
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1003" title="동대문 상세보기">동대문
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1572" title="마곡 상세보기">마곡
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1581" title="목동 상세보기">목동
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1311" title="상봉 상세보기">상봉
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1211" title="상암월드컵경기장 상세보기">상암월드컵경기장
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1331" title="성수 상세보기">성수
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1371" title="센트럴 상세보기">센트럴
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1381" title="송파파크하비오 상세보기">송파파크하비오
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1202" title="신촌 상세보기">신촌
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1561" title="이수 상세보기">이수
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1321" title="창동 상세보기">창동
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1351" title="코엑스 상세보기">코엑스
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1212" title="홍대 상세보기">홍대
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1571" title="화곡 상세보기">화곡
										</a>
									</li>
									<li>
										<a href="/theater?brchNo=1562" title="ARTNINE 상세보기">ARTNINE
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="">
						</li>
					</ul>
				</div>
				<p class="name">강남</p>
			</div>
		</div>
		<div class="tap-menu">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link" id="nav-theater-tab" data-bs-toggle="tab" data-bs-target="#nav-theater" type="button" role="tab" aria-controls="nav-theater" aria-selected="true">위치</button>
					<button class="nav-link active" id="nav-time-tab" data-bs-toggle="tab" data-bs-target="#nav-time" type="button" role="tab" aria-controls="nav-time" aria-selected="false">상영 시간표</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-time" role="tabpanel" aria-labelledby="nav-time-tab" tabindex="0">
					<div>
						<span class="d-flex justify-content-center mt-5">상영시간표</span>
						<table class="table calendarTable">
							<tr>
								<c:forEach items="${dateList }" var="dateList" varStatus="status">
									<td>
										<c:choose>
											<c:when test="${dayOfWeek[status.index] eq '토'}">
												<span style="color: blue">${dateList }<br>${dayOfWeek[status.index]}</span> 
											</c:when>
											<c:when test="${dayOfWeek[status.index] eq '일'}">
												<span style="color: red">${dateList }<br>${dayOfWeek[status.index]}</span> 
											</c:when>
											<c:otherwise>
												${dateList }<br>${dayOfWeek[status.index]}
											</c:otherwise>
										</c:choose>
									</td>
								</c:forEach>
							</tr>
						</table>	
					</div>
					<div class="reserve theater-list-box">
					</div>
				</div>
			</div>
		</div>
	</div> 
	<script>
		$(document).ready(function(){
			
			$("#time").datepicker({
				dayNamesMin:['월', '화', '수', '목', '금', '토', '일']
			});
			
			$(".depth1, .area-depth2").on("mouseover", function(){
				$(".theater-detail-page .theater-all .theater-area-list .area-depth2").css("display", "block");
			});
			
			$(".depth1, .area-depth2").on("mouseleave", function(){
				$(".theater-detail-page .theater-all .theater-area-list .area-depth2").css("display", "none");
			});
			
			$.ajax({
				type : 'get',
				url : 'http://127.0.0.1:5000/tospring',
				data : {},
				dataType : 'json',
				success : function(data) {
					console.log(data)
					
					
					
					for (var key in data) {
						 
						var theaterTit = '<div class="theater-list"><div class="theater-tit">'+key+'</div>'
						console.log(theaterTit)
						
						$(".theater-list-box").append(theaterTit);
						
						var key2 = Object.keys(data[key])

						for(var key2 in data[key]) {
						
							var div = '<div class="theater-type-box"></div>'
							
							var theaterType = '<div class="theater-type-box"><div class="theater-type"><p class="theater-name">'+ key2 +'관</p></div></div></div>'
							console.log(theaterType)
							
							$(".theater-list").append(theaterType);
							
							
						}
						
						console.log("---------------------")
						
/* 							var key2 = Object.keys(data[key]) //dic2의 키
							console.log(key2)
							
							console.log(data[key][key2[i]]) //n관 배열
							//console.log(data[key][key2[i]].length)
							
							
								//console.log(data[key][key2[i]][j])
							
							var theaterTime = 
								'<div class="theater-time">'
									+'<div class="theater-time-box">'
										+'<table class="time-list-table">'
											+'<tbody>'
												+'<tr>'
												
												+'</tr>'
											+'</tbody>'
										+'</table>'
									+'</div>'
								+'</div>'
								
								for(var j = 0; j < data[key][key2[i]].length; j++) {
									var td = 
										'<td>'
											+'<div class="td-ab">'
												+'<div class="txt-center">'
													+'<p class="time">'+ data[key][key2[i]][j][0] +'</p>'
													+'<p class="chair">'+ data[key][key2[i]][j][1] +'</p>'
												+'</div>'
											+'</div>'
										+'</td>'
									
									console.log(td)
								}
								
						
						 */
						
						
						/* $(".theater-list-box").append(
							'<div class="theater-list">'
								+'<div class="theater-tit">'+key+'</div>'
							+'</div>'
						) */
						
						
						/* $(".theater-tit").after(
							'<div class="theater-type-box">'	
								+'<div class="theater-type">'
									+'<p class="theater-name">'+ key2[i] +'관</p>'
								+'</div>'
							+'</div>'
						) */
						
					}
				  },
				  error : function() {
				  	alert('요청 실패쓰');
				  }
				})
			
		});
	</script>
	
	
</body>
</html>