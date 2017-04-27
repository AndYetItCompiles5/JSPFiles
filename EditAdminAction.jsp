<%@include file="verifyLogin.jsp"%>

<%@page language="java" import="Project.*,java.util.*"%>

<%
	AdminUI adminUI = (AdminUI) session.getAttribute("adminUI");
	DBController dbController = (DBController) session.getAttribute("dbController");
	String specificUsername = request.getParameter("Username");
	Account specificUser = dbController.getAccount(specificUsername);
	String fName = request.getParameter("FirstName");
	String lName = request.getParameter("LastName");
	String uName = request.getParameter("Username");
	String password = request.getParameter("Password");
	char type = request.getParameter("Type").charAt(0);
	char status = request.getParameter("Status").charAt(0);
	if(password.equals("")){
		%><script type="text/javascript">
		
		alert("Password cannot be empty"); 
		window.location.href = "Edit.jsp";
		</script>
	<% }
	dbController.editAccount(fName, lName, uName, password, type, status);
	response.sendRedirect("ManageUsers.jsp");
%>