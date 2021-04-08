<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board3.dao.Board3Dao" %>
<%
	Board3Dao dao = new Board3Dao();
	int chk = dao.update_ok(request);
	
	if (chk == 0)
	{
		response.sendRedirect("content.jsp?id="+request.getParameter("id"));
	}
	else
	{
		response.sendRedirect("update.jsp?chk=1&id="+request.getParameter("id"));
	}
%>