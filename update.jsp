<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="board3.dao.Board3Dao" %>
<%@ page import="board3.dto.Board3Dto" %>
<%
	Board3Dao dao = new Board3Dao();
	Board3Dto dto = dao.update(request);
	
	pageContext.setAttribute("dto", dto);
	pageContext.setAttribute("chk", request.getParameter("chk"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="update_ok.jsp" autocomplete="off">
	<table width="500" align="center">
	<input type="hidden" name="id" value="${dto.id }">
	<caption><h3>수 정</h3></caption>
		<tr>
			<td width="100"> 이 름 </td>
			<td> <input type="text" name="name" value="${dto.name }"> </td>
		</tr>
		<tr>
			<td> 제 목 </td>
			<td> <input type="text" name="title" value="${dto.title }"> </td>
		</tr>
		<tr>
			<td> 내 용 </td>
			<td> <textarea cols="40" rows="5" name="content" value="${dto.content }"></textarea> </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pwd"> 
				<c:if test="${chk != null }">
					비밀번호가 틀렸습니다.
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"> <input type="submit" value="수 정"> </td>
		</tr>
	</table>
</body>
</html>