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
	
	<title>현재 상영작</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/jsp/header_white.jsp" />
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<i class="fa-solid fa-house" onclick='location.href="/"' style="cursor:pointer"></i>
					<a href="running">영화</a>
					<a href="running">현재 상영작</a>
				</div>
			</div>
		</div>
		<div class="tap-menu">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-rank-tab" data-bs-toggle="tab" data-bs-target="#nav-rank" type="button" role="tab" aria-controls="nav-rank" aria-selected="true">현재 상영작</button>
					<button class="nav-link" id="nav-comingsoon-tab" data-bs-toggle="tab" data-bs-target="#nav-comingsoon" type="button" role="tab" aria-controls="nav-comingsoon" aria-selected="false">상영 예정작</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-rank" role="tabpanel" aria-labelledby="nav-rank-tab" tabindex="0">
					<div class="movie-list">
						<ul class="list" id="movieList">
							<c:forEach items="${list }" var="list" varStatus="status">
								<li tabindex="0" class="no-img">
								    <div class="movie-list-info">    
								        <img src="/resources/static/2022/<c:out value='${list.movieCode }'/>.png" class="poster lozad" onerror="noImg(this)" />    
								        <%-- <div class="movie-score" style="opacity: 0;">        
								            <a href="#" class="wrap movieBtn" data-no="" title="">            
								                <div class="summary">
								                    ${list.story }
								                </div>                   
								            </a>    
								        </div> --%>
								    </div>
								    <div class="tit-area">
								    	<c:set var="age" value="${list.age }"/>
								    	<c:choose> 
								    		<c:when test="${fn:contains(age, '전체')}">
										        <img src="/resources/static/image/txt-age-all.png" class="age-image">
								    		</c:when>
								    		<c:when test="${fn:contains(age, '12')}">
										        <img src="/resources/static/image/txt-age-12.png" class="age-image">
								    		</c:when>
								    		<c:when test="${fn:contains(age, '15')}">
										        <img src="/resources/static/image/txt-age-15.png" class="age-image">
								    		</c:when>
								    		<c:when test="${fn:contains(age, '청소년')}">
										        <img src="/resources/static/image/txt-age-19.png" class="age-image">
								    		</c:when>
								        </c:choose>
								        <p title="" class="tit">${list.title }</p>
								    </div>
								    <div class="rate-date">    
								        <span class="date">개봉일 ${list.openDate }</span>
								    </div>
								    <div class="btn-util">    
								        <button type="button" class="btn btn-like" data-no="22048000">
								            <i class="fa-regular fa-heart"></i> <span></span>
								        </button>    
								        <p class="txt movieStat2" style="display: none">9월 개봉예정</p>    
								        <p class="txt movieStat5" style="display: none">개봉예정</p>    
								        <div class="case movieStat4" style="">        
								            <a href="#" class="btn alarmBtn" data-no="${list.movieCode }" title="영화 예매하기">알림신청</a>    
								        </div>
								    </div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../../../include/jsp/loginModal.jsp" />
	
	<script>
		$(document).ready(function(){
			$('button[data-bs-toggle="tab"]').on("hidden.bs.tab", function(){
			});
			
			$('button[data-bs-toggle="tab"]').on("shown.bs.tab", function(){
				location.href="premovie"
			});
			
			$(".alarmBtn").on("click", function(){
				var movieCode = $(this).data("no");
				
				/* $("#form").submit(); */

				location.href="../movie/openAlarm?movieCode="+movieCode;
			});
			
			
		});
	</script>
	
</body>
</html>