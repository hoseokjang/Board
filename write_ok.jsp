<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board3.dao.Board3Dao" %>
<%
	Board3Dao dao = new Board3Dao();
	dao.write(request);
	
	response.sendRedirect("list.jsp");
%>