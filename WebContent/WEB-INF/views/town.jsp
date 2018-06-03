<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td>지역명</td>
			<%-- <c:if test="${}"> --%>
			<td>미세먼지</td>
			<%-- </c:if> --%>
			<td>녹지</td>
			<td>가로수 수</td>
			<td>체육시설</td>
			<td>도서관 수</td>
			<td>관련 시설 수</td>
			<td>어린이집 평가점수</td>
			<td>교통사고 수</td>
			<td>유흥시설 수</td>
			<td>혐오시설 수</td>
			<td>범죄수</td>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.lo_name}</td>
				<td>${vo.su_dust}</td>
				<td>${vo.su_green}</td>
				<td>${vo.su_tree}</td>
				<td>${vo.ed_gym}</td>
				<td>${vo.ed_library}</td>
				<td>${vo.ed_facility_ratio}</td>
				<td>${vo.ed_facility_grade}</td>
				<td>${vo.ha_car}</td>
				<td>${vo.ha_bar}</td>
				<td>${vo.ha_disgust}</td>
				<td><c:forEach var="crime_name" items="${vo.crime_name}"
						varStatus="status">
						${crime_name} : ${vo.crime_num[status.index]} 회
						<br>
					</c:forEach></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>