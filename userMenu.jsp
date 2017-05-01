<%@include file="verifyLogin.jsp"%>
<%@page language="java" import="java.util.*,Project.*"%>

<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>userMenu.jsp</title>
</head>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}
td:nth-child(even){
	background-color: #d1e0e0;
}

th {
	text-align: center;
	vertical-align: bottom;
	background-color: darkslategray;
    color: white;
    font-size: 20px;
    font-family: Verdana, Helvetica, sans-serif;
    height:60px;
}
td{
	text-align: center;
	vertical-align: bottom;
	font-family: Verdana, Helvetica, sans-serif;
	font-weight: bold;
	background-color: darkslategray;;
	color: white;
    font-size: 14px;
    height:50px;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
    border:1px solid silver;
}

li {
    float: left;
    border-right:1px solid silver;
}

li:last-child {
    border-right: none;
    border-left: 1px solid silver;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111;
}

.active {
    background-color: darkslategray;
}
.header{
	font-family: Verdana, Helvetica, sans-serif;
	text-decoration: none;
	font-size: 28px;
}
</style>
<body>
<ul>
	<li><a href="userMenu.jsp" class="active"><img border="0" alt="CMCadmin" src="g114.png" width="34" height="18"></a></li>
	<li><a href="Search.jsp">Search for Universities</a></li>
	<li><a href="userSavedSchools.jsp">My Saved Schools</a></li>
	<li><a href="EditProfile.jsp">My Profile</a></li>&nbsp;
	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
</ul>
<p class="header">Hello, <%=session.getAttribute("username") %></p>
</body>
</html>