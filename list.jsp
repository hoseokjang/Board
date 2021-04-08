<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="board3.dao.Board3Dao" %>
<%@ page import="board3.dto.Board3Dto" %>
<%@ page import="java.util.ArrayList" %>
<%
	Board3Dao dao = new Board3Dao();
	ArrayList<Board3Dto> list = dao.list();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="500" align="center">
	<caption><h3>글 목 록</h3></caption>
	<tr align="center" style="font-weight:bold;">
		<td> 작 성 자 </td>
		<td> 제 목 </td>
		<td> 조 회 수 </td>
		<td> 작 성 일 </td>
	</tr>
	<c:forEach var="dto" items="${list }">
		<tr align="center">
			<td> ${dto.name } </td>
			<td> <a href="readnum.jsp?id=${dto.id }" style="text-decoration:none;color:black"> ${dto.title } </a> </td>
			<td> ${dto.readnum } </td>
			<td> ${dto.writeday } </td>
		</tr>
	</c:forEach>
	<tr align="center">
		<td colspan="4"> <a href="write.jsp" style="text-decoration:none;color:black;font-weight:bold"> 글 작 성 </a> </td>
	</tr>
</table>
</body>
</html>