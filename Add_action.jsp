<%@page language="java" import="java.util.*,Project.*"%>

<%
	UserFuncController uc = new UserFuncController();
	//*(UserFuncController)session.getAttribute("sess")
	DBController dbController = new DBController();
	//*(DBController) session.getAttribute("dbController")
	if(){
	String fName = request.getParameter("FirstName");
	String lName = request.getParameter("LastName");
	String uName = request.getParameter("Username");
	String pass = request.getParameter("Password");
	char type = request.getParameter("Type").charAt(0);
	int integer = Integer.parseInt(dbController.addAccount(fName, lName, uName, pass, type));
	if(integer == 0)
	{
		dbController.addAccount(fName, lName, uName, pass, type);
		response.sendRedirect("ManageUsers.jsp");
	}
	else if(integer == 1) response.sendRedirect("Add.jsp?error=1");
	else if(integer == 2) response.sendRedirect("Add.jsp?error=2");
	else response.sendRedirect("Add.jsp?error=3");
%>