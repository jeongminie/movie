function processLike(movieCode) {
	$.ajax({
		type:"post",
		url:"/movie/likeProc",
		data:{"movieCode":movieCode},
		success:function(data) {
			console.log(data)
			var likeCount = $("#likeCount-" + movieCode).text();
			
			if(data.like){
				$("#heartIcon-" + movieCode).removeClass("fa-regular");
				$("#heartIcon-" + movieCode).addClass("fa-solid");
				
				$("#likeCount-" + movieCode).html((likeCount+1).replace(/(^0+)/, ""))
				
			} else {
				$("#heartIcon-" + movieCode).removeClass("fa-solid");
				$("#heartIcon-" + movieCode).addClass("fa-regular");
				
				$("#likeCount-" + movieCode).html(likeCount-1)
			}
			
		}
	});
}
