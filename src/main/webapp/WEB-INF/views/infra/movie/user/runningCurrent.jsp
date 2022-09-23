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
	
	<title>현재 상영영화</title>
	
	<style>
		.tap-menu {
			width : 60%;
			margin: auto;
			margin-top: 50px;
		}
		
		#nav-rank-tab, #nav-comingsoon-tab {
			width : 50%
		}
		
		.nav-tabs .nav-link.active {
			border-color: #503396 #503396 #fff;
		}
		
		.nav-tabs .nav-link {
			border: 1px solid #EBEBEB;
			border-radius: 0px;
		}

		.movie-list {
		    letter-spacing: 0;
		    margin-top: 50px;
		}
		
		.movie-list ul {
		    margin-left: -60px;
		}	
		
		ul {
		    list-style-type: none;
		    margin: 0;
		    padding: 0;
		}
		
		.movie-list ul li {
		    overflow: hidden;
		    position: relative;
		    float: left;
		    width: 230px;
		    height: 450px;
		    margin: 0 0 0 60px;
		    padding: 0;
		    background-color: #fff;
		}
		
		.movie-list ul li .movie-list-info {
		    overflow: hidden;
		    display: block;
		    position: relative;
		    height: 331px;
		    text-decoration: none;
		    background-color: #f5f5f5;
		}
		
		.movie-list ul li.no-img .movie-list-info .rank {
		    background-image: none;
		}
		
		.movie-list ul li .movie-list-info img.poster {
		    width: 230px;
		    height: 331px;
		}
		
		.movie-list ul li .movie-list-info .movie-score {
		    position: absolute;
		    left: 0;
		    top: 0;
		    z-index: -1;
		    width: 230px;
		    height: 331px;
		    color: #fff;
		    opacity: 0;
		}
		
		.movie-list ul li .movie-list-info .movie-score .wrap {
		    position: relative;
		    display: block;
		    width: 100%;
		    height: 100%;
		    padding: 20px;
		    color: #fff;
		    background-color: rgba(0,0,0,.8);
		}
		
		.movie-list ul li .tit-area {
	    position: relative;
	    width: 100%;
	    margin: 5px 0 0 0;
	    line-height: 25px;
	    text-align: center;
		}
	
		.movie-list ul li .tit-area .movie-grade {
		    position: absolute;
		    left: 0;
		    top: 50%;
		    margin-top: -10px;
		}
		
		.movie-list ul li .tit-area .tit {
		    overflow: hidden;
		    display: block;
		    width: 100%;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    padding: 2px 0 0 1px;
		    font-size: 1.3333em;
		    font-weight: 400;
		    margin: 0px;
		}
		
		.movie-list ul li .rate-date {
		    overflow: hidden;
		    padding: 0px 0 0 0;
		}
		
		.movie-list ul li .rate-date .date {
		    display: flex;
		    justify-content: center;
		}
		
		.movie-list ul li .rate-date span.rate {
		    margin: 0 7px 0 0;
		    padding: 0 8px 0 0;
		}
		
		.movie-list ul li .rate-date span {
		    display: block;
		    position: relative;
		   /*  float: left; */
		}
		
		.movie-list ul li .btn-util {
		    overflow: hidden;
		    /* position: absolute; */
		    left: 0;
		    bottom: 0;
		    width: 100%;
		    height: 36px;
		    margin-top: 5px;
		}
		
		.movie-list ul li .btn-util .btn-like {
		    float: left;
		    width: 72px;
		    height : 30px;
		    margin: 0;
		    padding-top: 3px;
		    font-size: .8667em;
		    border-color: #ebebeb;
		}
		
		.movie-list ul li .btn-util .case {
		    float: left;
		    width: 153px;
		    margin-left: 5px;
		}
		
		
		.movie-list ul li .btn-util .case .btn {
		    display: block;
		    float: left;
		    width: 100%;
		    height : 30px;
		    margin: 0;
		    padding-top: 3px;
		    color : white !important;
		    background-color: #503396;
		    border : 0px;
		}
			
	</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/jsp/header_white.jsp" />
		<div class="tap-menu">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link" id="nav-rank-tab" data-bs-toggle="tab" data-bs-target="#nav-rank" type="button" role="tab" aria-controls="nav-home" aria-selected="true">박스오피스</button>
					<button class="nav-link active" id="nav-comingsoon-tab" data-bs-toggle="tab" data-bs-target="#nav-comingsoon" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">현재 상영영화</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-comingsoon" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
					<div class="movie-list">
						<ul class="list" id="movieList">
							<c:forEach items="${list }" var="list" varStatus="status">
								<li tabindex="0" class="no-img">
								    <div class="movie-list-info">    
								        <img src="/resources/static/2022/<c:out value='${list.movieCode }'/>.png" class="poster lozad" onerror="noImg(this)" />    
								        <div class="movie-score" style="opacity: 0;">        
								            <a href="#" class="wrap movieBtn" data-no="" title="">            
								                <div class="summary">
								                    ${list.story }
								                </div>                   
								            </a>    
								        </div>
								    </div>
								    <div class="tit-area">    
								        <!-- <p class="movie-grade age-all">,</p> -->    
								        <p title="" class="tit">${list.title }</p>
								    </div>
								    <div class="rate-date">    
								        <span class="date">개봉일 ${list.openDate }</span>
								    </div>
								    <div class="btn-util">    
								        <button type="button" class="btn btn-like" data-no="22048000">
								            <i class="fa-regular fa-heart"></i> <span>72</span>
								        </button>    
								        <p class="txt movieStat2" style="display: none">9월 개봉예정</p>    
								        <p class="txt movieStat5" style="display: none">개봉예정</p>    
								        <p class="txt movieStat6" style="display: none">상영종료</p>    
								        <div class="case movieStat4" style="">        
								            <a href="#" class="btn bokdBtn" data-no="22048000" title="영화 예매하기">예매</a>    
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
				location.href="boxoffice"
			});
			
			
		});
	</script>
	
</body>
</html>