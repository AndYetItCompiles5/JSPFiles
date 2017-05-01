<%@include file = "verifyLogin.jsp"%>
<%@page language="java" import="java.util.*,Project.*"%>
<html>
<head>
<title></title>
</head>
<style>
body{

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
	float:left;
    border-right:1px solid silver;
    font-family: Verdana, Helvetica, sans-serif;
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
table {
    border-collapse: collapse;
    width: 100%;
}
tr:nth-child(even){
	background-color: #d1e0e0;
}
th {
	text-align: center;
	background-color: darkslategray;
    color: white;
    font-size: 12px;
    font-family: Verdana, Helvetica, sans-serif;
    height:60px;
}
td{
	text-align: center;
	font-family: Verdana, Helvetica, sans-serif;
}
.addButton{
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #1f2e2e;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 15px 32px;
    text-decoration: none;
    display: inline-block;
    border: none;
}
.addButton:hover{
	background-color: #344c4c;
}
.editButton{
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #1f2e2e;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 12px 26px;
    text-decoration: none;
    display: inline-block;
    border: none;
}
.editButton:hover{
	background-color: #344c4c;
}
.deleteButton{
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #cc0000;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 12px 26px;
    text-decoration: none;
    display: inline-block;
    border: none;
}
.deleteButton:hover{
	background-color: #ff0000;
}
.header{
	font-family: Verdana, Helvetica, sans-serif;
	text-decoration: none;
	font-size: 40px;
}
.deactivateButton{
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #4673d2;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 12px 26px;
    text-decoration: none;
    display: inline-block;
    border: none;
}
.deactivateButton:hover{
	background-color: #84a1e1;
}
.reactivateButton{
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #84a1e1;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 12px 26px;
    text-decoration: none;
    display: inline-block;
    border: none;
}
.reactivateButton:hover{
	background-color: #4673d2;
}
</style>
<body>
<ul>
	<li><a href="adminMenu.jsp"><img border="0" alt="CMCadmin" src="g106.png" width="34" height="18"></a></li>
  	<li><a href="manageUniv.jsp">Universities</a></li>
  	<li><a href="ManageUsers.jsp" class="active">Users</a></li>
 	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
 </ul>
<%
		String anyErrors = request.getParameter("DeactivateError");
		if (anyErrors != null && anyErrors.equals("1")) { %>
			<script type="text/javascript">
			alert("Something went wrong");
			</script>
	<%  } else if (anyErrors != null && anyErrors.equals("2")) { %>
			<script type="text/javascript">
			alert("User is already deactivated");
			</script>
	<%	} 
	
		UserUI userUI = (UserUI) session.getAttribute("userUI");
		AdminUI adminUI = (AdminUI) session.getAttribute("adminUI");
		DBController dbController = (DBController) session.getAttribute("dbController");
		Account currentU = dbController.getAccount(session.getAttribute("username").toString());
		String fullName = currentU.getFirstName() + " " + currentU.getLastName();
		String[][] allUsers = adminUI.viewUsers();
	%>
	<p class="header">Users</p>
	<a href="Add.jsp" class="addButton">Add A User</a>
	<br><br>
	<table style="text-align: left; width: 100%;" border="1"
		cellpadding="2" cellspacing="2">
		<tbody>
			<tr class="header">
				<th style="vertical-align: top; text-align: center;">EDIT</th>
				<th style="vertical-align: top; text-align: center;">FIRST</th>
				<th style="vertical-align: top; text-align: center;">LAST</th>
				<th style="vertical-align: top; text-align: center;">USERNAME</th>
				<th style="vertical-align: top; text-align: center;">PASSWORD</th>
				<th style="vertical-align: top; text-align: center;">TYPE</th>
				<th style="vertical-align: top; text-align: center;">STATUS</th>
				<th style="vertical-align: top; text-align: center;">DELETE</th>

			</tr>
			<% for(int i = 0; i<allUsers.length; i++){ %>
			<tr>
				<td style="vertical-align: top;">
					<form method="post" action="Edit.jsp" name="Edit">
						<input name="Edit" value="Edit" type="submit" class="editButton">
						<input name="Username" value="<%out.print(allUsers[i][2]);%>" type="hidden">
					</form>
				</td>

				<td style="vertical-align: top;"><%out.print(allUsers[i][0]);%></td>
				<td style="vertical-align: top;"><%out.print(allUsers[i][1]);%></td>
				<td style="vertical-align: top;"><%out.print(allUsers[i][2]);%></td>
				<td style="vertical-align: top;"><%out.print(allUsers[i][3]);%></td>
				<td style="vertical-align: top;"><%out.print(allUsers[i][4]);;%></td>
				<%
				if(allUsers[i][5].charAt(0)=='Y'||allUsers[i][5].charAt(0)=='y'){
				%>
				<td style="vertical-align: top;">
					<form method="post" action="Deactivate_action.jsp" name="Deactivate" >
						<input name="Deactivate" value=" Active " type="submit" class="deactivateButton"> <input
							name="Username" value="<%out.print(allUsers[i][2]);%>" type="hidden">
					</form>
				</td>
				<% } 
			
				else{
				%>
				<td style="vertical-align: top;">
					<form method="post" action="Reactivate_action.jsp" name="Reactivate">
						<input name="Reactivate" value="Inactive" type="submit" class="reactivateButton"> <input
							name="Username" value="<%out.print(allUsers[i][2]);%>" type="hidden">
					</form>
				</td>
				<%} %>
				<td style="vertical-align: top;">
					<script>
					function confirmDelete(){
						 return confirm("Are you sure you want to delete this user?");
						}
					</script>
					<form method="post" action="Delete.jsp" name="Delete">
						<input type="submit" name="Delete" value="Delete" onClick="return confirmDelete()" class="deleteButton"> 
						<input name="Username" value="<%out.print(allUsers[i][2]);%>" type="hidden">
					</form>
				</td>
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>

