<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<title>박스오피스</title>
	
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
	</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/jsp/header_white.jsp" />
		<div class="tap-menu">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-rank-tab" data-bs-toggle="tab" data-bs-target="#nav-rank" type="button" role="tab" aria-controls="nav-home" aria-selected="true">박스오피스</button>
					<button class="nav-link" id="nav-comingsoon-tab" data-bs-toggle="tab" data-bs-target="#nav-comingsoon" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">현재 상영작</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-rank" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
					<div class="movie-list">
						<ul class="list" id="movieList">
							<li tabindex="0" class="no-img">
							    <div class="movie-list-info">    
							        <img src="https://img.megabox.co.kr/SharedImg/2022/08/23/Pg9A21HlZATWkTTLv3diyK25gjW4wXX5_420.jpg" alt="극장판 엄마 까투리: 도시로 간 까투리 가족" class="poster lozad" onerror="noImg(this)">    
							        <div class="movie-score" style="opacity: 0;">        
							            <a href="#" class="wrap movieBtn" data-no="22048000" title="극장판 엄마 까투리: 도시로 간 까투리 가족 상세보기">            
							                <div class="summary">
							                    대한민국 대표 애니메이션 ‘엄마 까투리’의 첫 번째 극장판
							                    새로운 보금자리를 찾아 나선 까투리 가족의 위대한 여정이 시작된다!
							
							                    엄마 까투리와 꺼병이 4남매는 평화로웠던 숲이 아파트 개발로 위험해지자,
							                    정든 보금자리를 뒤로하고 서둘러 이사를 결심한다.
							                    건너편 산으로 가기 위해서는 위험천만한 도시 한 가운데를 지나야만 하는 상황!
							                    다행히 쥐돌이 가족의 도움으로 하룻밤 안식처를 구하지만, 그것도 잠시…
							                    호시탐탐 꺼병이들을 노리는 도시 길냥이들을 엄마가 혼쭐 내주는 사이,
							                    꺼병이들은 사라져버리고, 아이들을 찾아 나서는 엄마 역시 큰 위험에 처하게 되는데…
							
							                    과연, 헤어진 엄마 까투리와 꺼병이 4남매는 무사히 새 집에 도착할 수 있을까?
							                </div>                   
							            </a>    
							        </div>
							    </div>
							    <div class="tit-area">    
							        <!-- <p class="movie-grade age-all">,</p> -->    
							        <p title="극장판 엄마 까투리: 도시로 간 까투리 가족" class="tit">극장판 엄마 까투리: 도시로 간 까투리 가족</p>
							    </div>
							    <div class="rate-date">    
							        <span class="date">개봉일 2022.09.08</span>
							    </div>
							    <div class="btn-util">    
							        <button type="button" class="button btn-like" data-no="22048000">
							            <i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>72</span>
							        </button>    
							        <p class="txt movieStat2" style="display: none">9월 개봉예정</p>    
							        <p class="txt movieStat5" style="display: none">개봉예정</p>    
							        <p class="txt movieStat6" style="display: none">상영종료</p>    
							        <div class="case col-2 movieStat3" style="display: none">        
							            <a href="#" class="button purple bokdBtn" data-no="22048000" title="영화 예매하기">예매</a>        
							            <a href="#" class="button purple img splBtn" data-no="22048000">
							                <img src="/static/pc/images/common/btn/mov_list_db_btn.png" alt="dolby 버튼">
							            </a>    
							        </div>    
							        <div class="case movieStat4" style="">        
							            <a href="#" class="button purple bokdBtn" data-no="22048000" title="영화 예매하기">예매</a>    
							        </div>
							    </div>
							</li>
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
				location.href="current"
			});
		});
			
	</script>
	
</body>
</html>