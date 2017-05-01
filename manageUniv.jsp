<%@ page import="Project.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="verifyLogin.jsp"%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>manageUniv</title>
</head>
<script>
	function confirmDelete() {
		return confirm("Are you sure you want to delete this university?");
	}
</script>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
	border: 1px solid silver;
}

li {
	float: left;
	border-right: 1px solid silver;
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

tr:nth-child(even) {
	background-color: #d1e0e0;
}

th {
	text-align: center;
	background-color: darkslategray;
	color: white;
	font-size: 20px;
	font-family: Verdana, Helvetica, sans-serif;
	height: 60px;
}

td {
	text-align: center;
	font-family: Verdana, Helvetica, sans-serif;
}

.addButton {
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

.addButton:hover {
	background-color: #344c4c;
}
.editButton {
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
}

.editButton:hover {
	background-color: #344c4c;
}

.deleteButton {
	argin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #cc0000;
	color: white;
	font-family: Verdana, Helvetica, sans-serif;
	padding: 10px 10px;
	text-decoration: none;
	display: inline-block;
	border: none;
}

.deleteButton:hover {
	background-color: #ff0000;
}
.header {
	font-family: Verdana, Helvetica, sans-serif;
	text-decoration: none;
	font-size: 40px;
}
</style>
<% 
	DBController dbController = (DBController) session.getAttribute("dbController");
	ArrayList<String> allSchools = dbController.getAllUniversities();
	 %>
<body>
	<ul>
	<li><a href="adminMenu.jsp"><img border="0" alt="CMCadmin" src="g106.png" width="34" height="18"></a></li>
  	<li><a href="manageUniv.jsp" class="active">Universities</a></li>
  	<li><a href="ManageUsers.jsp">Users</a></li>
 	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
 	</ul>
 		<p class="header">Universities</p>
		<a href="addUniv.jsp" class="addButton">Add New University</a><br><br>
		
		<table style="text-align: left; width: 1553px; height: 324px;"
			border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<th style="vertical-align: top;"><small>SCHOOL
					</small></th>
					<th style="vertical-align: top;"><small>STATE
					</small></th>
					<th style="vertical-align: top;"><small>LOCATION
					</small></th>
					<th style="vertical-align: top;"><small>CONTROL
					</small></th>
					<th style="vertical-align: top;"><small># OF STUDENTS
					</small></th>
					<th style="vertical-align: top;"><small>% FEMALE
					</small></th>
					<th style="vertical-align: top;"><small>SAT VERBAL
					</small></th>
					<th style="vertical-align: top;"><small>SAT MATH
					</small></th>
					<th style="vertical-align: top;"><small>EXPENSES
					</small></th>
					<th style="vertical-align: top;"><small>%
							FINANCIAL AID
					</small></th>
					<th style="vertical-align: top;"><small># OF
							APLLICANTS
					</small></th>
					<th style="vertical-align: top;"><small>% ADMITTED
					</small></th>
					<th style="vertical-align: top;"><small>% ENROLLED
					</small></th>
					<th style="vertical-align: top;"><small>ACADEMIC SCALE
					</small></th>
					<th style="vertical-align: top;"><small>SOCIAL SCALE
					</small></th>
					<th style="vertical-align: top;"><small>QUALITY OF
							LIFE
					</small></th>
					<th style="vertical-align: top;"><small>EDIT
					</small></th>
					<th style="vertical-align: top;"><small>DELETE
					</small></th>
				</tr>
				<%	for(String schoolName: allSchools){ 
						University school = dbController.getUniversity(schoolName);%>
				<tr>

					<td style="vertical-align: top;"><%=schoolName%></td>
					<td style="vertical-align: top;"><%=school.getState()%></td>
					<td style="vertical-align: top;"><%=school.getLocation() %></td>
					<td style="vertical-align: top;"><%=school.getControl()%></td>
					<td style="vertical-align: top;"><%=school.getNumStudents() %></td>
					<td style="vertical-align: top;"><%=school.getPercentFemale()%></td>
					<td style="vertical-align: top;"><%=school.getSatVerbal()%></td>
					<td style="vertical-align: top;"><%=school.getSatMath()%></td>
					<td style="vertical-align: top;"><%=school.getExpenses()%></td>
					<td style="vertical-align: top;"><%=school.getFinancialAid()%></td>
					<td style="vertical-align: top;"><%=school.getNumApplicants()%></td>
					<td style="vertical-align: top;"><%=school.getPercentAdmitted()%></td>
					<td style="vertical-align: top;"><%=school.getPercentEnrolled()%></td>
					<td style="vertical-align: top;"><%=school.getAcademicScale()%></td>
					<td style="vertical-align: top;"><%=school.getSocialScale()%></td>
					<td style="vertical-align: top;"><%=school.getLifeScale()%></td>
					<td style="vertical-align: top;">
					<form method="post" action="editUniv.jsp" name="Edit">
						<input name="Edit" value="Edit" type="submit" class="editButton"> 
						<input name="schoolName" value="<%=schoolName%>" type="hidden">
					</form>
					</td>
					<td style="vertical-align: top;">
					<form method="post" action="deleteUniv.jsp" name="Delete">
						<input name="Delete" value="Delete" type="submit" class="deleteButton" onClick="return confirmDelete()"> 
						<input name="schoolName" value="<%=schoolName%>" type="hidden">
					</form>
					</td>
				</tr>
				<%}%>
			</tbody>
		</table>
		<br>
</body>
</html>