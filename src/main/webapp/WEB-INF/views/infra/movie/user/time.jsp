<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
  	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
  	<!-- google font -->
  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
	<title>상영시간표</title>
	
	<style>
	.table td {
		padding: 0px;
	}
	
	.table>:not(caption)>*>* {
		padding: 0px;
	}
	
	.dateBtn {
		padding: 0px;
	}
	
	.calendarTable .dateBtn {
	    width: 70px;
	    height: 72px;
	    border: 0;
	    background-color: transparent;
	    border-bottom: 3px solid transparent;
	    font-weight: 400;
	}
	
	.td-ab:hover {
		background-color: #875CF0;
		
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
					<a href="#">극장</a>
					<a href="time?brchNo=1372">상영시간표</a>
				</div>
			</div>
		</div>
		<div class="theater-detail-page">
			<div class="bg-img" style="background-image:url('/resources/static/image/img-theater-detail.jpg');"></div>
			<div class="bg-mask"></div>
			<div class="theater-all">
				<div class="theater-area-list">
					<ul class="area-depth1">
						<li class="on area-li">
							<a href="" class="depth1 area" title="서울 선택">서울</a>
							<div class="area-depth2">
								<ul class="area-ul">
								</ul>
							</div>
						</li>
						<li class="on area-li">
							<a href="" class="depth1 area" title="경기 선택">경기</a>
							<div class="area-depth2">
								<ul class="area-ul">
								</ul>
							</div>
						</li>
						<li class="on area-li">
							<a href="" class="depth1 area" title="경기 선택">인천</a>
							<div class="area-depth2">
								<ul class="area-ul">
								</ul>
							</div>
						</li>
						<li class="on area-li">
							<a href="" class="depth1 area" title="경기 선택">대전/충청/세종</a>
							<div class="area-depth2">
								<ul class="area-ul">
								</ul>
							</div>
						</li>
						<li class="on area-li">
							<a href="" class="depth1 area" title="경기 선택">부산/대구/경상</a>
							<div class="area-depth2">
								<ul class="area-ul">
								</ul>
							</div>
						</li>
						<li class="on area-li">
							<a href="" class="depth1 area" title="경기 선택">광주/전라</a>
							<div class="area-depth2">
								<ul class="area-ul">
								</ul>
							</div>
						</li>
						<li class="on area-li">
							<a href="" class="depth1 area" title="경기 선택">강원</a>
							<div class="area-depth2">
								<ul class="area-ul">
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<p class="name" id="theaterNm"></p>
			</div>
		</div>
		<div class="tap-menu">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link" id="nav-theater-tab" data-bs-toggle="tab" data-bs-target="#nav-theater" type="button" role="tab" aria-controls="nav-theater" aria-selected="true">위치</button>
					<button class="nav-link active" id="nav-time-tab" data-bs-toggle="tab" data-bs-target="#nav-time" type="button" role="tab" aria-controls="nav-time" aria-selected="false">상영 시간표</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-time" role="tabpanel" aria-labelledby="nav-time-tab" tabindex="0">
					<div>
						<span class="d-flex justify-content-center mt-5">상영시간표</span>
						<table class="table calendarTable">
							<tr>
								<c:forEach items="${dd }" var="dd" varStatus="status">
									<td>
										<input type="hidden" value="${dateList[status.index]}" name="date" class="date">
										<button type="button" class="dateBtn" data-date="${dateList[status.index]}">
											<c:choose>
												<c:when test="${dayOfWeek[status.index] eq '토'}">
													<span class="date" style="color: blue" data-date="${dateList[status.index]}">${dd }<br>${dayOfWeek[status.index]}</span> 
												</c:when>
												<c:when test="${dayOfWeek[status.index] eq '일'}">
													<span class="date" style="color: red" data-date="${dateList[status.index]}">${dd }<br>${dayOfWeek[status.index]}</span> 
												</c:when>
												<c:otherwise>
													<span class="date">${dd }<br>${dayOfWeek[status.index]}</span>
												</c:otherwise>
											</c:choose>
										</button>
									</td>
								</c:forEach>
							</tr>
						</table>	
					</div>
					<div class="reserve theater-list-box">
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="today" value="<c:out value="${today}"/>"/>
		<jsp:include page="../../../include/user/jsp/footer.jsp" />
	</div> 
	
	<script>
	function ajax(date, theaterNm) {
		var query = window.location.search;
		var param = new URLSearchParams(query);
		var brchNo = param.get('brchNo');
		
		$.ajax ({
			type : 'post',
			url : 'http://127.0.0.1:5000/tospring',
			data : {"date":date, "brchNo":brchNo},
			dataType : 'json',
			success : function(data) {
				var count = 1 
				
				for (var key in data) {
					
					var theaterTit = '<div id="title'+count+'" class="theater-list"><div class="theater-tit">'+key+'</div>'
					
					$(".theater-list-box").append(theaterTit);
					
					var key2 = Object.keys(data[key])
					
					for(var key2 in data[key]) {
						
						var theaterType = '<div id="t'+count+'-'+'theater'+key2+'" class="theater-type-box"><div class="theater-type"><p class="theater-name">'+ key2 +'관</p></div></div></div>'
						
						$('#title'+ count).append(theaterType);
						
						var theaterTime = 
						'<div class="theater-time">'
							+'<div class="theater-type-area">'+data[key][key2][0][2]+'</div>'
							+'<div class="theater-time-box">'
								+'<table class="time-list-table">'
									+'<tbody>'
										+'<tr id="table'+key2+'">'+'</tr>'
									+'</tbody>'
								+'</table>'
							+'</div>'
						+'</div>'
						
						$('#t'+ count + '-' + 'theater'+ key2).append(theaterTime);
						
						for(var i = 0; i < data[key][key2].length; i++) {
							
							var td = '<td>'
										+'<div class="td-ab" data-id="'+data[key][key2][i][3]+'" style="cursor:pointer;">'
											+'<div class="txt-center">'
												+'<p class="time">'+ data[key][key2][i][0] +'</p>'
												+'<p class="chair">'+ data[key][key2][i][1] +'석</p>'
											+'</div>'
										+'</div>'
									 +'</td>'
							
							$('#t'+ count + '-' + 'theater'+ key2 + ' table tr').append(td)
						}
					}
					count++;
				}
				
			},
			error : function() {
				alert('요청 실패쓰');
			}
		})
	
	}

	$(document).ready(function(){
		$('button[data-bs-toggle="tab"]').on("hidden.bs.tab", function(){
		});
		
		$('button[data-bs-toggle="tab"]').on("shown.bs.tab", function(){
			location.href="list"
		});
		
		$(".theater-list-box").empty();
		
		var date = $(".date").val();
		dataDate = $('[data-date='+date+']');
		$(dataDate).addClass("on");
		
		var query = window.location.search;
		var param = new URLSearchParams(query);
		var brchNo = param.get('brchNo')
		
		$.ajax({
			type : 'post',
			url : 'selectTheater',
			data : {},
			dataType : 'json',
			success : function(data) {
				for(var i = 0; i < data.length; i++) {
					if(data[i].brchNo == brchNo) {
						thNm = data[i].theaterNm.replace("메가박스 ","");
						$("#theaterNm").html(thNm) 
					}
				}
			}
		});
		
		ajax(date);
		
		$("#time").datepicker({
			dayNamesMin:['월', '화', '수', '목', '금', '토', '일']
		});
		
		$(".depth1, .area-depth2").on("mouseover", function(){
			$(".theater-detail-page .theater-all .theater-area-list .area-depth2").css("display", "block");
		});
		
		$(".depth1, .area-depth2").on("mouseleave", function(){
			$(".theater-detail-page .theater-all .theater-area-list .area-depth2").css("display", "none");
		});
		
		$(".dateBtn").on("click", function(){
			date =  $(this).data("date");
			
			$(".theater-list-box").empty();
			ajax(date)
		});
		
		$(".area").on("mouseover", function(e){
			var path = $(".area-li").children(".area-depth2").children(".area-ul");
			path.empty();
			
			var ul = $(this).text();
 			var cityArr = ul.split('/')
			
 			var city = cityArr[0]
 			var city2 = cityArr[1]
 			var city3 = cityArr[2]
			
			$.ajax({
				type:"POST"
				, url:"selectTheater"
				, data:{"city":city, "city2":city2, "city3":city3}
				, success:function(data) {
					for(var i = 0; i < data.length; i++) {
						var title = data[i].theaterNm.replace("메가박스 ","")
						path.append('<li class="theater"><a href="#" title="강남 상세보기" data-id="'+data[i].brchNo+'" id="'+data[i].brchNo+'">'+title+'</a></li>');
					}
				}
				, error:function(e){
					alert("에러")
				}
			})
		});
		
		$(document).on("click",'.theater', function(){
			date = $(".date").val();
			var brchNo = $(this).children("a").data("id");
					
			location.href="/theater/time?brchNo="+brchNo

			$(".theater-list-box").empty();
		});
		
		$(".dateBtn").on("click", function(){
			
			if ($(this).hasClass("on")) {
		        $(".on").removeClass('on')
		     } else {
		        $(".on").removeClass('on')
		        $(this).addClass('on')
		     }
		})
		
		/* 오픈되지 않은 날짜 disabled 처리 */
		var today = $("input[name='today']").val();
		var compared = $("input[name='date']");
		
		$.ajax ({
			type : 'post',
			url : 'http://127.0.0.1:5000/tospring',
			data : {"date":today, "brchNo":brchNo},
			dataType : 'json',
			success : function(data) {
				for(var i = 1; i < compared.length; i++) {
					var comparedDate = compared[i].value;
					
					(function(i) {
						$.ajax({
							type : 'post',
							async: false,
							url : 'http://127.0.0.1:5000/tospring',
							data : {"date":comparedDate, "brchNo":brchNo},
							dataType : 'json',
							success : function(data2) {
								if(JSON.stringify(data) == JSON.stringify(data2)) {
									$('button[data-date='+comparedDate+']').attr("disabled",true);
									$('span[data-date='+comparedDate+']').css("color","");
								}
							}
						})
					})(i);
				}
			}
		});
		/* 오픈되지 않은 날짜 disabled 처리 */
		
		/* 예매사이트 이동 */
		$(document).on("click",'.td-ab', function(){
			var playSchdlNo = $(this).data("id");
			console.log(playSchdlNo)
			
			window.open("https://www.megabox.co.kr/booking?playSchdlNo="+playSchdlNo)
		});
		
		/* $(document).on("mouseover",'.td-ab', function(){
			$(this).css("background-color", "#503396");
			
			
		}); */
		/* 예매사이트 이동 */
		
	});
	
	
		
</script>
	
	
</body>
</html>