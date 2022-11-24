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
	
	<!-- pyscript -->
	<!-- <link rel="stylesheet" href="https://pyscript.net/latest/pyscript.css" />
	<script defer src="https://pyscript.net/alpha/pyscript.js"></script> -->
	
	<title>예매 오픈 알림 신청</title>
	
	<style>
		#bg {
			z-index : -5;
			overflow: hidden;
			position: absolute;
			width: 100%;
			min-width: 1100px;
			height: 100%;
			margin: 0 auto;
		}
		
		#bg .bg-pattern {
			position: absolute;
			left: 0;
			top: 0;
			z-index: -5;
			width: 100%;
			background: url(/resources/static/image/bg-movie-detail-pattern.png);
		}
		
		#bg img {
			border-radius : 100px;
			display: block;
			width: 100%;
			-webkit-filter: blur(20px);
			-moz-filter: blur(5px);
			-o-filter: blur(5px);
			-ms-filter: blur(5px);
			filter: blur(50px);
    	}
    	
    	#bg:after {
			content: '';
			display: block;
			position: absolute;
			left: 0;
			top: 0;
			right: 0;
			bottom: 0;
			z-index: 2;
			background-color: rgb(193 192 192 / 47%);
		}

		.alarm-box {
			position : absolute;
			margin : auto;
			margin-top : 30px;
			width : 1000px;
			height : 500px;
			position: relative;
		}
		
		.movie-poster{
			display : flex;
			justify-content : center;
			width: 100%;
		    height: 100%;
		    object-fit: cover;
		    border-radius: 5px;
		}
		
		.movie-tit {
			text-align: center;
			margin : 15px 0px 15px 0px;
		}
		
		.select-wrap {
			width: 250px;
			margin: auto;
		}
		
		.select {
			position : relative;
			z-index: -2;
		}
		
		.select-option {
			position : relative;
			z-index: 1;
		}
		
		.select-date {
			width : 250px;
			border-radius: .375rem;
		}
		
		.select-date::placeholder {
  			color: black;
  		}	
  		
		.ui-datepicker {
			width : 250px;
			
		}
		
		.fa-calendar {
			top : 5px;
		}
		
		.movie-info {
			width: 250px;
		    height: 400px;
		    margin : auto;
		}
		
 		.fade-wrap {
			display : none;
			width: 250px;
			height: 400px;
			opacity: 0.9;
			background-color : black;
			border-radius : 5px;
			position :absolute;
			top : 0%;
		}
		
		.summary {
			display:block; 
			padding : 15px;
			width : 100%;
			height : 300px !important;
			overflow : hidden;
			text-overflow:ellipsis;
			/* border-bottom: 1px solid #EBEBEB; */
		}
		
		.summary span {
			color : white;
		}
	</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../../../include/user/jsp/header_white.jsp" />
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<i class="fa-solid fa-house" onclick='location.href="/"' style="cursor:pointer"></i>
					<a href="running">예매</a>
					<a href="premovie">오픈 알림 신청</a>
				</div>
			</div>
		</div>
		<div id="bg">
			<div class="bg-pattern"></div>
			<img height="885px" src="/resources/static/2022/<c:out value='${item.movieCode }'/>.png" onerror="noImg(this, 'main');">
		</div>
		<div class="alarm-box">
			<div class="movie-info">
				<img src="/resources/static/2022/<c:out value='${item.movieCode }'/>.png" class="movie-poster">
				<div class="fade-wrap">
					<div class="summary h-75">
						<span>${item.story }</span>
					</div>
				</div>
			</div>
			<div class="movie-tit">
				<span id="movieNm">${item.title }</span>
			</div>
			<div class="select-wrap">
				<div class="select-area">
					<select class="form-select select">
						<option value="" hidden>속성</option>
					</select>
					<select id="theabKindCd" class="form-select select-option d-none" multiple onchange="categoryChange(this)">
						<option value="DBC">DOLBY CINEMA</option>
						<option value="TB">THE BOUTIQUE</option>
						<option value="MX">MX</option>
						<option value="PTC">PUPPY CINEMA</option>
						<option value="MKB">MEGABOX KIDS</option>
					</select>
				</div>
				<div class="select-area mt-2">
					<select class="form-select select">
						<option disabled selected hidden>극장</option>
					</select>
					<select id="brchNo" class="form-select select-option d-none" multiple>
						<!-- <option value="0019">남양주현대아울렛 스페이스원</option>
						<option value="7011">대구신세계(동대구)</option>
						<option value="0028">대전신세계 아트앤사이언스</option>
						<option value="0020">안성스타필드</option>
						<option value= "1351">코엑스</option>-->
					</select>
					<!-- <select id="brchNo" class="TB form-select select-option d-none" multiple>
						<option value="0028">대전신세계 아트앤사이언스</option>
					</select> -->
				</div>
				<div class="select-area mt-2">
					<input type="text" class="form-control select-date" placeholder="날짜" id="startDate" onfocus="this.blur()" style="cursor:pointer">
				</div>
				<div class="alarm">
					<button type="button" id="alarmBtn" class="alarmBtn"><i class="fa-regular fa-bell"></i></button>
				</div>
			</div>
		</div>
		<input type="hidden" name="phone" value="${phone }">
		<input type="hidden" name="userSeq" value="${sessSeq }">
	</div>
	<%-- <jsp:include page="../../../include/user/jsp/footer.jsp" /> --%>
	
	<%@ include file="../../../include/user/jsp/loginModal.jsp"%>
	<%@ include file="../../../include/user/jsp/alterModal.jsp"%>
	
	<script>
		function categoryChange(e) {
			var target = document.getElementById("brchNo");

			if(e.value == "DBC") {
				var DBC = '<select id="brchNo" class="form-select select-option d-none">'
							+'<option value="0019">남양주현대아울렛 스페이스원</option>'
							+'<option value="7011">대구신세계(동대구)</option>'
							+ '<option value="0028">대전신세계 아트앤사이언스</option>'
							+'<option value="0020">안성스타필드</option>'
							+'<option value="1351">코엑스</option>'
						+'</select>'
					
				$("#brchNo").html(DBC)
			} else if(e.value == "TB") {
				var TB = '<select id="brchNo" class="form-select select-option d-none">'
							+'<option value="0028">대전신세계 아트앤사이언스</option>'
							+'<option value="4631">분당</option>'
							+ '<option value="1331">성수</option>'
							+'<option value="1371">센트럴</option>'
							+'<option value="4104">일산벨라시타</option>'
							+'<option value="1351">코엑스</option>'
							+'<option value="4112">킨텍스</option>'
							+'<option value="4651">하남스타필드</option>'
						+'</select>'
					
				$("#brchNo").html(TB)
			} else if(e.value == "MX") {
				var MX = '<select id="brchNo" class="form-select select-option d-none">'
							+'<option value="4121">고양스타필드</option>'
							+'<option value="0017">대전현대아울렛</option>'
							+ '<option value="1581">목동</option>'
							+'<option value="1211">상암월드컵경기장</option>'
							+'<option value="1351">성수</option>'
							+'<option value="4062">송도</option>'
							+'<option value="4431">영통</option>'
							+'<option value="4651">하남스타필드</option>'
						+'</select>'
					
				$("#brchNo").html(MX)
			} else if(e.value == "PTC") {
				var PTC = '<select id="brchNo" class="form-select select-option d-none">'
							+'<option value="4431">영통</option>'
						+'</select>'
					
				$("#brchNo").html(PTC)
			} else if(e.value == "MKB") {
				var MKB = '<select id="brchNo" class="form-select select-option d-none">'
							+'<option value="6312">마산</option>'
							+'<option value="4651">하남스타필드</option>'
							+ '<option value="6121">해운대(장산)</option>'
						+'</select>'
					
				$("#brchNo").html(MKB)
			}
		}
			
		$(document).ready(function(){
			
			$(".movie-info").on("mouseover", function(e){
				if ($(e.target).is('.movie-poster')) {
					$(".fade-wrap").fadeIn();
			    }
			}); 
			
			$(".movie-info").on("mouseleave", function(){
				$(".fade-wrap").fadeOut();
			});
			
			$("#startDate").datepicker({
	               showButtonPanel: true, 
	               currentText: '오늘',
	               dateFormat: "yy-mm-dd",
	               dayNamesMin:['일', '화', '수', '목', '금', '토', '월'],
	               minDate : 0
			});
			
			$(".select-area").on("click", function(){
				var selected = $(this).children(".select-option");
				
				var theabKindCd = $("#theabKindCd option:selected").val();
				 
				if(selected.hasClass('d-none')) {
					selected.removeClass('d-none');
				} else  {
					selected.addClass('d-none');
				}
				
			});
			
			$(".select-area").children(".select-option").change(function(e){
				var selectedVal = $(this).val();
				var selectedTxt =  $(this).find('option:selected').text();
				
				if(selectedTxt != null) {
					$(this).prev(".select").find('option:selected').text(selectedTxt);
				}
				
			});
			
			$(document).on("click",'#alarmBtn', function(){
				var brchNo = $("#brchNo option:selected").val();
				console.log(brchNo)
				
				var theabKindCd = $("#theabKindCd option:selected").val();
				console.log(theabKindCd)
				
				var rpstMovieNo = $("input[name='movieNo']").val();
				console.log(rpstMovieNo)
				
				var userSeq = $("input[name='userSeq']").val();
				var phone = $("input[name='phone']").val();
				console.log(phone)
				
				var playDe = $("#startDate").val().replaceAll("-","");
				
				var movieNm = $("#movieNm").text();
				
				$.ajax({
					type : 'post',
					url : 'movieOpenAlarm',
					data : {"brchNo":brchNo, "theabKindCd":theabKindCd, "rpstMovieNo":rpstMovieNo, "movieNm":movieNm, "playDe":playDe, "phone":phone, "userSeq":userSeq},
					success : function(data) {
						if(data.result == "success") {
							$("#alertModal").find('.modal-body p').text('알림신청이 완료되었습니다.');
							$("#alertModal").modal('show');
						} else {
							alert("실패");
						}
					}
				})
			})
			
/* 			$(document).on("click",'#alarmBtn', function(){
				var movieNo = $("input[name='movieNo']").val();
				alert(movieNo)
				
				$.ajax({
					type : 'post',
					url : 'http://127.0.0.1:5000/dd',
					data : {"movieNo":movieNo},
					success : function(data) {
						
					},
					error : function() {
						alert('요청 실패쓰');
					}
				})
				
			}) */
			
			function ajax(movieNm, pageType, onairYn) {
				$.ajax({
					type : 'post',
					url : 'http://127.0.0.1:5000/movieNo',
					data : {"movieNm":movieNm,"pageType":pageType,"onairYn":onairYn},
					success : function(data) {
						$("#wrap").append("<input name='movieNo' type='hidden' value="+data+">")
						console.log(data)
					},
					error : function() {
						$("#alertModal").find('.modal-body p').text('메가박스에서 상영하지 않는 영화입니다.');
						$("#alertModal").modal('show');
					}
				})
			}
			
			var movieNm = $("#movieNm").text();
			
			var query = window.location.search;
			var param = new URLSearchParams(query);
			var brchNo = param.get('pageType');
			
			if(brchNo == "running" || brchNo == "") {
				ajax(movieNm, "ticketing", "N")
			} else {
				ajax(movieNm, "rfilmDe", "MSC02")
			}
			
			$('#alertModal').on('hide.bs.modal', function() {
				window.history.back();
			});
				
		});	
		
	</script>
	
</body>
</html>