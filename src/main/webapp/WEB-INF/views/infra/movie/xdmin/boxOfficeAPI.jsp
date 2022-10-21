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
			<%@include file="../../../include/xdmin/jsp/menu.jsp" %>
 					<span class="m-4"><b>박스오피스 API</b></span>
					<div class="memberList">
						<div class="d-flex p-2" style="float: right;">
							<span id="date" class="mt-1"></span>
							<button type="button" class="btn saveBtn" id="dbInsertBtn"><i class="fa-solid fa-database"></i></i></button>
						</div>
						<table class="table text-center memberTable" id="boxofficeTable">
							<thead>
								<tr>
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
			 var rank;
             var movieNm; 
             var openDt; 
             var audiCnt; 
             var audiAcc; 
             
			var today = new Date();
			
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + (today.getDate()-1)).slice(-2);
			
			var dateString = year+month+day;
			document.getElementById("date").innerText= "기준 날짜 : "+dateString;
			
			$.ajax({
				type:"GET",
				url:"http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=a9f01fdf8f24c0d347d754bd6e7326cd&targetDt="+dateString,
				data:{ },
				success:function(response) {
					var rows = response["boxOfficeResult"]["dailyBoxOfficeList"]; 
                    for (let i = 0; i < rows.length; i++) {
                    	
                        rank = rows[i]['rank'];
                        movieNm = rows[i]['movieNm']; 
                        openDt = rows[i]['openDt']; 
                        audiCnt = rows[i]['audiCnt']; 
                        audiAcc = rows[i]['audiAcc']; 
                        console.log(movieNm)
                    	
                        $("tbody").append(
                    		"<tr>"+
                    			"<td>"+rank+"</td>"+
                    			"<td>"+movieNm+"</td>"+
                    			"<td>"+openDt+"</td>"+
                    			"<td>"+audiCnt+"</td>"+
                    			"<td>"+audiAcc+"</td>"+
                    			'<input type="hidden" name="boxoffice" value="'+rank+'^'+movieNm+'^'+openDt+'^'+audiCnt+'^'+audiAcc+'"^'+
                    		"</tr>"
                    	)
                    }
				}
			})
			
			
			$("#dbInsertBtn").on("click", function(){
				var tableRow = document.getElementsByTagName('tr');
				tableRowCount = tableRow.length -1;
				
				var boxoffice = $("input:hidden[name=boxoffice]");
				console.log(boxoffice)
					
				for(let i = 0; i < tableRowCount; i++) {
					value = boxoffice[i].value.split("^");

					ranking = value[0];
					movieNm = value[1]; 
					openDt = value[2]; 
					audiCnt = value[3]; 
					audiAcc = value[4];
					
					(function(i) {
						$.ajax({
							type:"POST",
							url:"boxofficeUpdate",
							async: false,
							data:{"ranking":ranking, "movieNm":movieNm, "openDt":openDt, "audiCnt":audiCnt, "audiAcc":audiAcc},
							success:function(data){
								if(data.result == "success") {
									console.log(movieNm)
									console.log(openDt)
									
								} else {
									alert("DB INSERT 실패");
								}
							}
						})
				    })(i);
				}
				
				alert("완료")
				
			});
				
				
		});

		
	</script>

</body>
</html>