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
	background-color : #BEB4AF!important;
	border : 0px;
}
  		
.login-btn:hover {
	color : white;
	background-color : #BEB4AF;
	border : 0px;
}

.btn-close {
	color :white;
}

.w300px {
	width : 300px !important;
}

.modal-footer {
    display: flex;
    justify-content: center;
    align-content: center;
}

.sns-login {
	margin-left: 90px;
}

#naverBtn img {
	width : 183px;
	height: 45px;
	margin-top: 10px;
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
					<input type="text" id="loginId" name="loginId" class="form-control mb-2 w300px" placeholder="아이디" value="test">
					<input type="password" id="password" name="password" class="form-control mb-3 w300px" placeholder="비밀번호" value="test">
					<button type="button" id="loginBtn" class="btn login-btn w300px mb-3">로그인</button>
					<p class="d-flex justify-content-center">
						<a href="#" class="text-dark">ID/PW 찾기</a>
						<span class="mr-3 ml-3">|</span>
						<a href="/member/signup" class="text-dark">회원가입</a>
					</p>
				</div>
			</form>
			</div>
			<div class="modal-footer">
				<div class="sns-login">
					<a href="#" id="kakaoBtn" title="카카오톡으로 로그인 선택"><img src="/resources/static/image/kakao_login_medium_narrow.png" alt="카카오톡"></a>
					<a href="#" id="naverBtn" title="네이버로 로그인 선택"><img src="/resources/static/image/btnG_완성형.png" alt="네이버"></a>
				</div>
			</div>
		</div>
	</div>
</div>

<form name="form">
	<input type="hidden" name="name"/>
	<input type="hidden" name="snsId"/>
	<input type="hidden" name="phone"/>
	<input type="hidden" name="email"/>
	<input type="hidden" name="gender"/>
	<input type="hidden" name="birth"/>
	<input type="hidden" name="snsImg"/>
	<input type="hidden" name="token"/>
</form>

<!-- naver login -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	
<!-- kakao login -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	//카카오
	Kakao.init('07294d6c3c28278176fbea6c96ff7670'); // test 용
	console.log(Kakao.isInitialized());

	//네이버
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "8jm_edv8XpFwiRCe5LWv",
			callbackUrl: "http://localhost:8080",
		}
	);
	naverLogin.init();
	
	$("#naverBtn").on("click", function(){
		naverLogin.getLoginStatus(function (status) {
			if (!status) {
				naverLogin.authorize(); //네이버 로그인 팝업창 띄움
			} else {
			setLoginStatus();
			}
		});
	})
	
	//네이버 로그인 입력 후 로그인화면 로드 될때 실행 이벤트
	window.addEventListener('load', function () {
		if (naverLogin.accessToken != null) {
  			naverLogin.getLoginStatus(function (status) {
  				if (status) {
  					setLoginStatus();
  				}
			});
		}
	});
	
	function setLoginStatus() {
		if (naverLogin.user.gender == 'M'){
			$("input[name=gender]").val(90);
		} else {
			$("input[name=gender]").val(89);
		} 
		
		$.ajax({
			async: true
			,cache: false
			,type:"POST"
			,url: "/member/naverLoginProc"
			,data: {"name": naverLogin.user.name, "snsId": "네이버로그인", "phone": naverLogin.user.mobile, "email": naverLogin.user.email, "gender": $("input[name=gender]").val(), "birth": naverLogin.user.birthyear+"-"+naverLogin.user.birthday, "snsImg": naverLogin.user.profile_image}
			,success : function(response) {
				if (response.rt == "fail") {
					alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
					return false;
				} else {
					window.location.href = "/";
					
					return;
				}
			},
			error : function(jqXHR, status, error) {
				alert("알 수 없는 에러 [ " + error + " ]");
			}
		});
	}
	
	$(document).ready(function(){
		
		$("#kakaoBtn").on("click", function() {
			Kakao.Auth.login({
			      success: function (response) {
			        Kakao.API.request({
			          url: '/v2/user/me',
			          success: function (response) {
			        	  
			        	  var accessToken = Kakao.Auth.getAccessToken();
			        	  Kakao.Auth.setAccessToken(accessToken);
		
			        	  var account = response.kakao_account;
			        	  
			        	  console.log(response)
			        	  console.log("email : " + account.email);
			        	  console.log("name : " + account.name);
			        	  console.log("nickname : " + account.profile.nickname);
			        	  console.log("picture : " + account.profile.thumbnail_image_url);
			        	  console.log("picture : " + account.gender);
			        	  console.log("picture : " + account.birthday);
			        	  console.log("picture : " + account.birthday.substring(0,2) + "-" + account.birthday.substring(2,account.birthday.length));
		      	  
			        	  $("input[name=snsId]").val("카카오로그인");
			        	  $("input[name=name]").val(account.profile.nickname);
			        	  $("input[name=phone]").val(account.profile.phone_number);
			        	  $("input[name=email]").val(account.email);
			        	  $("input[name=birth]").val(account.birthday.substring(0,2) + "-" + account.birthday.substring(2,account.birthday.length));
			        	  $("input[name=snsImg]").val(account.profile.thumbnail_image_url);
			        	  $("input[name=token]").val(accessToken);
			        	  
			        	  if (account.gender === "male") {
			        		  $("input[name=gender]").val(90);
		      		  } else {
		      			  $("input[name=gender]").val(89);
		 			  } 
			        	  
			        	 /*  $("form[name=form]").attr("action", "/member/kakaoLoginProc").submit(); */
					
			        	  $.ajax({
								async: true
								,cache: false
								,type:"POST"
								,url: "/member/kakaoLoginProc"
								,data: {"name": $("input[name=name]").val(), "snsId": $("input[name=snsId]").val(), "phone": $("input[name=phone]").val(), "emailFull": $("input[name=email]").val(), "gender": $("input[name=gender]").val(), "birth": $("input[name=birth]").val(), "snsImg": $("input[name=snsImg]").val(), "token": $("input[name=token]").val()}
								,success : function(response) {
									if (response.rt == "fail") {
										alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
										return false;
									} else {
										window.location.href = "/";
									}
								},
								error : function(jqXHR, status, error) {
									alert("알 수 없는 에러 [ " + error + " ]");
								}
						});
			          },
			          fail: function (error) {
			            console.log(error)
			          },
			        })
			      },
			      fail: function (error) {
			        console.log(error)
			      },
			    })
		});
		
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
			
			/* $("#login").submit(); */
			
			$.ajax({
				type : 'post',
				url : '/member/login',
				data : {"loginId":loginId, "password":password},
				success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						alert("이메일과 비밀번호를 확인하세요");
						$("#loginId").focus();
						return;
					}
				},
				error:function(e){
					alert("로그인실패");
				}
			})
		})
	});

</script>