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
	<link rel="stylesheet" href="/resources/static/css/mypage.css">
	
  	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
  	<!-- google font -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
	<title>마이페이지</title>
		
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/user/jsp/header_white.jsp" />
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<i class="fa-solid fa-house" onclick='location.href="/"' style="cursor:pointer"></i>
					<a href="#">마이페이지</a>
				</div>
			</div>
		</div>
		<div class="inner-wrap" style="height:500px;">
			<jsp:include page="../../../include/user/jsp/mypageAside.jsp" />
			<div id="contents">
				<div class="my-magabox-info">
					<!-- top -->
					<div class="top">
						<div class="photo" id="myPhoto">
							<div class="wrap">
							<c:choose>
								<c:when test="${member.loginId eq '카카오로그인'}">
									<button type="button" class="img">
										<img id="test" src="${member.snsImg }" onerror="setEmptyImage(this)">
									</button>
								</c:when>
								<c:otherwise>
									<form method="post" id="form" enctype="multipart/form-data">
										<input type="file" id="profileUploaded" name="profileUploaded" class="d-none">
										<input type="hidden" name="filePath" value="${profile.path }${profile.uuidName }">
									</form>
									<i class="fa-solid fa-circle-plus"></i>
									<button type="button" class="img">
										<c:choose>
											<c:when test="${not empty profile}">
												<img src="<c:out value="${profile.path }${profile.uuidName }"/>" onerror="setEmptyImage(this)">
											</c:when>
											<c:otherwise>
												<img src="#" onerror="setEmptyImage(this)">
											</c:otherwise>
										</c:choose>
									</button>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
						<div class="grade">
							<p class="name">${member.name }님<br>환영합니다.</p>
		
							<div class="link">
								<a href="/mypage/myinfo?returnURL=info" title="개인정보수정 페이지로 이동" >개인정보수정 <i class="iconset ico-arr-right-reverse"></i></a>
							</div>
						</div>
					</div>
					<!--// top -->
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" name="profile"/>
	<jsp:include page="../../../include/user/jsp/footer.jsp" />
	
	<jsp:include page="../../../include/user/jsp/loginModal.jsp" /> 
	
	<!-- modal -->
	<div class="modal" id="alertModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" role="document">
				<div class="modal-header">
					<span class="modal-title">알림</span>
				</div>
				<div class="modal-body">
					<p>프로필 사진이 등록되었습니다.</p>
					<button type="button" class="btn close-btn mb-3" data-bs-dismiss="modal" aria-label="Close">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function setEmptyImage(img) {
			img.src='/resources/static/image/noImg2.png';
			$(img).addClass('noImg');
		}
		
		/* function readURL(input) {
			var file = input.files[0];
			
			if(file.type.startsWith("image")) {
				var reader = new FileReader();

				reader.onload = function (e) {
					$("img").attr("src", e.target.result); 
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				alert("이미지 파일만 가능합니다.")
			}
		} */
		
		$(document).ready(function(){
			/* $("#profileUploaded").change(function(e){
				readURL(this)
			}); */
				
			$(".fa-circle-plus").on("click", function(){
				$("#profileUploaded").click();
			});
			
			$("#profileUploaded").on("change", function(e){
				console.log($("#profileUploaded")[0].files[0])
			
				/* $("#form").submit(); */
				var filePath = $("input[name='filePath']").val();
				
 				var formData = new FormData();
				formData.append("profileUploaded", $("#profileUploaded")[0].files[0]);
				formData.append("filePath", filePath);
				
				$.ajax({
					type : "POST",
					enctype:"mutipart/form-data",
					url:"/profileUploaded",
					processData: false,
					contentType: false,
					data: formData,
					dataType: "json",
					success : function(data) {
						setTimeout(function() {
							$("#alertModal").modal('show');
						}, 3000);
					}
				});
			});
			
			$('#alertModal').on('hide.bs.modal', function() {
				location.reload();
			});
			
		})
	
	</script>
	
	
</body>
</html>