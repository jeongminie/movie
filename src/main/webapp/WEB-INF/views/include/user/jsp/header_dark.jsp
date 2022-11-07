<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<header>
	<div class="front-area">
		<div class="center-link">
			<!-- <a href="#"><img src="/resources/static/image/logo_white.png" class="logo"></a> -->
		</div>
		<div class="right-link d-flex justify-content-end">
			<c:choose>
				<c:when test="${not empty sessSeq}" >
					<a href="#" class="mr-3 userName">${name } 님</a>
					<a href="member/logout" class="logout">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="mr-3 login" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
					<a href="../member/signup" class="signup">회원가입</a>
				</c:otherwise>
			</c:choose>
		</div>
		<a id="logo" href="/">
			<img src="/resources/static/image/logo_white.png">
		</a>
		<nav class="menu mt-3">
			<ul class="nav nav-pills nav-fill">
				<li class="nav-item nav-title dropdown">
					<a class="nav-link nav-title-item dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" disabled>예매</a>
					<ul class="nav-sub dropdown-menu">
						<li><a class="nav-link" href="movie/running">오픈 알림 신청</a></li>
					</ul>
				</li>
				<li class="nav-item nav-title dropdown">
					<a class="nav-link nav-title-item dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" disabled>영화</a>
					<ul class="nav-sub dropdown-menu">
						<li><a class="nav-link" href="movie/running">현재 상영작</a></li>
						<li><a class="nav-link" href="movie/premovie">상영 예정작</a></li>
					</ul>
				</li>
				<li class="nav-item nav-title dropdown">
					<a class="nav-link nav-title-item dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" disabled>극장</a>
					<ul class="nav-sub dropdown-menu">
						<li><a class="nav-link" href="theater/list">위치</a></li>
						<li><a class="nav-link" href="theater/time?brchNo=1372">상영시간표</a></li>
					</ul>
				</li>
				<li class="nav-item nav-title" id="mypage">
					<a class="nav-link nav-title-item nav-txt-community" href="#" role="button" disabled>마이페이지</a>
				</li>
			</ul>
		</nav>
		<div class="user">
			<a href="#"><i class="fa-solid fa-user"></i></a>
		</div>	
	</div>
</header>

<script>
	$(document).ready(function(){
		$("#mypage").on("click", function(){
			var sessSeq = "${sessSeq}"
			if(sessSeq == null || sessSeq == ''){
				alert("로그인이 필요한 서비스 입니다.")
				return;
			} else {
				location.href="../mypage";
			}
		});
	});
</script>