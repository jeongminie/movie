<!-- jsoup -->
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<title>상영시간표</title>
		
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/jsp/header_white.jsp" />
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<i class="fa-solid fa-house" onclick='location.href="/"' style="cursor:pointer"></i>
					<a href="#">극장</a>
					<a href="time?brchNo=1372">상영시간표</a>
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
									<li class="theater"><a href="#" title="강남 상세보기" data-id="1372">강남</a></li>
									<li class="theater"><a href="#" title="강남대로(씨티) 상세보기" data-id="0023">강남대로(씨티)</a></li>
									<li class="theater"><a href="#" title="강동 상세보기" data-id="1341">강동</a></li>
									<li class="theater"><a href="#" class="theater" title="군자 상세보기" data-id="1431">군자</a></li>
									<li class="theater"><a href="#" class="theater" title="동대문 상세보기" data-id="1003">동대문</a></li>
									<li class="theater"><a href="#" class="theater" title="마곡 상세보기" data-id="1572">마곡</a></li>
									<li class="theater"><a href="#" class="theater" title="목동 상세보기" data-id="1581">목동</a></li>
									<li class="theater"><a href="#" class="theater" title="상봉 상세보기" data-id="1311">상봉</a></li>
									<li class="theater"><a href="#" class="theater" title="상암월드컵경기장 상세보기" data-id="1211">상암월드컵경기장</a></li>
									<li class="theater"><a href="#" class="theater" title="성수 상세보기" data-id="1331">성수</a></li>
									<li class="theater"><a href="#" class="theater" title="센트럴 상세보기" data-id="1371">센트럴</a></li>
									<li class="theater"><a href="#" class="theater" title="송파파크하비오 상세보기" data-id="1381">송파파크하비오</a></li>
									<li class="theater"><a href="#" class="theater" title="신촌 상세보기" data-id="1202">신촌</a></li>
									<li class="theater"><a href="#" class="theater" title="이수 상세보기" data-id="1561">이수</a></li>
									<li class="theater"><a href="#" class="theater" title="창동 상세보기" data-id="1321">창동</a></li>
									<li class="theater"><a href="#" class="theater" title="코엑스 상세보기" data-id="1351">코엑스</a></li>
									<li class="theater"><a href="#" class="theater" title="홍대 상세보기" data-id="1212">홍대</a></li>
									<li class="theater"><a href="#" class="theater" title="화곡 상세보기" data-id="1571">화곡</a></li>
									<li class="theater"><a href="#" class="theater" title="ARTNINE 상세보기" data-id="1562">ARTNINE</a></li>
								</ul>
							</div>
						</li>
						<li class="">
						</li>
					</ul>
				</div>
				<p class="name" id="theaterNm">강남</p>
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
									<td class="dateBtn" style="cursor:pointer;">
									<input type="hidden" value="${year}${month}${dateList}" class="date" >
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
	function ajax(date) {
		var query = window.location.search;
		var param = new URLSearchParams(query);
		var brchNo = param.get('brchNo');
		
		var theaterNm = $('[data-id="'+brchNo+'"]').text();
		
		$("#theaterNm").html(theaterNm);
		
		console.log(theaterNm)
		console.log(brchNo);
		
		$.ajax ({
			type : 'post',
			url : 'http://127.0.0.1:5000/tospring',
			data : {"date":date, "brchNo":brchNo},
			dataType : 'json',
			success : function(data) {
				var count = 1 
				
				for (var key in data) {
					
					var theaterTit = '<div id="title'+count+'" class="theater-list"><div class="theater-tit">'+key+'</div>'
					console.log(theaterTit)
					
					$(".theater-list-box").append(theaterTit);
					
					var key2 = Object.keys(data[key])
					
					for(var key2 in data[key]) {
						
						var theaterType = '<div id="t'+count+'-'+'theater'+key2+'" class="theater-type-box"><div class="theater-type"><p class="theater-name">'+ key2 +'관</p></div></div></div>'
						console.log(theaterType)
						
						$('#title'+ count).append(theaterType);
						
						var theaterTime = 
						'<div class="theater-time">'
							+'<div class="theater-time-box">'
								+'<table class="time-list-table">'
									+'<tbody>'
										+'<tr id="table'+key2+'">'+'</tr>'
									+'</tbody>'
								+'</table>'
							+'</div>'
						+'</div>'
						
						$('#t'+ count + '-' + 'theater'+ key2).append(theaterTime);
						
						for(var i = 0; i < data[key][key2].length; i++) {
							var td = '<td>'
										+'<div class="td-ab">'
											+'<div class="txt-center">'
												+'<p class="time">'+ data[key][key2][i][0] +'</p>'
												+'<p class="chair">'+ data[key][key2][i][1] +'</p>'
											+'</div>'
										+'</div>'
									 +'</td>'
									
							$('#t'+ count + '-' + 'theater'+ key2 + ' table tr').append(td)
						}
					}
					count++
				}
			},
			error : function() {
				alert('요청 실패쓰');
			}
		})
	
	}
	
	function getParameter(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
		
	$(document).ready(function(){
		$(".theater-list-box").empty();
		
		$('button[data-bs-toggle="tab"]').on("hidden.bs.tab", function(){
		});
		
		$('button[data-bs-toggle="tab"]').on("shown.bs.tab", function(){
			location.href="list"
		});
		
		var date = $(".date").val();

		ajax(date)
		
		$("#time").datepicker({
			dayNamesMin:['월', '화', '수', '목', '금', '토', '일']
		});
		
		$(".depth1, .area-depth2").on("mouseover", function(){
			$(".theater-detail-page .theater-all .theater-area-list .area-depth2").css("display", "block");
		});
		
		$(".depth1, .area-depth2").on("mouseleave", function(){
			$(".theater-detail-page .theater-all .theater-area-list .area-depth2").css("display", "none");
		});
		
		$(".dateBtn").on("click", function(){
			date =  $(this).children(".date").val();
			
			$(".theater-list-box").empty();
			ajax(date)
		})
		
		$(".theater").on("click", function(){
			date = $(".date").val();
			var brchNo = $(this).children("a").data("id");
			
			location.href="/theater/time?brchNo="+brchNo
			
			$(".theater-list-box").empty();
			ajax(date);
		})
		
		
	});
</script>
	
	
</body>
</html>