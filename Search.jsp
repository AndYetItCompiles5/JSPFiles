<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Project.*, java.util.*"

				%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>schoolSearchMenu</title>
</head>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}
td:nth-child(even){
	background-color: #d1e0e0;
	width:400px;
}

th {
	text-align: center;
	vertical-align: bottom;
	background-color: darkslategray;
    color: white;
    font-size: 20px;
    font-family: Verdana, Helvetica, sans-serif;
    height:60px;
}
td{
	text-align: center;
	vertical-align: bottom;
	font-family: Verdana, Helvetica, sans-serif;
	font-weight: bold;
	background-color: darkslategray;;
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
.resetButton{
	width: auto;
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #d1e0e0;
    color: black;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 10px 10px;
    text-decoration: none;
    display: inline-block;
    border: none;
    border-radius: 0px;
}
.resetButton:hover{
	background-color: #1f2e2e;
	color: white;
}
.header{
	font-family: Verdana, Helvetica, sans-serif;
	text-decoration: none;
	font-size: 28px;
}
</style>
<%
String error = request.getParameter("error");
if(error != null && error.equals("1")){%> 
<script type="text/javascript">
	alert("PLEASE ONLY USE NUMBERS FOR NUMERICAL FIELDS");
</script>
<%}
AccountController aController = (AccountController) session.getAttribute("aController");
AccountController aController2 = (AccountController) session.getAttribute("aController2");
ArrayList<String> locations = new ArrayList<String>();
ArrayList<String> controls = new ArrayList<String>();
locations.addAll(Arrays.asList("URBAN","SUBURBAN","SMALL-CITY"));
controls.addAll(Arrays.asList("PRIVATE","STATE","CITY"));
%>
<body>
	<ul>
	<li>
	<% 	if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
			<a href="userMenu.jsp"><img border="0" alt="CMCadmin" src="g114.png" width="34" height="16"></a> 
		<%} 
		else{ %>
			<a href="guestMenu.jsp"><img border="0" alt="CMCadmin" src="g60.png" width="34" height="16"></a>
		<%}%>
	</li>
	<li><a href="Search.jsp" class="active">Search for Universities</a></li>
	<% 	if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
	<li><a href="userSavedSchools.jsp">My Saved Schools</a></li>
	<%} 
		if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){%>
	<li><a href="EditProfile.jsp">My Profile</a></li>
	<% }
		if(aController2 ==null || !aController2.getLoggedIn().equals("guest")){ %>
	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
		<%}
		else{%>
	<li style="float:right"><a href="guestLogout_Action.jsp">Login</a></li>
		<%} %>
</ul>
	<form method="post" action="SearchResults.jsp" name="SearchMenu">
		&nbsp; <p class="header">Search Menu</p><br>   
		<table style="text-align: left; width: 892px; height: 566px;"
			border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">by SCHOOL NAME<br>
					</td>
					<td style="vertical-align: top;"><label>contains </label><input
						name="schoolName"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by STATE<br>
					</td>
					<td style="vertical-align: top;"><label>contains <input
							name="state"></label><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by LOCATION<br>(SUBURBAN,
							URBAN, SMALL-CITY)
					</td>
					<td style="vertical-align: top;">
					<select name="location">
					<%
					for(int i = -1; i < locations.size(); i++){
						if(i == -1){ %> 
							<option value="<%=i%>" selected><%=i%></option> 
						<%}
						else { %>
							<option value="<%=locations.get(i)%>"><%=locations.get(i)%></option>
				  		<%} 
					 }%>
					</select></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by CONTROL<br>(PRIVATE,
							STATE, CITY)
					</td>
					<td style="vertical-align: top;">
					<select name="control">
					<%	
						for(int i = -1; i < controls.size(); i++){
							if(i == -1){ %> 
								<option value="<%=i%>" selected><%=i%></option> 
							<%}
							else { %>
								<option value="<%=controls.get(i)%>"><%=controls.get(i)%></option>
						  <%} 
						  }%>
					</select></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by NUMBER OF STUDENTS<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="numStudentsLow"><br><label> and</label> <input
						name="numStudentsHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by % FEMALE<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="perFemaleLow"><br><label> and</label> <input
						name="perFemaleHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by SAT VERBAL<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="satVerbalLow"><br><label> and</label> <input
						name="satVerbalHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by SAT MATH<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="satMathLow"><br><label> and</label> <input
						name="satMathHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by EXPENSES<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="expensesLow"><br><label> and</label> <input
						name="expensesHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by % FINANCIAL AID<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="perFALow"><br><label> and</label> <input
						name="perFAHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by NUMBER OF APPLICANTS<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="numApplicantsLow"><br><label> and</label> <input
						name="numApplicantsHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by % ADMITTED<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="perAdmittedLow"><br><label> and</label> <input
						name="perAdmittedHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by % ENROLLED<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="perEnrolledLow"><br><label> and</label> <input
						name="perEnrolledHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by ACADEMIC SCALE (1-5)<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="academicScaleLow"><br><label> and</label> <input
						name="academicScaleHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by SOCIAL SCALE (1-5)<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="socialScaleLow"><br><label> and</label> <input
						name="socialScaleHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by QUALITY OF LIFE SCALE
						(1-5)<br>
					</td>
					<td style="vertical-align: top;"><label>between </label><input
						name="lifeScaleLow"><br><label> and</label> <input
						name="lifeScaleHigh"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">by EMPHASES<br>
					</td>
					<td style="vertical-align: top;"><label>contains
							either<br> <input name="emphases1"><br> <input
							name="emphases2"><br> <input name="emphases3"><br>
							<input name="emphases4"><br> <input name="emphases5"><br>
					</label></td>
				</tr>
				<tr>
					<td>
						<input name="searchReset" value="Reset Form" type="reset" class="resetButton">
					</td>
					<td>
						<input name="submitResult value="Search For Schools" type="submit" class="submitButton">
					</td>
				</tr>
			</tbody>
		</table>
		<br> <br> 
	</form>
	<br>
	<br>
</body>
</html>
