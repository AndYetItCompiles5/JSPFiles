<%@ page import="Project.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>SearchResults</title>
</head>
<style>
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
    font-size: 20px;
    font-family: Verdana, Helvetica, sans-serif;
    height:60px;
}
td{
	text-align: center;
	font-family: Verdana, Helvetica, sans-serif;
	font-weight: bold;
	color: white;
    font-size: 14px;
    height:50px;
}
td:nth-child(even){
	width: 250px;
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
input{
	width: 60%;
	padding: 3px 3px;
	background-color: white;
	border: none;
	border-radius: 2px;
	font-size: 14px;
	}
select{
	width: 80%;
	padding: 1px 1px;
	border: none;
    border-radius: 4px;
    font-size: 14px;

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
.header{
	font-family: Verdana, Helvetica, sans-serif;
	text-decoration: none;
	font-size: 28px;
}
.name{
	text-align: center;
	font-family: Verdana, Helvetica, sans-serif;
	font-weight: bold;
	color: black;
    font-size: 16px;
}
.viewButton{
	width: auto;
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #33334d;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 10px 10px;
    text-decoration: none;
    display: inline-block;
    border: none;
    border-radius: 0px;
	
}
.viewButton:hover{
	background-color: #52527a;
}
</style>
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
				try{
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
				}
				catch(NumberFormatException e){
					response.sendRedirect("Search.jsp?error=1");
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
	<ul>
	<li>
	<% 
		if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
			<a href="userMenu.jsp"><img border="0" alt="CMCadmin" src="g114.png" width="34" height="16"></a> 
		<%} 
		else{ %>
			<a href="guestMenu.jsp"><img border="0" alt="CMCadmin" src="g60.png" width="34" height="16"></a>
		<%}%>
	</li>
	<li><a href="Search.jsp" class="active">Search for Universities</a></li>
	<% 
		if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
	<li><a href="userSavedSchools.jsp">My Saved Schools</a></li>
	<%} 
		if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
	<li><a href="EditProfile.jsp">My Profile</a></li>
	<% }
		if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
	<%} 
		else{%>
			<li style="float:right"><a href="guestLogout_Action.jsp">Login</a></li>	
		<%} %>
	</ul>
	<p class="header">Search Results:</p>
	<div style="text-align: center;"></div>
	<table style="text-align: left; width: 75%;" border="1">
		<tbody>
			<tr><%if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
				<th style="text-align: center; width: 552px;">Save to School List</th>
					<%} %>
				<th style="text-align: center; width: 552px;">School
					Name</th>
				<th style="text-align: center; width: 552px;">View
					School Details</th>
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
						<input name="Save" value="Save" type="submit" class="submitButton"> 
						<input name="schoolName" value="<%out.print(school);%>" type="hidden">
					</form>
				</td>
				<% }%>
				<td style="vertical-align: top;">
					<p class="name"><%=school%></p>
				</td>
				<td style="vertical-align: top;">
					<form method="post" action="viewSchool.jsp" name="View">
						<input name="View" value="View" type="submit" class="viewButton"> <input
							name="schoolName" value="<%out.print(school);%>" type="hidden">
					</form>
				</td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>
</body>
</html>
