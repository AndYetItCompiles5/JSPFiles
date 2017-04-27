<%@page language="java" import="Project.*,java.util.*"%>


<%
	UserUI userUI = (UserUI) session.getAttribute("userUI");
	DBController db = (DBController) session.getAttribute("dbController");
	AccountController aController2 = (AccountController) session.getAttribute("aController2");
	String schoolName = request.getParameter("schoolName");
	University univ = userUI.viewSchoolInfo(schoolName);
	ArrayList<String> emphases = db.getEmphases(schoolName);
%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>viewSchool.html</title>
</head>
<body>
<%if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
	<a href="SaveAction.jsp"><b>Save School</b></a><br><br>
	<a href="userMenu.jsp">BACK TO MENU</a>
	<%} 
else{
	%><a href="guestMenu.jsp">BACK TO MENU</a><%
}%>
	<form method="get" action="viewSchool.html" name="viewSchool"></form>
	<br>
	<table style="text-align: left; width: 686px; height: 497px;"
		border="1" cellpadding="2" cellspacing="2">
		<tbody>
			<tr>
				<td style="vertical-align: top;">SCHOOL<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="schoolName" value="<%=univ.getName()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">STATE<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="state" value="<%=univ.getState()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">LOCATION<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="location" value="<%=univ.getLocation()%>"></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">CONTROL<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="control" value="<%=univ.getControl()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">NUMBER OF STUDENTS<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="numStudents" value="<%=univ.getNumStudents()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">% FEMALE<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="perFemale" value="<%=univ.getPercentFemale()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">SAT VERBAL<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="satVerbal" value="<%=univ.getSatVerbal()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">SAT MATH<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="satMath" value="<%=univ.getSatMath()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">EXPENSES<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="expenses" value="<%=univ.getExpenses()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">% FINANCIAL AID<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="perFinancialAid" value="<%=univ.getFinancialAid()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">NUMBER OF APPLICANTS<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="numApplicants" value="<%=univ.getNumApplicants()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">% ADMITTED<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="perAdmitted" value="<%=univ.getPercentAdmitted()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">% ENROLLED<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="perEnrolled" value="<%=univ.getPercentEnrolled()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">ACADEMIC SCALE (1-5)<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="academicScale" value="<%=univ.getAcademicScale()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">SOCIAL SCALE (1-5)<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="socialScale" value="<%=univ.getSocialScale()%>"><br></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">QUALITY OF LIFE SCALE (1-5)<br>
				</td>
				<td style="vertical-align: top;"><input readonly="readonly"
					name="qualityScale" value="<%=univ.getLifeScale()%>"><br></td>
			</tr>


			<%-- 			<%
								ArrayList<String> emp = db.getEmphases(univ.getName());
					String emp1 = "";
					String emp2 = "";
					String emp3 = "";
					String emp4 = "";
					String emp5 = "";
					String emp6 = "";
					String emp7 = "";
					String emp8 = "";
					String emp9 = "";
					String emp10 = "";
					try{
						emp1 = emp.get(0);
						emp2 = emp.get(1);
						emp3 = emp.get(2);
						emp4 = emp.get(3);
						emp5 = emp.get(4);
						emp6 = emp.get(5);
						emp7 = emp.get(6);
						emp8 = emp.get(7);
						emp9 = emp.get(8);
						emp10 = emp.get(9);
					}
					catch(IndexOutOfBoundsException e){
						//just catch it, don't do anything with it
						}
						%> --%>
			<tr>
				<%
					if (!emphases.isEmpty()) {
				%>

				<td style="vertical-align: top;">EMPHASES<br>
				</td>


				<td style="vertical-align: top;">
					<%
						for (int i = 0; i < emphases.size(); i++) {
					%> <input readonly="readonly" name="emp1"
					value="<%=emphases.get(i)%>"><br> <%
 	}
 %> <%
 	}
 %>
				

		</tbody>
	</table>
	<br>
	<br>
	<br>

	<%
		ArrayList<String> relatedSchools = db.findRecommendations(schoolName);
	%>
	<form action="??" name="???">
		Here are some Universities that are <br> similar to the one that
		you are viewing<br> <br>
		<table style="text-align: left; width: 231px; height: 82px;"
			border="1" cellpadding="2" cellspacing="2">
			<tbody>

				<%
					for (int i = 0; i < relatedSchools.size(); i++) {
				%>
				<tr>
					<td style="vertical-align: top;"><input readonly="readonly"
						name="emp1" value="<%=relatedSchools.get(i)%>"></td>
					<td style="vertical-align: top;">
						<form method="post" action="viewSchool.jsp" name="View">
							<input type="submit" name="View" value="View"> <input
								type="hidden" name="schoolName"
								value="<%=relatedSchools.get(i)%>">
						</form>
						<%if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
						<form method="post" action="SaveAction.jsp" name="Save">
							<input name="Save" value="Save" type="submit"> <input
								name="schoolName" value="<%=relatedSchools.get(i)%>"
								type="hidden">
						</form>
						<%} %>
					</td>
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
