<%@page language="java" import="Project.*"%>
<%
	LoginUI loginUI = (LoginUI) session.getAttribute("loginUI");
	if (loginUI.getLoggedIn()==null){%>
		<script type="text/javascript">
			alert("No one is logged in");
			</script>
	<%}
	else{
		loginUI.logout();
	response.sendRedirect("index.jsp");
	}
%>