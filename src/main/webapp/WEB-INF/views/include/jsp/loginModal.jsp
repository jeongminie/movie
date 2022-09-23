<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
.modal {
	border : 0px;
}

.modal-content {
	border : 0px;
	border-radius: 0px;
	width : 80%
}

.modal-header {
	height : 25px;
	background-color: #BEB4AF;
	border-radius: 0px;
	color : white;
	align-items : center;
	margin-bottom: 10px;
}

.login-btn {
	border : 1px solid #DADADA;
	width : 200px;
	color : white;
	background-color : #BEB4AF;
	border : 0px;
}
  		
.login-btn:hover {
	color : white;
	background-color : #BEB4AF;
	border : 0px;
}

 </style>   
    
<!-- modal -->
<div class="modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" role="document">
			<div class="modal-header">
				<span class="modal-title">로그인</span>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body d-flex justify-content-center">
			<form method="post" action="../member/login" id="login">
			<%-- <input type="hidden" name="redirectUrl" value="<%= request.getRequestURI().toString()%>"> --%>
				<div>
					<input type="text" id="loginId" name="loginId" class="form-control mb-2" placeholder="아이디">
					<input type="password" id="password" name="password" class="form-control mb-3" placeholder="비밀번호">
					<button type="button" id="loginBtn" class="btn login-btn w-100 mb-3">로그인</button>
					<p class="d-flex justify-content-center">
						<a href="#" class="text-dark">ID/PW 찾기</a>
						<span class="mr-3 ml-3">|</span>
						<a href="#" class="text-dark">회원가입</a>
					</p>
				</div>
			</form>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn deleteBtn">삭제하기</button> -->
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		$("#loginBtn").on("click", function(){
			var loginId = $("#loginId").val();
			var password = $("#password").val();
			
			if(loginId == null || loginId == "") {
				alert("아이디를 입력해주세요");
				
				return;
			}
			
			if(password == null || password == "") {
				alert("비밀번호를 입력해주세요");
				
				return;
			}
			
			$("#login").submit();
		})
	});

</script>