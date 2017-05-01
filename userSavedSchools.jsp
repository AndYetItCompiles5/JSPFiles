
<%@page language="java" import="java.util.*,Project.*,java.io.*"%>
<%@include file="verifyLogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title></title>
</head>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}
td:nth-child(even){
	color: black;
	width: 400px;
}

th {
	text-align: center;
	vertical-align: bottom;
	background-color: darkslategray;
    color: white;
    font-size: 20px;
    font-family: Verdana, Helvetica, sans-serif;
    height:60px;
    width:100px;
}
td{
	text-align: center;
	vertical-align: bottom;
	font-family: Verdana, Helvetica, sans-serif;
	font-weight: bold;
	background-color: #d1e0e0;
    font-size: 14px;
    height:50px;
    width: 300px;
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
.deleteButton {
	argin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #cc0000;
	color: white;
	font-family: Verdana, Helvetica, sans-serif;
	padding: 10px 15px;
	text-decoration: none;
	display: inline-block;
	border: none;
}
.viewButton{
	width: auto;
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #33334d;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 10px 15px;
    text-decoration: none;
    display: inline-block;
    border: none;
    border-radius: 0px;
	
}
.viewButton:hover{
	background-color: #52527a;
}
.deleteButton:hover {
	background-color: #ff0000;
}
.name{
	font-family: Verdana, Helvetica, sans-serif;
	text-decoration: none;
	color: black;
}
.name:hover{
	color: #666699;
}
</style>
<body>
	<ul>
	<li>
	<% 
		AccountController aController2 = (AccountController) session.getAttribute("aController2");
		if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
		<a href="userMenu.jsp"><img border="0" alt="CMCadmin" src="g114.png" width="34" height="16"></a> 
		<%} 
		else{ %>
			<a href="guestMenu.jsp"><img border="0" alt="CMCadmin" src="g4535-7.png" width="34" height="16"></a>
		<%}%>
	</li>
	<li><a href="Search.jsp">Search for Universities</a></li>
	<li><a href="userSavedSchools.jsp" class="active">My Saved Schools</a></li>
	<li><a href="EditProfile.jsp">My Profile</a></li>&nbsp;
	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
	</ul>
	<%
		DBController dbController = (DBController) session.getAttribute("dbController");
		//Account currentU = dbController.getAccount(session.getAttribute("username").toString());
		//String username = (String) session.getAttribute("username");
		String username = session.getAttribute("username").toString();

		ArrayList<String> userSavedSchools = dbController.getUserSavedSchools(username);
	%>
	<br>
	<br>
	<table style="text-align: left; width: 30%;" border="1">
		<tbody>
			<tr align="center">
				<th colspan="3" rowspan="1" style="vertical-align: top;">Saved
					Schools
				</th>
			</tr>
			<%
				for (int i = 0; i < userSavedSchools.size(); i++) {
			%>
				<script>
					function confirmDelete(){
						 return confirm("Are you sure you want to delete this school from your list?");
						}
					</script>
			<tr>
				<td style="vertical-align: top;">
					<form method="post" onClick="return confirmDelete()" action="DeleteUserSavedSchool.jsp"
						name="Delete">
						<input type="submit" name="Delete" value="Delete"
							class="deleteButton"> <input name="Username"
							value="" type="hidden"> <input type="hidden"
							name="schoolName" value="<%=userSavedSchools.get(i)%>">
					</form>
				</td>
				<td style="vertical-align: top;">
					<a href="<%= dbController.findWebsite(userSavedSchools.get(i)) %>" class="name"><%= userSavedSchools.get(i) %></a>
					<br>
				</td>

				<td style="vertical-align: top;">
					<form method="post" action="viewSchool.jsp" name="View">
						<input type="submit" name="View" value="View" class="viewButton"> <input
							type="hidden" name="schoolName"
							value="<%=userSavedSchools.get(i)%>">
					</form>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<br>
</body>
</html>
