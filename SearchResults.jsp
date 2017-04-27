<%@ page import="Project.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>SearchResults</title>
</head>
<%
				String name = "-1";
				String state = "-1";
				String location = "-1";
				String control = "-1";
				int numStudentsLow = 0;
				int numStudentsHigh = 0;
				double perFemaleLow = 0;
				double perFemaleHigh = 0;
				int satVerbalLow = 0;
				int satVerbalHigh = 0;
				int satMathLow = 0;
				int satMathHigh = 0;
				int expensesLow = 0;
				int expensesHigh = 0;
				double perFALow = 0;
				double perFAHigh = 0;
				int numApplicantsLow = 0;
				int numApplicantsHigh = 0;
				double perAdmittedLow = 0;
				double perAdmittedHigh = 0;
				double perEnrolledLow = 0;
				double perEnrolledHigh = 0;
				int academicScaleLow = 0;
				int academicScaleHigh = 0;
				int socialScaleLow = 0;
				int socialScaleHigh = 0;
				int lifeScaleLow = 0;
				int lifeScaleHigh = 0;

				SearchController sController = new SearchController();
				UserUI userUI = (UserUI) session.getAttribute("userUI");
				AccountController aController = (AccountController) session.getAttribute("aController");
				AccountController aController2 = (AccountController) session.getAttribute("aController2");
				Set<String> listSchools = new HashSet<String>();
				if (request.getParameter("schoolName").isEmpty()) {
					name = "-1";
				} else {
					name = request.getParameter("schoolName");
				}
				if (request.getParameter("state").isEmpty()) {
					state = "-1";
				} else {
					state = request.getParameter("state");
				}
				if (request.getParameter("location").isEmpty()) {
					location = "-1";
				} else {
					location = request.getParameter("location");
				}
				if (request.getParameter("control").isEmpty()) {
					control = "-1";
				} else {
					control = request.getParameter("control");
				}
				if (!request.getParameter("numStudentsLow").equals("")) {
					numStudentsLow = Integer.parseInt(request.getParameter("numStudentsLow"));
				} else {
					numStudentsLow = 0;
				}
				if (!request.getParameter("numStudentsHigh").equals("")) {
					numStudentsHigh = Integer.parseInt(request.getParameter("numStudentsHigh"));
				} else {
					numStudentsHigh = 0;
				}
				if (!request.getParameter("perFemaleLow").equals("")) {
					perFemaleLow = Integer.parseInt(request.getParameter("perFemaleLow"));
				} else {
					perFemaleLow = 0;
				}
				if (!request.getParameter("perFemaleHigh").equals("")) {
					perFemaleHigh = Integer.parseInt(request.getParameter("perFemaleHigh"));
				} else {
					perFemaleHigh = 0;
				}
				if (!request.getParameter("satVerbalLow").equals("")) {
					satVerbalLow = Integer.parseInt(request.getParameter("satVerbalLow"));
				} else {
					satVerbalLow = 0;
				}
				if (!request.getParameter("satVerbalHigh").equals("")) {
					satVerbalHigh = Integer.parseInt(request.getParameter("satVerbalHigh"));
				} else {
					satVerbalHigh = 0;
				}
				if (!request.getParameter("satMathLow").equals("")) {
					satMathLow = Integer.parseInt(request.getParameter("satMathLow"));
				} else {
					satMathLow = 0;
				}
				if (!request.getParameter("satMathHigh").equals("")) {
					satMathHigh = Integer.parseInt(request.getParameter("satMathHigh"));
				} else {
					satMathHigh = 0;
				}
				if (!request.getParameter("expensesLow").equals("")) {
					expensesLow = Integer.parseInt(request.getParameter("expensesLow"));
				} else {
					expensesLow = 0;
				}
				if (!request.getParameter("expensesHigh").equals("")) {
					expensesHigh = Integer.parseInt(request.getParameter("expensesHigh"));
				} else {
					expensesHigh = 0;
				}
				if (!request.getParameter("perFALow").equals("")) {
					perFALow = Integer.parseInt(request.getParameter("perFALow"));
				} else {
					perFALow = 0;
				}
				if (!request.getParameter("perFAHigh").equals("")) {
					perFAHigh = Integer.parseInt(request.getParameter("perFAHigh"));
				} else {
					perFAHigh = 0;
				}
				if (!request.getParameter("numApplicantsLow").equals("")) {
					numApplicantsLow = Integer.parseInt(request.getParameter("numApplicantsLow"));
				} else {
					numApplicantsLow = 0;
				}
				if (!request.getParameter("numApplicantsHigh").equals("")) {
					numApplicantsHigh = Integer.parseInt(request.getParameter("numApplicantsHigh"));
				} else {
					numApplicantsHigh = 0;
				}
				if (!request.getParameter("perAdmittedLow").equals("")) {
					perAdmittedLow = Integer.parseInt(request.getParameter("perAdmittedLow"));
				} else {
					perAdmittedLow = 0;
				}
				if (!request.getParameter("perAdmittedHigh").equals("")) {
					perAdmittedHigh = Integer.parseInt(request.getParameter("perAdmittedHigh"));
				} else {
					perAdmittedHigh = 0;
				}
				if (!request.getParameter("perEnrolledLow").equals("")) {
					perEnrolledLow = Integer.parseInt(request.getParameter("perEnrolledLow"));
				} else {
					perEnrolledLow = 0;
				}
				if (!request.getParameter("perEnrolledHigh").equals("")) {
					perEnrolledHigh = Integer.parseInt(request.getParameter("perEnrolledHigh"));
				} else {
					perEnrolledHigh = 0;
				}
				if (!request.getParameter("academicScaleLow").equals("")) {
					academicScaleLow = Integer.parseInt(request.getParameter("academicScaleLow"));
				} else {
					academicScaleLow = 0;
				}
				if (!request.getParameter("academicScaleHigh").equals("")) {
					academicScaleHigh = Integer.parseInt(request.getParameter("academicScaleHigh"));
				} else {
					academicScaleHigh = 0;
				}
				if (!request.getParameter("socialScaleLow").equals("")) {
					socialScaleLow = Integer.parseInt(request.getParameter("socialScaleLow"));
				} else {
					socialScaleLow = 0;
				}
				if (!request.getParameter("socialScaleHigh").equals("")) {
					socialScaleHigh = Integer.parseInt(request.getParameter("socialScaleHigh"));
				} else {
					socialScaleHigh = 0;
				}
				if (!request.getParameter("lifeScaleLow").equals("")) {
					lifeScaleLow = Integer.parseInt(request.getParameter("lifeScaleLow"));
				} else {
					lifeScaleLow = 0;
				}
				if (!request.getParameter("lifeScaleHigh").equals("")) {
					lifeScaleHigh = Integer.parseInt(request.getParameter("lifeScaleHigh"));
				} else {
					lifeScaleHigh = 0;
				}

				ArrayList<String> emphases = new ArrayList<String>();
				if (request.getParameter("emphases1").length() != 0) {
					emphases.add(request.getParameter("emphases1"));
				}
				if (request.getParameter("emphases2").length() != 0) {
					emphases.add(request.getParameter("emphases2"));
				}
				if (request.getParameter("emphases3").length() != 0) {
					emphases.add(request.getParameter("emphases3"));
				}
				if (request.getParameter("emphases4").length() != 0) {
					emphases.add(request.getParameter("emphases4"));
				}
				if (request.getParameter("emphases5").length() != 0) {
					emphases.add(request.getParameter("emphases5"));
				}
				if(emphases.isEmpty()){
					emphases=null;
				}

				listSchools = userUI.search(name, state, location, control, numStudentsLow,
						numStudentsHigh, perFemaleLow, perFemaleHigh, satVerbalLow, satVerbalHigh, satMathLow, satMathHigh,
						expensesLow, expensesHigh, perFALow, perFAHigh, numApplicantsLow, numApplicantsHigh, perAdmittedLow,
						perAdmittedHigh, perEnrolledLow, perEnrolledHigh, academicScaleLow, academicScaleHigh,
						socialScaleLow, socialScaleHigh, lifeScaleLow, lifeScaleHigh, emphases);
				%>
