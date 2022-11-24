<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.inner-wrap {
		width: 1100px;
    	margin: 0 auto;
	}
	
	.profile-img {
		width:100px;
		height:100px;
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
		overflow:hidden;
		border-radius: 50%;
		position: relative;
	}
	
	#imageSection {
		position: absolute; top:0; left: 0;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.profileWrap {
		width: 500px;
		height: 500px;
		margin: auto;
	}	
	
	#preview,#saveBtn {
		margin: auto;
	}
	
	.lnb-area {
	    float: left;
	    width: 200px;
	    padding: 40px 0 0 0;
	    background-color: #fff;
	}
	
	#lnb {
	    margin: 0;
	    padding: 0;
	}
	
	#lnb .tit {
	    overflow: hidden;
	    margin: 0;
	    padding: 0;
	    border-radius: 10px 10px 0 0;
	    background: url(https://img.megabox.co.kr/static/pc/images/common/bg/bg-lnb-tit.png) 0 0;
	}
	
	#lnb .tit a {
	    display: block;
	    width: 100%;
	    font-size: 1.2em;
	    line-height: 90px;
	    text-align: center;
	    color: #fff;
	    text-decoration: none;
	}
	
	#lnb>ul {
	    border: 1px solid #d8d9db;
	    border-left-width: 2px;
	    border-right-width: 2px;
	    border-bottom-width: 2px;
	    border-radius: 0 0 10px 10px;
	}
	
	#lnb>ul>li {
	    border-top: 1px solid #d8d9db;
	}

	#lnb>ul>li>a {
	    display: block;
	    color: #222;
	    padding: 10px 15px;
	    font-weight: 400;
	    background-color: #f2f4f5;
	}
	
	#lnb .depth3 {
	    padding: 20px 0;
	}

	#lnb .depth3>li>a {
	    position: relative;
	    padding: 2px 0 2px 24px;
	    color: #666;
	}
	
	#contents {
	    margin: 0;
	    padding: 40px 0 0 0;
	    float: right;
	    width: calc(100% - 260px);
	}
	
	.my-magabox-info {
	    overflow: hidden;
	    height: 250px;
	    border-radius: 10px;
	    background-color: #f3f4f6;
	    margin-left: 50px;
	}
	
	.my-magabox-info .top {
	    position: relative;
	    height: 198px;
	    padding: 30px 30px 0 0;
	}


	.my-magabox-info .top .photo {
	    float: left;
	    width: 200px;
	    padding: 20px 0 0 60px;
	}
	
	.my-magabox-info .top .photo .wrap {
	    position: relative;
	    width: 93px;
	    margin: 0;
	    padding: 0 0 7px 0;
	    background: url(https://img.megabox.co.kr/static/pc/images/mypage/bg-photo-back.png) no-repeat center bottom;
	}
	
	.my-magabox-info .top .photo .wrap i {
		cursor : pointer;
	    overflow: hidden;
	    display: block;
	    position: absolute;
	    right: 0;
	    top: 10px;
	    margin: 0;
	    border-radius: 19px;
	    box-shadow: -2px 2px 5px 0 rgb(45 45 45 / 30%);
	}
	
	.my-magabox-info .top .photo .wrap .img {
	    overflow: hidden;
	    display: block;
	    width: 93px;
	    height: 93px;
	    border-radius: 93px;
	    margin: 0;
	    padding: 0;
	    border: 0;
	    font-size: 0;
	    line-height: 0;
	    background-color: transparent;
	    box-shadow: 0 5px 5px 0 rgb(45 45 45 / 20%);
	}
	
	.my-magabox-info .top .photo .wrap .img img {
	    width: 100%;
	    height: 100%;
	    border-radius: 93px;
	    object-fit: fill;
	}
	
	.my-magabox-info .top .grade {
	    float: left;
	    padding-top: 20px;
	}
	
	.my-magabox-info .top .grade .name {
	    font-size: 1.8666em;
	    line-height: 1.3;
	    color: #222;
	}
	
	.my-magabox-info .top .grade .link {
	    padding: 15px 0 0 0;
	}
	
	.my-magabox-info .top .grade .link a {
	    margin-right: 10px;
	    color: #666;
	}
</style>	
		
<div class="lnb-area">
	<nav id="lnb">
		<p class="tit"><a href="/mypage" title="나의 메가박스">마이페이지</a></p>
		<ul>
			<li><a href="/mypage/openAlarmList" titel="예매오픈 알림 신청 내역">예매오픈 알림 신청 내역</a></li>
			<li>
				<a href="myinfo" title="회원정보">회원정보</a>
				<ul class="depth3">
					<li class="on"><a href="/mypage/myinfo" title="개인정보 수정">개인정보 수정</a></li>
				</ul>
			</li>
			<li>
				<a href="myinfo" title="문의하기">문의하기</a>
				<ul class="depth3">
					<li class="on"><a href="/chat/" title="실시간 문의" onclick="addChat()">실시간 문의</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</div>

<jsp:include page="../../../include/user/jsp/alterModal.jsp" /> 

<script>
	function addChat(){
		$.ajax({
			url: '/chat/insChat'
			,type: 'POST'
			,datatype:'json'
			,data:{
				cuMember : $("#cuMember").val()
			}
			,success:function(result){
				console.log(result)
				if(result.rt=="success"){
					console.log("성공")
				}
			}
			,error:function(){
				console.log("ajax error..!");
			}
		});
	}
</script>