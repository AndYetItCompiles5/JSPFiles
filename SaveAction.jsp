<%@include file="verifyLogin.jsp"%>

<%@page language="java" import="Project.*,java.util.*"%>

<%
	UserUI userUI = (UserUI) session.getAttribute("userUI");

	String schoolName = request.getParameter("schoolName");
	boolean temp = userUI.saveSchool(session.getAttribute("username").toString(), schoolName);
	if(temp==false){%>
		<script type="text/javascript">
	
		alert("School could not be saved"); 
		window.location.href = "Search.jsp";
		</script>
		
	<%
	}
	else{
	response.sendRedirect("userMenu.jsp");
	}
	//response.sendRedirect("Search.jsp");
%>