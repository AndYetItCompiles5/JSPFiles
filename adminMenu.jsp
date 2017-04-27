<%@page language="java" import="java.util.*,Project.*"%>

<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>adminMenu.jsp</title>
</head>

<style>
body{
	background-color: ;
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

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #111;
}
}
</style>

<body>

<ul>
	<li><a href="adminMenu.jsp" class="active"><img border="0" alt="CMCadmin" src="CMC_Admin.png" width="34" height="16"></a></li>
  	<li><a href="manageUniv.jsp">Universities</a></li>
  	<li><a href="ManageUsers.jsp">Manage Users</a></li>
 	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
 </ul>
</body>
</html>

