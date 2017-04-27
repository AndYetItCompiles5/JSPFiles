<%@include file="verifyLogin.jsp"%>

<%@page language="java" import="Project.*,java.util.*"%>

<%
	AdminUI adminUI = (AdminUI) session.getAttribute("adminUI");
	DBController dbController = (DBController) session.getAttribute("dbController");

	String specificUsername = request.getParameter("Username");
	int result = dbController.reactivateUser(specificUsername);
	if(result==0){
	response.sendRedirect("ManageUsers.jsp");
	}
	else{
		response.sendRedirect("Search.jsp");
	}
%>