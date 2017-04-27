<%@page language="java" import="Project.*"%>

<%
		AccountController aController2 = (AccountController) session.getAttribute("aController2");
		aController2.setLoggedIn("");	
		
		response.sendRedirect("index.jsp");
%>
