
<%@page language="java" import="java.util.*,Project.*"%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Guest Menu</title>
</head>
<style>
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
	<li><a href="adminMenu.jsp" class="active"><img border="0" alt="CMCadmin" src="g60.png" width="34" height="16"></a></li>
	<li><a href="Search.jsp">Search for Universities</a></li>
	<li style="float:right"><a href="guestLogout_Action.jsp">Login</a></li>
</ul>
<p class="header">Hello, Guest</p>
<br>
</body>
</html>
