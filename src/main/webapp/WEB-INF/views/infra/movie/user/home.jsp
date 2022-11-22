<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/static/image/logo_black.png">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<script type="text/javascript" src="/resources/static/js/header.js"></script>
	
	<link rel="stylesheet" href="/resources/static/css/main.css">
	
  	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>	
	
  	<!-- google font -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	
	<title>메인</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/user/jsp/header_dark.jsp" />
		<section class="main-movie">
			<div class="bg">
				<div class="bg-pattern"></div>
				<c:forEach items="${list }" var="list" varStatus="status">
					<c:if test="${list.ranking eq 1 }">
					<img height="885px" src="/resources/static/2022/<c:out value='${list.movieCode }'/>.png" onerror="noImg(this, 'main');">
					</c:if>
				</c:forEach>
			</div>
			<div class="cont-area">
				<div>
					<p class="boxo-tit">박스오피스</p>
					<a href="/movie/running" class="more-movie">더 많은 영화 보기</a>
					<ul class="rank-list">
						<c:forEach items="${list }" var="list" varStatus="status">
							<li class="rank-item">
								<p class="rank">${list.ranking }<span class="ir">위</span></p>
								<img class="poster" src="/resources/static/2022/<c:out value='${list.movieCode }'/>.png" />				
								<div class="fade-wrap">
									<div class="summary h-75">
										<span>${list.story }</span>
									</div>
								</div>
								<div class="alarm">
									<button type="button" class="alarmBtn" data-no="${list.movieCode }"><i class="fa-regular fa-bell"></i></button>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="search-area">
				<div class="search-link">
					<div class="cell">
						<form id="form" name="form" method="post" action="/movie/running">
							<div class="search">
								<input type="text" id="shMovieNm" name="shMovieNm" placeholder="영화명을 입력해 주세요" title="영화 검색" class="input-text" id="movieName">
								<button type="submit" class="btn" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
							</div>
						</form>
					</div>
					<div class="cell"><a href="/theater/time?brchNo=1372" title="상영시간표 보기"><i class="fa-solid fa-calendar-days mr-2"></i>상영시간표</a></div>
					<div class="cell"><a href="/movie/running" title="현재상영작 보기"><i class="fa-solid fa-film mr-2"></i>현재상영작</a></div>
					<div class="cell"><a href="/theater/list" title="극장위치 보기"><i class="fa-solid fa-ticket-simple mr-2"></i>극장위치</a></div>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="../../../include/user/jsp/footer.jsp" />
	
	<jsp:include page="../../../include/user/jsp/loginModal.jsp" />
	<jsp:include page="../../../include/user/jsp/alterModal.jsp" /> 
	
	<script>
		$(document).ready(function(){
			$(".rank-item").on("mouseover", function(e){
				if ($(e.target).is('.poster') || $(e.target).is('.rank')) {
					$(this).children(".fade-wrap").fadeIn();
			    }
			}); 
			
			$(".rank-item").on("mouseleave", function(){
				$(".fade-wrap").fadeOut();
			});
			
			$(".alarmBtn").on("click", function(){
				var movieCode = $(this).data("no");
				
				/* $("#form").submit(); */
				
				var loginId = "${loginId}"
				
				if(loginId == null || loginId == ''){
					$("#alertModal").find('.modal-body p').html('<p>로그인이 필요한 서비스입니다.</p>');
					$("#alertModal").modal('show');
					return false;
				} else {
					location.href="../movie/openAlarm?movieCode="+movieCode+"&pageType=running";
				}

			});
			
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>