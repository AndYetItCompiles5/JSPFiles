<%@page language="java" import="Project.*,java.util.*"%>
<html>
<head>
<%@include file="verifyLogin.jsp"%>
<title></title>
</head>
<body>
	<br> 
	<br>
	<br>

	<%
		AdminUI uc = (AdminUI) session.getAttribute("adminUI");
		DBController db = (DBController) session.getAttribute("dbController");
		String specificUsername = request.getParameter("Username");
		Account specificUser = db.getAccount(specificUsername);
		out.println("Edit User : " + request.getParameter("Username"));
	%>
	<form method="post" action="EditAdminAction.jsp" name="editUser">
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

				<tr>
					<td style="vertical-align: top;"><input value="Edit" action="EditAdminAction.jsp"
						name="Edit" type="submit"></td>
					<td style="vertical-align: top;"><input value="Reset"
						name="Reset" type="reset"></td>
				</tr>
			</tbody>
		</table>
		<br>
	</form>
	<br>
</body>
</html>

