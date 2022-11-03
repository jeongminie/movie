<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>도로교통공단_보행어린이사고다발지역정보서비스</h2>
	
	resultMsg : <c:out value="${resultMsg}"/><br>
	resultCode : <c:out value="${resultCode}"/><br>
	
	<br>
	
	<c:forEach items="${item}" var="item" varStatus="status">
		다발지역ID : <c:out value="${item.afos_id }"/><br>
		시도시군구명 : <c:out value="${item.sido_sgg_nm }"/><br>
		지점명 : <c:out value="${item.spot_nm }"/><br>
		발생건수 : <c:out value="${item.occrrnc_cnt }"/><br>
		사상자수 : <c:out value="${item.caslt_cnt }"/><br>
		사망자수 : <c:out value="${item.dth_dnv_cnt }"/><br><br>
	</c:forEach>

</body>
</html>