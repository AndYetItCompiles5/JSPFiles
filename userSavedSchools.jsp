
<%@page language="java" import="java.util.*,Project.*,java.io.*"%>
<%@include file="verifyLogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title></title>
</head>
<body>


	<%
		DBController dbController = (DBController) session.getAttribute("dbController");
		//Account currentU = dbController.getAccount(session.getAttribute("username").toString());
		//String username = (String) session.getAttribute("username");
		String username = session.getAttribute("username").toString();

		ArrayList<String> userSavedSchools = dbController.getUserSavedSchools(username);
	%>
	<br>

	<br>
	<table style="text-align: left; width: 153px; height: 60px;" border="1"
		cellpadding="2" cellspacing="2">
		<tbody>
			<tr align="center">
				<td colspan="3" rowspan="1" style="vertical-align: top;">Saved
					Schools<br>
				</td>
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
							> <input name="Username"
							value="" type="hidden"> <input type="hidden"
							name="schoolName" value="<%=userSavedSchools.get(i)%>">
					</form>
				</td>
				<td style="vertical-align: top;">
					<a href="<%= dbController.findWebsite(userSavedSchools.get(i)) %>"><%= userSavedSchools.get(i) %></a>
					<br>
				</td>

				<td style="vertical-align: top;">
					<form method="post" action="viewSchool.jsp" name="View">
						<input type="submit" name="View" value="View"> <input
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
	<a href="userMenu.jsp">BACK TO MENU</a>

</body>
</html>
