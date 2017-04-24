<%@include file="verifyLogin.jsp"%>

<%@page language="java" import="Project.*,java.util.*"%>

<%
	AdminUI adminUI = (AdminUI) session.getAttribute("adminUI");
	DBController dbController = (DBController) session.getAttribute("dbController");

	String specificUsername = request.getParameter("Username");
	int result = dbController.deactivateUser(specificUsername);
	if(result==1){
		response.sendRedirect("ManageUsers.jsp?DeactivateError=1");
	}
	else if (result==2){
		response.sendRedirect("ManageUsers.jsp?DeactivateError=2");
	}
	else{
		response.sendRedirect("ManageUsers.jsp");
	}
%>