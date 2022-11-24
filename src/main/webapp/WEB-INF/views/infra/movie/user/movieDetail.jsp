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
<div class="movie-detail-page">
	<div class="bg-img" style="background-image:url('https://img.megabox.co.kr/SharedImg/2022/11/22/4u27s5qE3ee1w1Pbi5xfhbHAovMTPeZE_570.jpg');"></div>
	<div class="bg-pattern"></div>
	<div class="bg-mask"></div>

	<!-- movie-detail-cont -->
	<div class="movie-detail-cont">
		
			
			
			<!-- 개봉 예매가능-->
				
			
			
		

        <p class="contents-type"></p>
		<p class="title">올빼미</p>
		<p class="title-eng">the night owl</p>

		
			
			
					
					
			
		

		<div class="btn-util">
			<button type="button" title="보고싶어 안함" class="btn btn-like" rpst-movie-no="22085900">
				<i class="iconset ico-heart-line"></i>
				<span title="보고싶어 한 명수" id="intrstCnt">
					
						
						
								721
						
					
				</span>
			</button>
			



<div class="sns-share">
	<a href="#" class="btn btn-common-share" title="공유하기">
		
			
				<i class="iconset ico-sns-line"></i> 공유하기 <!-- 공유하기 -->
			
			
		
	</a>

	<div class="btn-sns-share-wrap">
		<div class="cont-area">
			<div class="btn-sns-share-group">
				<!-- <button type="button" title="카카오톡 공유하기" class="btn btnSns kakao">카카오톡 </button> 카카오톡 -->
				<button type="button" title="페이스북 공유하기" class="btn btnSns face">페이스북 <!-- 페이스북 --></button>
				<button type="button" title="밴드 공유하기" class="btn btnSns band">밴드 <!-- 밴드 --></button>
				<button type="button" title="트위터 공유하기" class="btn btnSns twitter">트위터 <!-- 트위터 --></button>
				<button type="button" title="링크 공유하기" class="btn btnSns link">링크공유 <!-- 링크공유 --></button>
			</div>
		</div>
	</div>
</div>
		</div>

		
			
			
				
			
			
			
		

		<!-- info -->
		
		

		<div class="info">
			<div class="score">
				<p class="tit">실관람 평점</p>
				<div class="number gt" id="mainMegaScore">
				<!--  <div class="number lt" id="mainMegaScore">
					<p title="관람 전 점수" class="before"><em>0</em><span class="ir">점</span></p>
					<p title="관람 후 점수" class="after"><em>9.1</em><span class="ir">점</span></p> -->
					<p title="실관람 평점" class="before"><em>9.1</em><span class="ir">점</span></p>
				</div>
			</div>

			<div class="rate">
				<p class="tit">예매율</p>

				
					
					
						<p class="cont"><em>1</em>위 (38.9%)</p>
					
				

			</div>

            <div class="audience ">
                 <div class="tit ">
                        <span class="m-tooltip-wrap ">누적관객수
						<!-- 2019-09-11 툴팁 보기 수정 -->
						<em class="m-tooltip ml05">
							<i class="iconset ico-tooltip-gray">툴팁보기</i>
							<div class="m-detail-tooltip">
								<div class="bg-arr bottom"></div>
								<div class="cont-area">
									<p class="reset a-c">
										누적관객 및 전일관객은 영화진흥 위원회<br>
										영화관 입장권 통합전산망제공 기준입니다.<br>
									(2022.11.23기준)
									</p>
								</div>
							</div>
						</em>
						</span>
                  </div>
                  <p class="cont"><em>114,582</em> 명</p>
            </div>

		</div>
		<!--// info -->

		<div class="poster">
			<div class="wrap">
				
					
					
					<p class="movie-grade age-15">15세 이상 관람가</p>
					
					
				
			 	<img src="https://img.megabox.co.kr/SharedImg/2022/10/27/vwK0o0h7SNCzWpJNg7oY8K8gsc2yjNyM_420.jpg" onerror="noImg(this)" alt="올빼미">

				<a href="#" class="btn-poster-down" title="포스터 다운로드" data-no="1120350" data-sn="1">포스터 다운로드</a>
			</div>
		</div>

		
			
				
			
			
		

		<div class="reserve screen-type col-2">
			<div class="reserve">
				
					
						<a href="javascript:fn_bookingForm('22085900','basic');" class="btn reserve" title="영화 예매하기">예매</a>
						<a href="javascript:fn_bookingForm('22085900','DBC');" class="btn dolby">
							<img src="/static/pc/images/common/btn/mov_detail_db_btn.png" alt="dolby 버튼">
						</a>
					
					
					
					
					
					
					
					
					
				
			</div>
		</div>
	</div>
	<!--// movie-detail-cont -->
</div>
		</div>
	</div>
	<input type="hidden" name="profile"/>
	<jsp:include page="../../../include/user/jsp/footer.jsp" />
	
	<jsp:include page="../../../include/user/jsp/loginModal.jsp" /> 
	<jsp:include page="../../../include/user/jsp/alterModal.jsp" /> 
	
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
							$("#alertModal").find('.modal-body p').html('<p>프로필 사진이 등록되었습니다.</p>');
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