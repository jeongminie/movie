<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav aria-label="Page navigation example" class="d-flex justify-content-center">
	<ul class="pagination">
		<c:if test="${vo.startPage gt vo.pageNumToShow}">
			<li class="page-item">
				<a class="page-link" href="<c:url value="javascript:goList(${vo.startPage - 1})" />">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${vo.startPage }" end="${vo.endPage }" varStatus="i">
			<li class="page-item">
				<a class="page-link" href="javascript:goList(${i.index})">${i.index}</a>
			</li>
		</c:forEach>
		<c:if test="${vo.endPage ne vo.totalPages}">  
			<li class="page-item">
				<a class="page-link" href="<c:url value="javascript:goList(${vo.endPage + 1})" />">다음</a>
			</li>
		</c:if>
	</ul>
</nav>