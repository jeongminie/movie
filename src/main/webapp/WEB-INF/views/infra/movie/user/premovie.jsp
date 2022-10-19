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
	
	<title>상영 예정작</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/jsp/header_white.jsp" />
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<i class="fa-solid fa-house" onclick='location.href="/"' style="cursor:pointer"></i>
					<a href="running">영화</a>
					<a href="premovie">상영 예정작</a>
				</div>
			</div>
		</div>
		<div class="tap-menu">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link" id="nav-rank-tab" data-bs-toggle="tab" data-bs-target="#nav-rank" type="button" role="tab" aria-controls="nav-rank" aria-selected="false">현재 상영작</button>
					<button class="nav-link active" id="nav-comingsoon-tab" data-bs-toggle="tab" data-bs-target="#nav-comingsoon" type="button" role="tab" aria-controls="nav-comingsoon" aria-selected="true">상영 예정작</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-comingsoon" role="tabpanel" aria-labelledby="nav-comingsoon-tab" tabindex="0">
					<div class="movie-list-util mt40">
						<div class="topSort" style="display: block;">
						    <div class="movie-sorting sortTab">
						        <span><button type="button" class="btn on" sort-type="rfilmDe">개봉일순</button></span>
						        <span><button type="button" class="btn" sort-type="title">가나다순</button></span>
						    </div>
						</div>
						<!-- 검색결과 없을 때 -->
						<p class="no-result-count"><strong id="totCnt"><c:out value="${fn:length(list)}"/></strong>개의 영화가 검색되었습니다.</p>
						<!--// 검색결과 없을 때 -->
						<div class="movie-search">
						<form id="form" name="form" method="post" action="premovie">
						    <input type="text" title="영화명을 입력하세요" id="shMovieNm" name="shMovieNm" placeholder="영화명 검색" class="input-text">
						    <button type="submit" class="btn-search-input" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
						</form>
						</div>
					</div>
					<div class="movie-list">
						<c:choose>
							<c:when test="${fn:length(list) eq 0}">
								<div class="movie-list-no-result" id="noDataDiv" style="">
									<p>현재 상영중인 영화가 없습니다.</p>
								</div>
							</c:when>
							<c:otherwise>
								<ul class="list" id="movieList">
									<c:forEach items="${list }" var="list" varStatus="status">
										<li tabindex="0" class="no-img">
										    <div class="movie-list-info">    
										        <img src="/resources/static/2022/<c:out value='${list.movieCode }'/>.png" class="poster lozad" onerror="setEmptyImage(this)"/>    
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
										    <div class="btn-util" id="btn-util-${list.movieCode }">    
										        <button type="button" class="btn btn-like" data-no="${list.movieCode }">
												    <c:choose> 
												        <c:when test="${list.existLike eq 0 || empty list.existLike}">
												            <i class="fa-regular fa-heart" id="heartIcon-${list.movieCode }"></i> <span id="likeCount-${list.movieCode }">${list.totalCountLike }</span>
												        </c:when>
												        <c:otherwise>
												        	<i class="fa-solid fa-heart" id="heartIcon-${list.movieCode }"></i> <span id="likeCount-${list.movieCode }">${list.totalCountLike }</span>
												        </c:otherwise>
												    </c:choose>
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
							</c:otherwise>
						</c:choose>
					</div>
					<div class="btn-more v1" id="addMovieDiv" style="">
						<button type="button" class="btn" id="btnAddMovie">더보기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../../../include/jsp/loginModal.jsp" />
	
	<%@ include file="../../../include/jsp/likeAndSearch.jsp"%>
	
	 <script>
		$(document).ready(function(){
			$('button[data-bs-toggle="tab"]').on("hidden.bs.tab", function(){
			});
			
			$('button[data-bs-toggle="tab"]').on("shown.bs.tab", function(){
				location.href="running"
			});
			
			$("#nav-comingsoon-tab").on("click", function(){
				location.href="premovie";
			});
			
		});
	</script>
	
</body>
</html>