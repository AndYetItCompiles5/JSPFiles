<%@page language="java" import="Project.*"%>

<%LoginUI LoginUI = (LoginUI) session.getAttribute("loginUI"); 
if(LoginUI.getLoggedIn().equals("")){
	response.sendRedirect("index.jsp?Error=4");
	return;
}%>