<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="board3.dao.Board3Dao" %>
<%@ page import="board3.dto.Board3Dto" %>
<%
	Board3Dao dao = new Board3Dao();
	Board3Dto dto = dao.content(request);
	
	pageContext.setAttribute("dto", dto);
	pageContext.setAttribute("chk", request.getParameter("chk"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function del()
	{
		document.getElementById("del").style.display = "table-row";
	}
</script>
</head>
<body>
<table width="500" align="center" border="1" style="border-collapse:collapse;">
	<tr>
		<td width="100"> 작 성 자 </td>
		<td> ${dto.name } </td>
	</tr>
	<tr>
		<td> 제 목 </td>
		<td> ${dto.title } </td>
	</tr>
	<tr>
		<td> 내 용 </td>
		<td> ${dto.content } </td>
	</tr>
	<tr>
		<td> 조 회 수 </td>
		<td> ${dto.readnum } </td>
	</tr>
	<tr>
		<td> 작 성 일 </td>
		<td> ${dto.writeday } </td>
	</tr>
	<tr align="center">
		<td colspan="2"> <a href="list.jsp" style="text-decoration:none;color:black">목록으로</a>
			<a href="javascript:del()" style="text-decoration:none;color:black">삭제하기</a>
			<a href="update.jsp?id=${dto.id }" style="text-decoration:none;color:black">수정하기</a>
		</td>
	</tr>
	<c:if test="${chk != null }">
		<tr align="center">
			<td colspan="2" color="red"> 비밀번호가 틀렸습니다. </td>
		</tr>
	</c:if>
	<tr align="center" id="del" style="display:none;">
		<td colspan="2">
		<form method="post" name="del" action="delete.jsp?id=${dto.id }">
			<input type="hidden" name="id" value="${dto.id }">
			비밀번호 <input type="password" name="pwd">
			<input type="submit" value="삭제">
		</form>
		</td>
	</tr>
</table>
</body>
</html>