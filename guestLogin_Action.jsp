<%@page language="java" import="Project.*"%>

<%
	UserUI userUI = new UserUI();
	LoginUI loginUI = new LoginUI();
	AdminUI adminUI = new AdminUI();
	AccountController aController = new AccountController();
	DBController dbController = new DBController();
	String name = "guest";
		session.setAttribute("userUI", userUI);
		session.setAttribute("aController", aController);
		session.setAttribute("loginUI", loginUI);
		session.setAttribute("adminUI", adminUI);
		session.setAttribute("dbController", dbController);
		aController.setLoggedIn(name);
		response.sendRedirect("Search.jsp");
%>
