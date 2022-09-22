<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
	<div class="front-area">
		<div class="center-link">
			<!-- <a href="#"><img src="/resources/static/image/logo_black.png" class="logo"></a> -->
		</div>
		<div class="right-link d-flex justify-content-end">
			<a href="#" class="mr-3 login" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
			<a href="#" class="signup">회원가입</a>
		</div>
		<nav class="menu mt-3">
			<ul class="nav nav-pills nav-fill">
				<li class="nav-item nav-title dropdown">
					<a class="nav-link nav-title-item dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" disabled>예매</a>
					<ul class="nav-sub dropdown-menu">
						<li><a class="nav-link" href="#">오픈 알림 신청</a></li>
					</ul>
				</li>
				<li class="nav-item nav-title dropdown">
					<a class="nav-link nav-title-item dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" disabled>영화</a>
					<ul class="nav-sub dropdown-menu">
						<li><a class="nav-link" href="#">박스오피스</a></li>
						<li><a class="nav-link" href="#">상영예정작</a></li>
					</ul>
				</li>
				<li class="nav-item nav-title dropdown">
					<a class="nav-link nav-title-item dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" disabled>극장</a>
					<ul class="nav-sub dropdown-menu">
						<li><a class="nav-link" href="#">위치</a></li>
						<li><a class="nav-link" href="#">상영시간표</a></li>
					</ul>
				</li>
				<li class="nav-item nav-title">
					<a class="nav-link nav-title-item" href="#" role="button" disabled>마이페이지</a>
				</li>
			</ul>
		</nav>
		<div class="user">
			<a href="#"><i class="fa-solid fa-user"></i></a>
		</div>	
	</div>
	<div class="page-util">
		<div class="inner-wrap">
			<div class="location">
				<i class="fa-solid fa-house"></i>
				<a href="#" title="예매 페이지로 이동">극장</a>
				<a href="#" title="예매 페이지로 이동">상영시간표</a>
			</div>
			
		</div>
	</div>
</header>