<body>
<b>Search Results:</b>
		<div style="text-align: center;"></div>
	<table style="text-align: left; width: 100%;" border="1">
		<tbody>
			<tr><%if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
				<td style="text-align: center; width: 552px;"><br> Save
					School to School List</td>
					<%} %>
				<td style="text-align: center; width: 552px;"><br>School
					Name</td>
				<td style="text-align: center; width: 552px;"><br>View
					School Details</td>
			</tr>
			
				<% if(listSchools.isEmpty()){
					%><script type="text/javascript">
					
					alert("Nothing was found, please try different criteria"); 
					window.location.href = "Search.jsp";
					</script>
				<% }
				for (String school : listSchools) {
			%>
			<tr>
			<% if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){
			%>
				<td style="vertical-align: top;">
					<form method="post" action="SaveAction.jsp" name="Save">
						<input name="Save" value="Save" type="submit"> <input
							name="schoolName" value="<%out.print(school);%>" type="hidden">
					</form>
				</td>
				<% }%>
				<td style="vertical-align: top;">
					<%=
						school
					%>
				</td>
				<td style="vertical-align: top;">
					<form method="post" action="viewSchool.jsp" name="View">
						<input name="View" value="View" type="submit"> <input
							name="schoolName" value="<%out.print(school);%>" type="hidden">
					</form>
				</td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>
	<% if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){
			%>
	<a href="Search.jsp">BACK TO MENU</a>
	<%} 
	 else{%>
		<a href="guestMenu.jsp">BACK TO MENU</a> 
	<% }%>
</body>
</html>
