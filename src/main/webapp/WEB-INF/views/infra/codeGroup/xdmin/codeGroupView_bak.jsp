<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/static/css/xdmin/style.css">
	
	<title>코드그룹 상세보기</title>
	
	<style>
		.frontSection {
			/* border-bottom: 1px solid #dee2e6; */
			height: 120px;
			text-align: center;
			padding: 20px;
		}
		
		.codeInfo {
			background-color : white;
			border : 1px solid #dee2e6;
			margin: 5px;
			padding : 20px;
		}
		
		.genderBtn {
			background-color: #2DD4CE;
			color : white;
		}
		
		.text-input {
			width : 100%;
			margin-top : 5px;
			margin-bottom: 10px;
		}
		
		#ui-datepicker-div {
			width : 350px;
		}
	</style>
</head>
<body>
	<div id="wrap">
		<form>
			<header class="d-flex">
				<a href="memberList.html" class="display-4 text-dark col-1" id="logo">Title</a>
				<nav class="sub-menu col-11 d-flex align-items-center justify-content-end">
					<ul class="nav">
					    <!-- <li class="nav-item"><a href="#" class="nav-link small-link"><i class="fa-solid fa-circle-user"></i></a></li> -->
					    <li class="nav-item"><a href="#" class="nav-link">로그인</a></li>
					    <li class="nav-item"><a href="#" class="nav-link">회원가입</a></li>
					</ul>                        
				</nav>
			</header>
			<section class="d-flex">
				<aside class="col-2">
					<nav class="main-nav">
						<ul class="nav flex-column">
							<li class="nav-item"><a href="#" class="nav-link">코드그룹관리</a></li>				
							<li class="nav-item"><a href="#" class="nav-link">코드관리</a></li>
							<li class="nav-item"><a href="#" class="nav-link">회원관리</a></li>
						</ul>
					</nav>
				</aside>
				<section class="col-10 p-4">
					<div class="frontSection">
						<span><b>STEP1.정보입력</b></span>
						<span>STEP2.등록완료</span>
						<h4 class="mt-4">코드그룹 정보를 수정해주세요</h4>
					</div>
					<div class="d-flex h-100">
						<div class="codeInfo col-6">
							<div>코드그룹 코드<input type="text" class="form-control text-input" placeholder="코드그룹 코드"></div>
							<div>코드그룹 이름 (한글)<input type="text" class="form-control text-input" placeholder="코드그룹 코드"></div>
							<div>
								<span>사용여부</span>
								<select class="form-select text-input">
									<option>Y</option>
									<option>N</option>
								</select>
							</div>
							<div>설명<textarea cols="30" class="form-control text-input"></textarea></div>
							<div>예비1 (varchar type)<input type="text" class="form-control text-input" placeholder="영문(대소문자),숫자"></div>
							<div>예비3 (varchar type)<input type="text" class="form-control text-input" placeholder="영문(대소문자),숫자"></div>
							<div>예비1 (int type)<input type="text" class="form-control text-input" placeholder="숫자"></div>
							<div>예비3 (int type)<input type="text" class="form-control text-input" placeholder="숫자"></div>
						</div>
						<div class="codeInfo col-6">
							<div>코드그룹 코드 (Another)<input type="text" class="form-control text-input" placeholder="코드그룹 코드"></div>
							<div>코드그룹 이름 (영문)<input type="text" class="form-control text-input" placeholder="코드그룹 코드"></div>
							<div>순서<input type="text" class="form-control text-input" placeholder="코드그룹 코드"></div>
							<div>
								<span>삭제여부</span>
								<select class="form-select text-input">
									<option>Y</option>
									<option>N</option>
								</select>
							</div>
							<div style="margin-top:35px">예비2 (varchar type)<input type="text" class="form-control text-input" placeholder="영문(대소문자),숫자"></div>
							<div style="margin-top:85px">예비2 (int type)<input type="text" class="form-control text-input" placeholder="숫자"></div>
						</div>
					</div>
					<div class="d-flex justify-content-between" style="padding-bottom: 10px;">
						<button type="button" class="btn prevBtn">이전</button>
						<button type="button" class="btn createBtn" data-bs-toggle="modal" data-bs-target="#memberRegModal">등록하기</button>
					</div>
				</section>
			</section>
		</form>
	</div>
	
	<!-- modal -->
	<div class="modal fade" id="memberRegModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" role="document">
				<div class="modal-header">
					<h5 class="modal-title">회원등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>등록하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn cancelBtn" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn createBtn">등록하기</button>
				</div>
			</div>
		</div>
	</div>
		
	<script>
		$(document).ready(function(){
			$("#birth").datepicker({
				changeYear: true //option값 년 선택 가능
		        , changeMonth: true //option값  월 선택 가능   
                , showButtonPanel: true
                , currentText: '오늘'
                , dateFormat: "yy-mm-dd"
                , dayNamesMin:['월', '화', '수', '목', '금', '토', '일']
			});
			
			$(".passwordRe").on("mouseleave", function(){
				var password = $(".password").val().trim();
				var passwordRe = $(".passwordRe").val().trim();
				
				if(password != passwordRe) {
					$(".passwordError").removeClass("d-none");
				} else {
					$(".passwordError").addClass("d-none");
				}
			});
			
			$(".modal .createBtn").on("click",function(){
				location.href="memberList.html"
			});
			
			$(".prevBtn").click(function(){
				location.href="codeGroupList";
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>