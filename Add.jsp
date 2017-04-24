
<html>
<head>
<title>Add User Form</title>
</head>
<body>
	<br> Add User form:
	<br>
	<br>
	<% 	
		String error = request.getParameter("error");
		if(error != null && error.equals("1"))out.println("USERNAME, PASSWORD AND TYPE ARE REQUIRED");
		else if(error != null && error.equals("2")) out.print("THAT USERNAME IS ALREADY TAKEN");
		else if(error != null && error.equals("3")) out.println("AN UNEXPECTED ERROR OCCURED");
	%>
	<form method="post" action="Add_action.jsp" name="addUser">
		<br>
		<table style="text-align: left; width: 266px; height: 228px;"
			border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">First Name<br>
					</td>
					<td style="vertical-align: top;"><input name="FirstName"><br>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Last Name<br>
					</td>
					<td style="vertical-align: top;"><input name="LastName"><br>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Username<br>
					</td>
					<td style="vertical-align: top;"><input name="Username">
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Password<br>
					</td>
					<td style="vertical-align: top;"><input name="Password">
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Type<br>
					</td>
					<td style="vertical-align: top;">
						<select name="Type">
							<option value = "U">U</option>
							<option value = "A">A</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;"><input value="Add" name="Add"
						type="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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

