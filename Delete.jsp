<%@include file="verifyLogin.jsp"%>
<%@page language="java" import="Project.*,java.util.*"%>

<%
DBController dbController = (DBController) session.getAttribute("dbController");

   String specificUsername = request.getParameter("Username");
   dbController.deleteUser(specificUsername);
   response.sendRedirect("ManageUsers.jsp");
%>
