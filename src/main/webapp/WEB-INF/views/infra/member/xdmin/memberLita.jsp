<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.jeongmini.movie.modules.code.CodeServiceImpl"/>
<div class="d-flex p-2 justify-content-between">
	<div class="mt-2">
		<span class="p-2">Total : ${shTotal }</span>
	</div>
	<div>
		<button type="button" class="btn excelBtn"><i class="fa-solid fa-file-excel"></i></button>
		<a href="#" class="btn createBtn"><i class="fa-solid fa-circle-plus"></i></a>
	</div>
</div>
<table class="table text-center memberTable">
	<thead>
		<tr>
			<th scope="col"><input type="checkbox" id="chkAll"></th>
			<th scope="col">No</th>
			<th scope="col">이름</th>
			<th scope="col">아이디</th>
			<th scope="col">성별</th>
			<th scope="col">생년월일</th>
			<th scope="col">이메일</th>
			<th scope="col">전화번호</th>
			<th scope="col">가입날짜</th>
			<th scope="col">수정일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<tr class="memberView">
					<td colspan="9">There is no data</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="list" varStatus="status">
					<tr class="memberView" onclick="javascript:goForm(<c:out value="${list.seq }"/>)">
						<th scope="col"><input type="checkbox" class="chk" data-seq="${list.seq }"></th>
						<th scope="row">${seq }</th>
						<td>${list.name }</td>
						<td>${list.loginId }</td>
						<%-- <td>
							<c:choose>
								<c:when test="${list.gender eq 0}">남</c:when>
								<c:otherwise>여</c:otherwise>
							</c:choose>
						</td> --%>
						<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('1000')}"/>
						<td>
							<c:forEach items="${listCodeGender}" var="listGender" varStatus="statusGender">
								<c:if test="${list.gender eq listGender.seq}"><c:out value="${listGender.ccName }"/></c:if>
							</c:forEach>
						</td>
						<%-- <td><fmt:formatDate value="${list.birth}" pattern="yyyy-MM-dd"/></td> --%>
						<c:choose>
							<c:when test="${list.loginId eq '카카오로그인' }">
								<td>${list.birth}</td>
							</c:when>
							<c:when test="${empty list.birth }">
								<td>${list.birth}</td>
							</c:when>
							<c:otherwise>
								<c:set var="birth" value="${list.birth }" />
								<td>${fn:substring(birth, 0, 4)}-${fn:substring(birth, 4, 6)}-${fn:substring(birth, 6, 8)}</td>
							</c:otherwise>
						</c:choose>
						<td>${list.emailFull }</td>
						<td>
							<c:if test="${not empty list.phone }">
								<c:set var="phone1" value="${fn:substring(list.phone,0,3)}" />
								<c:set var="phone2" value="${fn:substring(list.phone,3,7)}" />
								<c:set var="phone3" value="${fn:substring(list.phone,7,12)}" />
								${phone1 }-${phone2 }-${phone3 }
							</c:if>
						</td>
						<td><fmt:formatDate value="${list.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${list.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<div class="d-flex justify-content-end">				
	<div>
		<button type="button" class="btn cancelBtn"><i class="fa-solid fa-xmark"></i></button>
		<button type="button" class="btn deleteBtn" data-bs-toggle="modal" data-bs-target="#listDeleteModal" data-bs-whatever="true"><i class="fa-solid fa-trash-can"></i></button>
	</div>
</div>
<!-- pagination s -->
<%@include file="../../../include/xdmin/jsp/pagination.jsp"%>
<!-- pagination e -->

<%@include file="../../../include/xdmin/jsp/deleteModal.jsp"%>

<script>
	var seq = $("input:hidden[name=seq]");
	var form = $("form[name=form]");
	
	goForm = function(keyValue) {
		seq.val(keyValue);
		form.attr("action", "/admin/memberRegForm").submit();
	}
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", "/admin/memberList").submit();
	}
	
	$(".resetBtn").on("click", function(){
		location.href="memberList";
	});
	
	$(".createBtn").on("click", function(){
		goForm(0);
	});
	
	$(".excelBtn").click(function() {
		form.attr("action", "/admin/excelDownload").submit();
	});
</script>