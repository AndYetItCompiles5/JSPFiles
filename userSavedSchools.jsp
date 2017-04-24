<%@page language="java" import="java.util.*,Project.*"%>
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
	<form action="?/?" name="viewUserSavedScools">
		<br>
		<table style="text-align: left; width: 153px; height: 60px;"
			border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr align="center">
					<td colspan="3" rowspan="1" style="vertical-align: top;">Saved
						Schools<br>
					</td>
				</tr>
				<%
					for (int i = 0; i < userSavedSchools.size(); i++) {
				%>

				<tr>
					<td style="vertical-align: top;"><input name="remove"
						value="Remove" type="button"><br>
					<td style="vertical-align: top;"><% out.print(userSavedSchools.get(i)); %><br>
					</td>
					<td style="vertical-align: top;"><input name="edit"
						value="Edit" type="button"><br>
				</tr>
				<%
					}
				
				%>
			</tbody>
		</table>
		<br>
	</form>
</body>
</html>