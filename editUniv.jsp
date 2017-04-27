<%@ page import="Project.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>editUniv</title>
</head>

<!-- script to prevent users from inputting letters into input boxes which require numbers -->
<script type="text/javascript">
function isNumber(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 && charCode != 46 && charCode != 45 || charCode > 57) ) return false;
    return true;
}
function isContNumber(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && (charCode < 49  && charCode != 46 && charCode != 45 || charCode > 53) ) return false;
    return true;
}	
</script>
<%
	DBController dbController = new DBController();
	University school = dbController.getUniversity(request.getParameter("schoolName"));
	ArrayList<String> states = new ArrayList<String>();
	ArrayList<String> locations = new ArrayList<String>();
	ArrayList<String> controls = new ArrayList<String>();
	locations.addAll(Arrays.asList("URBAN","SUBURBAN","SMALL-CITY"));
	controls.addAll(Arrays.asList("PRIVATE","STATE","CITY"));
	states.addAll(Arrays.asList("Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois",
			"Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska",
			"Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina",
			"South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"));
	%>
<body>
<% 
	String error = request.getParameter("error");
	if(error != null && error.equals("1")){%>
		<script type="text/javascript">
			alert("ALL PERCENTAGE FIELDS MUST BE BETWEEN 0 AND 100 (-1 if unknown)");
		</script>
	<%}
	if(error != null && error.equals("2")){%>
		<script type="text/javascript">
			alert("SAT SCORES MUST BE BETWEEN 200 AND 800 (-1 if unknown)");
		</script>
	<%} %>
	<br>
	<form method="post" action="editUnivAction.jsp" name="editUniversity">
		&nbsp;EDIT UNIVERSITY<br>
		<table style="text-align: left; width: 490px; height: 480px;"
			border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">SCHOOL NAME<br>
					</td>
					<td style="vertical-align: top;"><input readonly="readonly" name="schoolName" value="<%=school.getName()%>"><br></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">STATE<br>
					</td>
					<td style="vertical-align: top;">
					<select name="state">
					<%		String state = school.getState();
							for(int i = -1; i < states.size(); i++){
							if(i == -1){ %> 
								<option value="<%=i%>"><%=i%></option> 
							<%}
									
							else if(states.get(i).toUpperCase().equals(state.toUpperCase())){
							%>
								<option value="<%=states.get(i).toUpperCase()%>" selected><%=states.get(i).toUpperCase()%></option>
							<%}
							else { %>
								<option value="<%=states.get(i).toUpperCase()%>"><%=states.get(i).toUpperCase()%></option>
						  <%} 
						  }%>
					</select></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">LOCATION<br>
					</td>
					<td style="vertical-align: top;">
					<select name="location">
					<%		String location = school.getLocation();
							for(int i = -1; i < locations.size(); i++){
							if(i == -1){ %> 
								<option value="<%=i%>"><%=i%></option> 
							<%}
							else if(locations.get(i).equals(location)){
							%>
								<option value="<%=locations.get(i)%>" selected><%=locations.get(i)%></option>
							<%}
							else { %>
								<option value="<%=locations.get(i)%>"><%=locations.get(i)%></option>
						  <%} 
						  }%>
					</select></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">CONTROL<br>
					</td>
					<td style="vertical-align: top;">
					<select name="control">
					<%		String control = school.getControl();
							for(int i = -1; i < controls.size(); i++){
							if(i == -1){ %> 
								<option value="<%=i%>"><%=i%></option> 
							<%}
							else if(controls.get(i).equals(control)){
							%>
								<option value="<%=controls.get(i)%>" selected><%=controls.get(i)%></option>
							<%}
							else { %>
								<option value="<%=controls.get(i)%>"><%=controls.get(i)%></option>
						  <%} 
						  }%>
					</select></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">NUMBER OF STUDENTS<br>
					</td>
					<td style="vertical-align: top;"><input name="numberOfStudents" value="<%=school.getNumStudents()%>"
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" min ="-1"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">NUMBER OF APPLICANTS<br>
					</td>
					<td style="vertical-align: top;"><input name="numberOfApplicants" value="<%=school.getNumApplicants()%>" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" min="-1"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">EXPENSES<br>
					</td>
					<td style="vertical-align: top;"><input name="expenses" value="<%=school.getExpenses()%>" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" min="-1"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% FEMALE<br>
					</td>
					<td style="vertical-align: top;"><input name="percentFemale" value="<%=school.getPercentFemale()%>" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" step="0.1" min="-1" max="100"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% ADMITTED<br>
					</td>
					<td style="vertical-align: top;"><input name="percentAdmitted" value="<%=school.getPercentAdmitted()%>" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" step="0.1" min="-1" max="100"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% ENROLLED<br>
					</td>
					<td style="vertical-align: top;"><input id = "percentEnrolled" name="percentEnrolled" value="<%=school.getPercentEnrolled()%>" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" " type="number" step="0.1" min="-1" max="100"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% FINANCIAL AID<br>
					</td>
					<td style="vertical-align: top;"><input name="percentFA" value="<%=school.getFinancialAid()%>" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" step="0.1" min="-1" max="100"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">SAT VERBAL<br>
					</td>
					<td style="vertical-align: top;"><input name="satVerbal" value="<%=school.getSatVerbal()%>" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)"  type="number" min ="-1" max="800"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">SAT MATH<br>
					</td>
					<td style="vertical-align: top;"><input name="satMath" value="<%=school.getSatVerbal()%>" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" min ="-1" max="800"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">ACADEMIC SCALE (1-5)<br>
					</td>
					<td style="vertical-align: top;">
					<select name="qualityAcademic">
						<%	int acadScale = school.getAcademicScale();
							for(int i = -1; i <= 5; i++){
							if(i != 0 && i == acadScale){
							%>
								<option value="<%=i%>" selected><%out.println(i);%></option>
							<%}
							else if(i != 0){ %>
								<option value="<%=i%>"><%=i%></option>
						  <%} 
						  }%>
					</select></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">SOCIAL SCALE (1-5)<br>
					</td>
					<td style="vertical-align: top;">
					<select name="qualitySocial">
						<%	int socialScale = school.getSocialScale();
							for(int i = -1; i <= 5; i++){
							if(i != 0 && i == socialScale){
							%>
								<option value="<%=i%>" selected><%out.println(i);%></option>
							<%}
							else if(i != 0){ %>
								<option value="<%=i%>"><%=i%></option>
						  <%} 
						  }%>
					</select></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">QUALITY OF LIFE (1-5)<br>
					</td>
					<td style="vertical-align: top;">
					<select name="qualityLife" >
						<%	int lifeScale = school.getLifeScale();
							for(int i = -1; i <= 5; i++){
							if(i != 0 && i == lifeScale){
							%>
								<option value="<%=i%>" selected><%out.println(i);%></option>
							<%}
							else if(i != 0){ %>
								<option value="<%=i%>"><%=i%></option>
						  <%} 
						  }%>
					</select><br>
					</td>
				</tr>
				
				 <% 	
					ArrayList<String> emp = dbController.getEmphases(school.getName());
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
				<!-- start of emphases -->
				<tr>
					<td style="vertical-align: top;">EMPHASES<br>
					</td>
					<td style="vertical-align: top;">
						<input name="emp1" value="<%=emp1%>"><br>
			 			<input name="emp2" value="<%=emp2%>"><br>
						<input name="emp3" value="<%=emp3%>"><br>
						<input name="emp4" value="<%=emp4%>"><br>
						<input name="emp5" value="<%=emp5%>"><br>
						<input name="emp6" value="<%=emp6%>"><br>
			 			<input name="emp7" value="<%=emp7%>"><br>
						<input name="emp8" value="<%=emp8%>"><br>
						<input name="emp9" value="<%=emp9%>"><br>
						<input name="emp10" value="<%=emp10%>"><br>
					</td>
				</tr>
				<script>
					function confirmEdit(){
						 return confirm("Are you sure you want to edit this account with the information provided?");
						}
					</script>
				<!-- end of emphases -->
				
				<tr>
					<td style="vertical-align: top;"><input value="Reset" 
						name="Reset" type="reset"><br></td>
					<td style="vertical-align: top;"><input name="submit" onClick="return confirmEdit()"
						value="Submit" type="submit"><br></td>
				</tr>
			</tbody>
		</table>
		<br>
		<a href="adminMenu.jsp">BACK TO MENU</a>
	</form>
</body>
</html>