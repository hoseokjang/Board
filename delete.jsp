<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board3.dao.Board3Dao" %>
<%
	Board3Dao dao = new Board3Dao();
	int chk = dao.delete(request);
	
	if (chk == 0)
	{
		response.sendRedirect("list.jsp");
	}
	else
	{
		response.sendRedirect("content.jsp?chk=1&id="+request.getParameter("id"));
	}
%>