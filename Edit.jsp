<%@page language="java" import="Project.*,java.util.*"%>
<html>
<head>
<%@include file="verifyLogin.jsp"%>
<title></title>
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
	background-color: darkslategray;
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
.submitButton{
	width: auto;
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #1f2e2e;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 10px 10px;
    text-decoration: none;
    display: inline-block;
    border: none;
    border-radius: 0px;
	
}
.submitButton:hover{
	background-color: #344c4c;
}
.resetButton{
	width: auto;
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #d1e0e0;
    color: black;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 10px 10px;
    text-decoration: none;
    display: inline-block;
    border: none;
    border-radius: 0px;
}
.resetButton:hover{
	background-color: #1f2e2e;
	color: white;
}
.header{
	font-family: Verdana, Helvetica, sans-serif;
	text-decoration: none;
	font-size: 28px;
}
.name{
	color:black;
}
</style>
<body>
	<ul>
	<li><a href="adminMenu.jsp"><img border="0" alt="CMCadmin" src="g106.png" width="34" height="18"></a></li>
  	<li><a href="manageUniv.jsp" class="active">Universities</a></li>
  	<li><a href="ManageUsers.jsp">Users</a></li>
 	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
 	</ul>
	<%
		AdminUI uc = (AdminUI) session.getAttribute("adminUI");
		DBController db = (DBController) session.getAttribute("dbController");
		String specificUsername = request.getParameter("Username");
		Account specificUser = db.getAccount(specificUsername);
	%>
	<p class="header">Edit User: <%=request.getParameter("Username")%></p>
	<form method="post" action="EditAdminAction.jsp" name="editUser">
		<table style="text-align: left; width: 266px; height: 228px;"
			border="1">
			<tbody>
				<tr>
					<td style="vertical-align: top;">Username<br>
					</td>
					<td style="vertical-align: top;" class="name"><input name="Username"
						value="<%out.print(specificUser.getUsername());%>" type="hidden">
						<%=specificUser.getUsername()%>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">First Name<br>
					</td>
					<td style="vertical-align: top;"><input name="FirstName"
						value="<%out.print(specificUser.getFirstName());%>"><br></td>
				</tr>
				<tr>
				<tr>
					<td style="vertical-align: top;">Last Name<br>
					</td>
					<td style="vertical-align: top;"><input name="LastName"
						value="<%out.print(specificUser.getLastName());%>"><br></td>
				</tr>
				
				<tr>
					<td style="vertical-align: top;">Password<br>
					</td>
					<td style="vertical-align: top;"><input name="Password"
						value="<%out.print(specificUser.getPassword());%>"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Type<br>
					</td>
					<td style="vertical-align: top;">
						<select name="Type">
							<option value = "<%= specificUser.getType()%>"><%= specificUser.getType()%></option>
							<option value = "<%= specificUser.getOppositeType()%>"><%= specificUser.getOppositeType()%></option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Status<br>
					</td>
					<td style="vertical-align: top;">
						<select name="Status">
							<option value = "<%= specificUser.getStatus()%>"><%= specificUser.getStatus()%></option>
							<option value = "<%= specificUser.getOppositeStatus()%>"><%= specificUser.getOppositeStatus()%></option>
						</select>
					</td>
				</tr>
				
				<script>
					function confirmEdit(){
						 return confirm("Are you sure you want to edit this account with the information provided?");
						}
					</script>

				<tr>
					<td style="vertical-align: top;"><input value="Reset" name="Reset" type="reset" class="resetButton"></td>
					<td style="vertical-align: top;"><input value="Submit" onClick="return confirmEdit()" action="EditAdminAction.jsp" 
						name="Edit" type="submit" class="submitButton"></td>
						
				</tr>
			</tbody>
		</table>
		<br>
	</form>
	<br>
</body>
</html>


