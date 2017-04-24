<%@ page import="Project.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>SearchResults</title>
</head>
<body>
<b>Search Results:</b>
		<div style="text-align: center;"></div>
		<table style="text-align: left; width: 100%;" border="1">
			<tbody>
				<tr>
					<td style="text-align: center; width: 552px;"><br> Save School to School List</td>
					<td style="text-align: center; width: 552px;"><br>School Name</td>
					<td style="text-align: center; width: 552px;"><br>View School Details</td>
				</tr>
				<%
					SearchController sController = new SearchController();
					String name = request.getParameter("???");
					String state = request.getParameter("???");
					String location = request.getParameter("???");
					String control = request.getParameter("???");
					int numStudentsLow = Integer.parseInt(request.getParameter("???"));
					int numStudentsHigh = Integer.parseInt(request.getParameter("???"));
					double perFemaleLow = Double.parseDouble(request.getParameter("???"));
					double perFemaleHigh = Double.parseDouble(request.getParameter("???"));
					int satVerbalLow = Integer.parseInt(request.getParameter("???"));
					int satVerbalHigh = Integer.parseInt(request.getParameter("???"));
					int satMathLow = Integer.parseInt(request.getParameter("???"));
					int satMathHigh = Integer.parseInt(request.getParameter("???"));
					int expensesLow = Integer.parseInt(request.getParameter("???"));
					int expensesHigh = Integer.parseInt(request.getParameter("???"));
					double perFALow = Double.parseDouble(request.getParameter("???"));
					double perFAHigh = Double.parseDouble(request.getParameter("???"));
					int numApplicantsLow = Integer.parseInt(request.getParameter("???"));
					int numApplicantsHigh = Integer.parseInt(request.getParameter("???"));
					double perAdmittedLow = Double.parseDouble(request.getParameter("???"));
					double perAdmittedHigh = Double.parseDouble(request.getParameter("???"));
					double perEnrolledLow = Double.parseDouble(request.getParameter("???"));
					double perEnrolledHigh = Double.parseDouble(request.getParameter("???"));
					int academicScaleLow = Integer.parseInt(request.getParameter("???"));
					int academicScaleHigh = Integer.parseInt(request.getParameter("???"));
					int socialScaleLow = Integer.parseInt(request.getParameter("???"));
					int socialScaleHigh = Integer.parseInt(request.getParameter("???"));
					int lifeScaleLow = Integer.parseInt(request.getParameter("???"));
					int lifeScaleHigh = Integer.parseInt(request.getParameter("???"));
					
					ArrayList<String> emphases = new ArrayList<String>();
					if(request.getParameter("emp1") != null){
						emphases.add(request.getParameter("emp1"));
					}
					if(request.getParameter("emp2") != null){
						emphases.add(request.getParameter("emp2"));
					}
					if(request.getParameter("emp3") != null){
						emphases.add(request.getParameter("emp3"));
					}
					if(request.getParameter("emp4") != null){
						emphases.add(request.getParameter("emp4"));
					}
					if(request.getParameter("emp5") != null){
						emphases.add(request.getParameter("emp5"));
					}
					
					HashSet<String> listSchools = sController.search(name,state,location,control,numStudentsLow,numStudentsHigh,perFemaleLow,perFemaleHigh,
							satVerbalLow,satVerbalHigh,satMathLow,satMathHigh,expensesLow,expensesHigh,perFALow,perFAHigh,numApplicantsLow,numApplicantsHigh,
							perAdmittedLow,perAdmittedHigh,perEnrolledLow,perEnrolledHigh,academicScaleLow,academicScaleHigh,socialScaleLow,socialScaleHigh,
							lifeScaleLow,lifeScaleHigh,emphases);
					for(String school: listSchools){
					%>
				<tr>
					<td style="vertical-align: top; width: 552px; text-align: center;"><br>
						<form method="post" action="???" name="Save">
							<input name="save" value="Save" type="submit">
							<input name="schoolName" value="<%=school%>" type="hidden">
						</form>
					</td>
					
					<td style="vertical-align: top; text-align: center;"><br>
						<%=school%>
					</td>
					
					<td style="vertical-align: top; text-align: center;"><br>
						<!-- need to figure out action for this form; views school details -->
						<form method="post" action="viewSchool.jsp" name="View">
							<input name="view" value="View" type="submit">
							<input name="schoolName" value="<%=school%>" type="hidden">
						</form>
					</td>
				</tr>
				<% }%>
				
			</tbody>
		</table>
		<br>
</body>
</html>