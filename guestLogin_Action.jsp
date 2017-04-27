<%@page language="java" import="Project.*"%>

<%
	UserUI userUI = new UserUI();
	LoginUI loginUI = new LoginUI();
	AdminUI adminUI = new AdminUI();
	AccountController aController = new AccountController();
	DBController dbController = new DBController();
		session.setAttribute("userUI", userUI);
		session.setAttribute("aController2", aController);
		session.setAttribute("loginUI", loginUI);
		session.setAttribute("adminUI", adminUI);
		session.setAttribute("dbController", dbController);
		aController.loginGuest();
		response.sendRedirect("guestMenu.jsp");
%>

