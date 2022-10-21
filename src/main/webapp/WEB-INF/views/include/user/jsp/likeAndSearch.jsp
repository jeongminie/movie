<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function processLike(movieCode) {
		$.ajax({
			type:"post",
			url:"/movie/likeProc",
			data:{"movieCode":movieCode},
			success:function(data) {
				console.log(data)
				var likeCount = Number($("#likeCount-" + movieCode).text());
				
				if(data.like){
					$("#heartIcon-" + movieCode).removeClass("fa-regular");
					$("#heartIcon-" + movieCode).addClass("fa-solid");
					
					$("#likeCount-" + movieCode).html();
					$("#likeCount-" + movieCode).html(likeCount+1);
					
				} else {
					$("#heartIcon-" + movieCode).removeClass("fa-solid");
					$("#heartIcon-" + movieCode).addClass("fa-regular");
					
					$("#likeCount-" + movieCode).html(likeCount-1);
				}
			}
		});
	}
	
	function setEmptyImage(img) {
		img.src='/resources/static/image/noImg.png';
		$(img).addClass('noImg');
	}
	
	$(document).ready(function(){
		if($(".movie-list ul li").length <= 20) {
			$("#addMovieDiv").hide();
		}
		
		$(".alarmBtn").on("click", function(){
			var movieCode = $(this).data("no");
			
			/* $("#form").submit(); */

			location.href="../movie/openAlarm?movieCode="+movieCode;
		});
		
		$(".movie-list ul li").slice(0, 20).show(); // 초기갯수
		console.log($(".movie-list ul li").length)
		
		$("#addMovieDiv").on("click", function(){
			$(".movie-list ul li:hidden").slice(0, 20).show();		
			
			if($(".movie-list ul li:hidden").length == 0){ 
				$("#addMovieDiv").css("display", "none");
			}
			
		});
		
		$(".btn-like").on("click", function(){
			var movieCode = $(this).data("no");
			var usreSeq = "${sessSeq}"
			if(usreSeq == null || usreSeq == '') {
				alert("로그인 후 사용가능합니다.")
			} else {
				processLike(movieCode)
			}
			
		})
	
	});
</script>