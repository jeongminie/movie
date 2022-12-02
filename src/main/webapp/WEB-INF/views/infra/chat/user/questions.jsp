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
	<link rel="stylesheet" href="/resources/static/css/chat.css">
	
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
		<div class="inner-wrap">
			<%@include file = "../../../include/user/jsp/mypageAside.jsp" %>
			<div id="contents">
				<h2 class="tit">상담원 채팅</h2>
				<ul class="dot-list">
					<li>간편하게 채팅으로 문의해보세요.<br>월,화,수,목,금 10:00~17:00</li>
				</ul>
	        	<form id="mainForm" method="POST">
	        		<input type="hidden" id="selectedRoom">
		        	<div class="row h-100" style="margin-top: 10px; margin-bottom: 10px;">
		                <div class="col-md-8 col-xl-8 chat">
		                    <div class="card">	                       
		                        <div id="chatBox" class="card-body msg_card_body">
								<!-- 채팅 메세지 박스 -->
		                        </div>
		                        <div class="card-footer">
		                            <div class="input-group">
		                                <span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
		                                <textarea id="chatMessage" class="form-control type_msg"
		                                    placeholder="Type your message..."></textarea>
		                                <span class="input-group-text send_btn" id="sendBtn"><i class="fas fa-location-arrow"></i></span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
	            </form>
			</div>
		</div>
	</div>
	<input type="hidden" name="profile"/>
	<jsp:include page="../../../include/user/jsp/footer.jsp" />
	
	<jsp:include page="../../../include/user/jsp/loginModal.jsp" /> 
	<jsp:include page="../../../include/user/jsp/alterModal.jsp" /> 
	
	<script type="module">
	import { initializeApp } from "https://www.gstatic.com/firebasejs/9.14.0/firebase-app.js";
	
  //Firebase 프로젝트에서 추출한 정보 입력
	const firebaseConfig = {
  		apiKey: "AIzaSyAvI8Q6j5nrYJSUJj0tIekcmtLReygIjNk",
    	authDomain: "chattest-e9a6f.firebaseapp.com",
    	databaseURL: "https://chattest-e9a6f-default-rtdb.firebaseio.com",
    	projectId: "chattest-e9a6f",
    	storageBucket: "chattest-e9a6f.appspot.com",
    	messagingSenderId: "897828709982",
    	appId: "1:897828709982:web:625c08c5ca158043c0f6cf"
	};		
	// Initialize Firebase
	const app = initializeApp(firebaseConfig);

	import { getDatabase, ref, set, onValue }	from "https://www.gstatic.com/firebasejs/9.14.0/firebase-database.js";
	
	const db = getDatabase();

	var insMsg = document.getElementById("chatMessage");
	insMsg.addEventListener('keyup',enterKey);

	var sendBtn = document.getElementById("sendBtn");
	sendBtn.addEventListener('click',sendMessage);


	function enterKey() {
		
		var keycode = event.keyCode;
		
		if(keycode == 13) //Enter
			sendMessage();
	};
		
	function sendMessage(){

		var room = $("#selectedRoom").val();
	
		var message = $("#chatMessage").val();

		//메시지 입력창 초기화
		$("#chatMessage").val("");
		
		//새 메세지 추가하면 채팅방에 이전 기록도 다시 다 불러와서 한번 비워줌
		$("#chatBox").html(""); 	
	
		//새 메세지를 Firebase / realtime database / chat / 채팅방seq / 시간대 / 작성자 / 메세지에 입력합니다.
		set(ref(db,'chat/'+room+'/'+getnow()+'/'+${sessSeq} ),{
			Masseage: message
		})

		//스크롤을 제일 아래로 유지
		$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
	};
	
	function readMessage(chatSeq){

		$("#selectedRoom").val(chatSeq);
		
		const dbRef = ref(db, 'chat/'+chatSeq);
		const txt = "";
        onValue(dbRef,(snapshot) => {
            if(snapshot.key == $("#selectedRoom").val()){
				//채팅을 누르면 기존 채팅은 지우고 새로 불러오게
				$("#chatBox").html("");
                snapshot.forEach((childSnapshot) => {
                    const timetable = childSnapshot.key;
                    console.log(timetable); 
                    onValue(ref(db,'chat/'+chatSeq+'/'+timetable),(snapshot2) => {
                        snapshot2.forEach((childSnapshot2) => {
                            const writer = childSnapshot2.key
                            console.log(writer);
                        
                            onValue(ref(db,'chat/'+chatSeq+'/'+timetable+'/'+writer),(snapshot3) => {
								console.log(snapshot3);
                                snapshot3.forEach((childSnapshot3) => {
										console.log(childSnapshot3.val());
                                        const message = childSnapshot3.val()
                                        console.log(message);
                                            
                                        var txt = '';
                                        txt += '<div class="d-flex mb-4 justify-content-';
                                        txt += writer == ${sessSeq} ? 'end' : 'start';
                                        txt += '">';
                                        txt += '<div class="msg_cotainer';
                                        txt += writer == ${sessSeq} ? '_send' : '';
                                        txt += '">';
                                        txt += message;
                                        txt += '<span class="msg_time';
                                        txt += writer == ${sessSeq} ? '_send' : '';
                                        txt += '">';
                                        txt += getTimeFormat(timetable);
                                        txt += '</span>';
                                        txt += '</div>';
                                        txt += '</div>';

                                        $("#chatBox").append(txt);
                                        $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
                                    });
                                }); 
                            }); 
                        });
                    });
                 }		
            });	
	}

	$(document).ready(function(){
		readMessage(${item.chatSeq});
	}); 

	function getTimeFormat(timetable){
		//221105080634 
		return timetable.substring(0,2)+"-"+timetable.substring(2,4)+"-"+timetable.substring(4,6)+" "+timetable.substring(6,8)+":"+timetable.substring(8,10)+":"+timetable.substring(10,12);	
	}

	</script>
	
	<script>
		getnow = function() {
			var timestamp = new Date().getTime();
			
			var date = new Date(timestamp); //타임스탬프를 인자로 받아 Date 객체 생성
			
			var year = date.getFullYear().toString().slice(-2); //년도 뒤에 두자리
			var month = ("0" + (date.getMonth() + 1)).slice(-2); //월 2자리 (01, 02 ... 12)
			var day = ("0" + date.getDate()).slice(-2); //일 2자리 (01, 02 ... 31)
			var hour = ("0" + date.getHours()).slice(-2); //시 2자리 (00, 01 ... 23)
			var minute = ("0" + date.getMinutes()).slice(-2); //분 2자리 (00, 01 ... 59)
			var second = ("0" + date.getSeconds()).slice(-2); //초 2자리 (00, 01 ... 59)
			
			return year+month+day+hour+minute+second;
		};
		
		selectChatRoom = function (roomNo) {
            var roomArray = $("li[name=room]");
            roomArray.each(function (index, item) {
                if (index != roomNo - 1)
                    item.classList.remove("active");
                else
                    item.classList.add("active");
            });
        };
        
        $(document).ready(function(){
        	selectChatRoom(${item.chatSeq});
		});
    </script>	
	
	
</body>
</html>