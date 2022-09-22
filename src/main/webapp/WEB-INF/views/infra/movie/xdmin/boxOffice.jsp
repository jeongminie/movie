<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.jeongmini.movie.modules.code.CodeServiceImpl"/>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/9a0994e5cb.js" crossorigin="anonymous"></script>
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/static/css/xdmin/style.css">
	<title>박스오피스 api 관리</title>
</head>
<body>
	<div id="wrap">
		<div>
			<%@include file="../../../include/jsp/menu.jsp" %>
 					<span class="m-4"><b>박스오피스 API</b></span>
					<div class="memberList">
						<div class="d-flex p-2" style="float: right;">
							<button type="button" class="btn searchBtn"><i class="fa-solid fa-database"></i></i></button>
						</div>
						<table class="table text-center memberTable" id="boxofficeTable">
							<thead>
								<tr>
									<th scope="col">rnum</th>
									<th scope="col">rank</th>
									<th scope="col">movieNm</th>
									<th scope="col">openDt</th>
									<th scope="col">audiCnt</th>
									<th scope="col">audiAcc</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</section>
			</section>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
				$.ajax({
					type:"GET",
					url:"http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=a9f01fdf8f24c0d347d754bd6e7326cd&targetDt=20220921",
					data:{},
					success:function(response) {
						let rows = response["boxOfficeResult"]["dailyBoxOfficeList"]; 
	                    for (let i = 0; i < rows.length; i++) {
	                    	
	                    	let rnum = rows[i]['rnum'];
	                        let rank = rows[i]['rank'];
	                        let movieNm = rows[i]['movieNm']; 
	                        let openDt = rows[i]['openDt']; 
	                        let audiCnt = rows[i]['audiCnt']; 
	                        let audiAcc = rows[i]['audiAcc']; 
	                      
	                        $("#boxofficeTable").append('<tr><td>' + rank + '</td><td>' + rank + '</td><td>' + movieNm + '</td><td>' + openDt + '</td><td>' + audiCnt + '</td><td>' + audiAcc + '</td></tr>');
							
		                    console.log(rank, movieNm);
	                    }
					}
				})
		});
		
	</script>

</body>
</html>