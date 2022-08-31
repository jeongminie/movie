<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

codegroup

<br>

<c:forEach items="${list}" var="list" varStatus="status">
	<c:out value="${list.cgSeq }"/> / <c:out value="${list.cgName }"/> / <c:out value="${list.createdAt }"/>
	<br>		
</c:forEach>