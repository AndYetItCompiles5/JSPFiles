<%@page language="java" import="Project.*,java.util.*"%>
<html>
<head>
<%@include file="verifyLogin.jsp"%>
<title>Edit User Form</title>
</head>
<body>
	<br>
	<br>
	<br>
	

	<%
		UserUI userUI = (UserUI) session.getAttribute("userUI");
		DBController dbController = (DBController) session.getAttribute("dbController");
		String specificUsername = session.getAttribute("username").toString();
		Account specificUser = dbController.getAccount(specificUsername);
		out.println("Edit User : " + specificUsername);
	%>
	<form method="post" action="Edit_action.jsp" name="editUser">
		<br>
		<table style="text-align: left; width: 266px; height: 228px;"
			border="1">
			<tbody>
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
					<td style="vertical-align: top;">Username<br>
					</td>
					<td style="vertical-align: top;"><input name="Username"
						value="<%out.print(specificUser.getUsername());%>" readonly></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Password<br>
					</td>
					<td style="vertical-align: top;"><input name="Password"
						value="<%out.print(specificUser.getPassword());%>"></td>
				</tr>
				<script>
					function confirmEdit(){
						 return confirm("Are you sure you want to edit this account with the information provided?");
						}
					</script>
				<tr>
					<td style="vertical-align: top;">Type<br>
					</td>
					<td style="vertical-align: top;"><input name="Type"
						value="<%out.print(specificUser.getType());%>" readonly></td>

				<tr>
					<td style="vertical-align: top;"><input value="Edit User" onClick="return confirmEdit()"
						name="Edit" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td style="vertical-align: top;"><input value="Reset"
						name="Reset" type="reset"></td>
				</tr>
			</tbody>
		</table>
		<br>
		<a href="userMenu.jsp">BACK TO MENU</a>
	</form>
	<br>
</body>
</html>

