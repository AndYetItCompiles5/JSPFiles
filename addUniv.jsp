<%@ page import="Project.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="verifyLogin.jsp"%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>addUniv</title>
</head>
<%
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
<body>
		<%String error = request.getParameter("error");
		if(error!=null && error.equals("1")){%>
			<script type="text/javascript">
				alert("SCHOOL NAME IS REQUIRED");
			</script>
		<%}
		else if(error!=null && error.equals("2")){%>
			<script type="text/javascript">
				alert("SCHOOL NAME IS TAKEN");
			</script>
		<%}
		else if(error!=null && error.equals("3")){%>
			<script type="text/javascript">
				alert("ALL PERCENTAGE FIELDS MUST BE BETWEEN 0 AND 100\n(-1 if unknown)");
			</script>
		<%}
		else if(error!=null && error.equals("4")){%>
			<script type="text/javascript">
				alert("SAT SCORES MUST BE BETWEEN 200 and 800\n(-1 if unknown)");
			</script>
		<%}
		else if(error!=null && error.equals("5")){%>
			<script type="text/javascript">
				alert("AN UNEXPECTED ERROR OCCURED");
			</script>
		<%}%>
		<br>
		<br>
	<form method="post" action="addUnivAction.jsp" name="addUniversity">
		ADD UNIVERSITY<br>
		<table style="text-align: left; width: 494px; height: 485px;"
			border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">SCHOOL NAME<br>
					</td>
					<td style="vertical-align: top;"><input name="schoolName" value=""><br>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">STATE<br>
					</td>
					<td style="vertical-align: top;">
					<select name="state">
					<% 	
					for(int i = -1; i < states.size(); i++){
						if(i == -1){ %>
							<option value="<%=i%>"><%=i%></option> 
						<%}
						else { %>
							<option value="<%=states.get(i).toUpperCase()%>"><%=states.get(i).toUpperCase()%></option>
						<%}
					}%>
					</select>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">LOCATION<br>
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
					<td style="vertical-align: top;">CONTROL<br>
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
					<td style="vertical-align: top;">NUMBER OF STUDENTS<br>
					</td>
					<td style="vertical-align: top;"><input name="numberOfStudents" value="-1"
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" min ="-1"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">NUMBER OF APPLICANTS<br>
					</td>
					<td style="vertical-align: top;"><input name="numberOfApplicants" value="-1" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" min="-1"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">EXPENSES<br>
					</td>
					<td style="vertical-align: top;"><input name="expenses" value="-1" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" min="-1"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% FEMALE<br>
					</td>
					<td style="vertical-align: top;"><input name="percentFemale" value="-1" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" step="0.1" min="-1" max="100"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;"> % ADMITTED<br>
					</td>
					<td style="vertical-align: top;"><input name="percentAdmitted" value="-1"
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" step="0.1" min="-1" max="100"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;"> % ENROLLED<br>
					</td>
					<td style="vertical-align: top;"><input id = "percentEnrolled" name="percentEnrolled" value="-1" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" " type="number" step="0.1" min="-1" max="100"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">% FINANCIAL AID<br>
					</td>
					<td style="vertical-align: top;"><input name="percentFA" value="-1" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" step="0.1" min="-1" max="100"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">SAT VERBAL<br>
					</td>
					<td style="vertical-align: top;"><input name="satVerbal" value="-1" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)"  type="number" min ="-1" max="800"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">SAT MATH<br>
					</td>
					<td style="vertical-align: top;"><input name="satMath" value="-1" 
					onclick="return isNumber(event)" onkeypress="return isNumber(event)" type="number" min ="-1" max="800"></td>
				</tr>
				<tr>
					<td style="vertical-align: top;">ACADEMIC SCALE (1-5)<br>
					</td>
					<td style="vertical-align: top;">
					<select name="qualityAcademic">
						<%	
							for(int i = -1; i <= 5; i++){
								if(i == -1){
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
					<td style="vertical-align: top;"><select name="qualitySocial">
						<%	
							for(int i = -1; i <= 5; i++){
								if(i == -1){
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
					<select name="qualityLife">
						<%	
							for(int i = -1; i <= 5; i++){
								if(i == -1){
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
					function confirmAdd(){
						 return confirm("Are you sure you want to add with these specifications?");
						}
					</script>
				<!-- end of emphases -->
				<tr>
					<td style="vertical-align: top;"><input value="Reset"
						name="Reset" type="reset"><br></td>
					<td style="vertical-align: top;"><input name="submit"
						value="Submit" onClick="return confirmAdd()" type="submit"><br></td>
				</tr>
			</tbody>
		</table>
		<a href="adminMenu.jsp">BACK TO MENU</a>
	</form>
</body>
</html>