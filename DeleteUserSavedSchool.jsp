
<%@page language="java" import="Project.*,java.util.*"%>

<%
	DBController dbController = (DBController) session.getAttribute("dbController");

	String schoolToRemove = request.getParameter("schoolName");
	//String username = request.getParameter("Username");
	String username = session.getAttribute("username").toString();
	dbController.removeSchool(username, schoolToRemove);
	response.sendRedirect("userSavedSchools.jsp");
%>
