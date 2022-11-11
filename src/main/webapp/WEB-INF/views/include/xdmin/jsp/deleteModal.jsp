<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- modal -->
<div class="modal fade" id="listDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" role="document">
			<div class="modal-header">
				<h5 class="modal-title">삭제</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body d-flex align-items-center">
				<p></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn closeBtn" data-bs-dismiss="modal"></button>
				<button type="button" class="btn deleteBtn listModalDeleteBtn" id="listDeleteBtn">삭제</button>
			</div>
		</div>
	</div>
</div>

<!-- modal -->
<div class="modal fade" id="itemDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" role="document">
			<div class="modal-header">
				<h5 class="modal-title">삭제</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body d-flex align-items-center">
				<p>삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn closeBtn" data-bs-dismiss="modal"></button>
				<button type="button" class="btn itemDeleteBtn" id="itemDeleteBtn">삭제</button>
			</div>
		</div>
	</div>
</div>

<script>
	var str = window.location.pathname;
	str = str.split('/');

	$('#listDeleteModal').on('shown.bs.modal', function() {
		var button = $(event.relatedTarget);
		var recipient = button.data('whatever');
		var modal = $(this);
		
		if($(".chk").is(":checked") == false) {
			modal.find('.modal-body p').text('삭제할 항목을 선택해주세요.');
			modal.find('.closeBtn').text('확인');
			$(".listModalDeleteBtn").css("display", "none");
		} else {
			modal.find('.modal-body p').text('삭제하시겠습니까?');
			modal.find('.closeBtn').text('취소');
			$(".listModalDeleteBtn").css("display", "inline");
		}
	});
	
	$("#chkAll").on("click", function(){
		if ($(this).is(":checked")) {
			$(".chk").prop("checked", true);
		} else {
			$(".chk").prop("checked", false);
		}
		console.log($(this).prop("checked"))
	});
	
	$(".chk").on("click", function(e){
		e.stopPropagation();
		
		var chkSeq = $(this).data("seq");
		$("#listDeleteBtn").data("seq", chkSeq);
	});
	
	$("#listDeleteBtn").on("click", function(e){
		var chkSeq = $(this).data("seq");
		
		$.ajax({
			type:"post"
			, url:str[1]+"Delete"
			, data:{"seq":chkSeq}
			, success:function(data){
				if(data.result) {
					alert("삭제 완료");
					location.reload();
				}
			}
		});
	});
	
	var action;
	var modal2 = $("#itemDeleteModal");
	
	/* uelete 버튼 */
	$("#uelete").on("click", function(){
		action = "uelete";
		modal2.modal('show');
	});
	
	/* delete 버튼 */
	$("#delete").on("click", function(){
		action = "delete"
		modal2.modal('show');
	});
	
	$("#itemDeleteBtn").on("click", function(e){
		var seq = $("input:hidden[name=seq]");
		
		if(action == "uelete") {
			$.ajax({
				type:"post"
				, url:str[1]+"Uelete"
				, data:{"seq":seq.val()}
				, success:function(data){
					if(data.result) {
						if(str[1] == "admin") {
							location.href="memberList";
						} else {
							location.href=str[1]+"List";
						}
						
					}
				}
			});
		} else if(action == "delete") {
			$.ajax({
				type:"post"
				, url:str[1]+"Delete"
				, data:{"seq":seq.val()}
				, success:function(data){
					if(data.result) {
						if(str[1] == "admin") {
							location.href="memberList";
						} else {
							location.href=str[1]+"List";
						}
					}
				}
			});
		}
	});


</script>