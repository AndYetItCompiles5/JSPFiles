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
<style>
table {
    border-collapse: collapse;
    width: 100%;
}
td:nth-child(even){
	background-color: #d1e0e0;
	color: black;
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
	background-color: darkslategray;
	color: white;
    font-size: 14px;
    height:50px;
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
	text-align: center;
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
.submitButton:hover{
	background-color: #344c4c;
	
}
.viewButton{
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #33334d;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 15px 32px;
    text-decoration: none;
    display: inline-block;
    border: none;
	
}
.viewButton:hover{
	background-color: #52527a;
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
.saveBlock{
	background-color: #d1e0e0;
}
</style>
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
	<%}
	if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
	<%}
		else{%>
	<li style="float:right"><a href="guestLogout_Action.jsp">Login</a></li>
	<%} %>
</ul>
<br>
	<p class="header">School Info </p>
	<%if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>

	<a href="SaveAction.jsp" class="submitButton">Save School</a>
	<%} %>
	<br>
	<form method="get" action="viewSchool.html" name="viewSchool"></form>
	<br>
	<table style="text-align: left; width: 686px; height: 497px;"
		border="1" cellpadding="2" cellspacing="2">
		<tbody>
			<tr>
				<td style="vertical-align: top;">SCHOOL<br>
				</td>
				<td style="vertical-align: top;"><input
					name="schoolName" value="<%=univ.getName()%>" type="hidden">
					<%=univ.getName()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">STATE<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getState()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">LOCATION<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getLocation()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">CONTROL<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getControl()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">NUMBER OF STUDENTS<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getNumStudents()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">% FEMALE<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getPercentFemale()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">SAT VERBAL<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getSatVerbal()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">SAT MATH<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getSatMath()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">EXPENSES<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getExpenses()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">% FINANCIAL AID<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getFinancialAid()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">NUMBER OF APPLICANTS<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getNumApplicants()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">% ADMITTED<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getPercentAdmitted()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">% ENROLLED<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getPercentEnrolled()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">ACADEMIC SCALE (1-5)<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getAcademicScale()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">SOCIAL SCALE (1-5)<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getSocialScale()%></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">QUALITY OF LIFE SCALE (1-5)<br>
				</td>
				<td style="vertical-align: top;"><%=univ.getLifeScale()%></td>
			</tr>
 			<%
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
						%>
			<tr>
				<td style="vertical-align: top;">EMPHASES<br>
				</td>
				<td style="vertical-align: top;">
					<%=emp1%><br>
					<%=emp2%><br>
					<%=emp3%><br>
					<%=emp4%><br>
					<%=emp5%><br>
					<%=emp6%><br>
					<%=emp7%><br>
					<%=emp8%><br>
					<%=emp9%><br>
					<%=emp10%><br>
				</td>
			</tr>
		</tbody>
	</table>
	<br>

	<%
		ArrayList<String> relatedSchools = db.findRecommendations(schoolName);
	%>
		<p class="header">Similar to <%=schoolName%>:</p>
		<table style="text-align: left; width: 686px; height: 82px;"
			border="1" cellpadding="2" cellspacing="2">
		<tbody>
			<%
				for (int i = 0; i < relatedSchools.size(); i++) {
			%>
			<tr>
				<td style="vertical-align: top;">
				<%=relatedSchools.get(i) %></td>
				<td style="vertical-align: top;"> 
				<form method="post" action="viewSchool.jsp" name="View">
					<input type="submit" name="View" value="View" class="viewButton"> 
					<input type="hidden" name="schoolName" value="<%=relatedSchools.get(i)%>">
				</form>
					</td>
					<%if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
					<td class="saveBlock">					
					<form method="post" action="SaveAction.jsp" name="Save">
						<input name="Save" value="Save" type="submit" class="submitButton">
						<input name="schoolName" value="<%=relatedSchools.get(i)%>" type="hidden">
					</form>					
					</td>
					<%} %>
					</tr>
				<%}%>
				
		</tbody>
		</table>
		<br>
</body>
</html>
