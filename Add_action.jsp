
<%@page language="java" import="java.util.*,Project.*"%>
<%@include file="verifyLogin.jsp"%>
<%
	UserFuncController uc = (UserFuncController)session.getAttribute("sess");
	DBController dbController = (DBController) session.getAttribute("dbController");
	String fName = request.getParameter("FirstName");
	String lName = request.getParameter("LastName");
	String uName = request.getParameter("Username");
	String pass = request.getParameter("Password");
	char type = request.getParameter("Type").charAt(0);
	if(pass.equals("")){
		%><script type="text/javascript">
		
		alert("Password cannot be empty"); 
		window.location.href = "Add.jsp";
		</script>
	<% }
	else if(uName.equals("")){
		%><script type="text/javascript">
		
		alert("Username cannot be empty"); 
		window.location.href = "Add.jsp";
		</script>
	<% }
	else if(dbController.isUsernameTaken(uName)){
		%><script type="text/javascript">
		
		alert("Username is already taken"); 
		window.location.href = "Add.jsp";
		</script>
	<% 
	}
	else{
	int integer = Integer.parseInt(dbController.addAccount(fName, lName, uName, pass, type));

	if (integer == 0)
		response.sendRedirect("ManageUsers.jsp");
	else if (integer == 1)
		response.sendRedirect("Add.jsp?error=1");
	else if (integer == 2)
		response.sendRedirect("Add.jsp?error=2");
	else
		response.sendRedirect("Add.jsp?error=3");
	}
%>