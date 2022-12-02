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
	<link rel="stylesheet" href="/resources/static/css/xdmin/chat.css">
	
	<title>회원관리</title>
</head>
<body>
	<div id="wrap">
		<%@include file="../../../include/xdmin/jsp/menu.jsp" %>
		<div class="container">
		<span class="m-4"><b>실시간 문의 관리</b></span>
	        <div class="page-content">
	        	<form id="mainForm" method="POST">
	        		<input type="hidden" id="selectedRoom">
		        	<div class="row h-100 mt-4">
		                <div class="col-md-4 col-xl-3 chat">
		                    <div class="card mb-sm-3 mb-md-0 contacts_card">
		                        <div class="card-header">
		                        <span>회원 클릭 후 채팅 입력이 가능합니다.</span>
		                        </div>
		                        <div class="card-body contacts_body">
		                            <ui class="contacts" id="chatList">
		                            	<c:forEach items="${list }" var="list" varStatus="status">
											<li class="room" id="${list.chatSeq}" onclick="selectChatRoom(${list.chatSeq})" style="cursor: pointer;">
			                                    <div class="d-flex bd-highlight">
			                                        <div class="img_cont">
														<!-- 아래 path 와 uuidname 도 본인의 dto field에 맞게 수정 -->
			                                            <img src="<c:if test = "${list.path ne null}">${list.path}${list.uuidName}</c:if>" class="rounded-circle user_img">
			                                        </div>
			                                        <div class="chat_product_info">
														<!-- 아래 mmNickName  도 본인의 dto field에 맞게 수정 -->
			                                            <span class="status"><c:out value="${list.name }"/></span>
			                                 			<p>TEST TEXT FIELD</p>
			                                        </div>
			                                    </div>
			                                </li>
		                            	</c:forEach>
		                            </ui>
		                        </div>
		                    </div>
		                </div>
		                <div class="col-md-8 col-xl-6 chat">
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
		</section>
	</div>
	
	<script src="https://kit.fontawesome.com/63aa3074b3.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

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
	
		if(room == "") {
			//채팅방을 선택하지 않고 메세지 보내면 동작하지 않도록
			$("#chatMessage").val("");
			return;
		}

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
	
	function readMessage(e){

		const room = e.id; 
		$("#selectedRoom").val(room);
		
		const dbRef = ref(db, 'chat/'+room);
		const txt = "";
        onValue(dbRef,(snapshot) => {
            if(snapshot.key == $("#selectedRoom").val()){
				//채팅을 누르면 기존 채팅은 지우고 새로 불러오게
				$("#chatBox").html("");
                snapshot.forEach((childSnapshot) => {
                    const timetable = childSnapshot.key;
                    console.log(timetable); 
                    onValue(ref(db,'chat/'+room+'/'+timetable),(snapshot2) => {
                        snapshot2.forEach((childSnapshot2) => {
                            const writer = childSnapshot2.key
                            console.log(writer);
                        
                            onValue(ref(db,'chat/'+room+'/'+timetable+'/'+writer),(snapshot3) => {
                                snapshot3.forEach((childSnapshot3) => {
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

	$(".room").click(function(){
		readMessage(event.currentTarget);
				
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

		addChat = function(){
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
								
								$("#cuMember").val("");
								var txt="";
								txt+='<li class="room" id="';
								txt+=result.newChat.chatSeq;
								txt+='" onclick="selectChatRoom(';
								txt+=result.newChat.chatSeq;
								txt+=')">';
								txt+='<div class="d-flex bd-highlight">';
								txt+='<div class="img_cont">';
								//아래 path 와 uuidname 도 본인의 dto field에 맞게 수정
								txt+='<img src="';
								if(result.newChat.path != null)
								{
									txt+=result.newChat.path + result.newChat.uuidName;
								}
								txt+='" class="rounded-circle user_img">';
								txt+='</div>';
								txt+='<div class="chat_product_info">';
								txt+='<span class="status">';
								txt+=result.newChat.id;
								txt+='</span>';
								txt+='<p>TEST TEXT FIELD</p>';
								txt+='</div>';
								txt+='</div>';
								txt+='</li>';
								$("#chatList").prepend(txt);
							}else{
								alert("fail..!");
							}
						}
						,error:function(){
							alert("ajax error..!");
						}
					});
				}
		
		function setEmptyImage(img) {
			img.src='/resources/static/image/profile.jpg';
			$(img).addClass('noImg');
		}
    </script>
</body>
</html>
