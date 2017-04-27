<%@ page import="Project.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	DBController dbController = (DBController) session.getAttribute("dbController");
	String name = request.getParameter("schoolName");
	String state = !request.getParameter("state").equals("") ? request.getParameter("state") : "-1";
	String location = !request.getParameter("location").equals("") ? request.getParameter("location") : "-1";
	String control = !request.getParameter("control").equals("") ? request.getParameter("control") : "-1";
	int numStudents = !request.getParameter("numberOfStudents").equals("")
			? Integer.parseInt(request.getParameter("numberOfStudents")) : -1;
	double percentFemale = !request.getParameter("percentFemale").equals("")
			? Double.parseDouble(request.getParameter("percentFemale")) : -1;
	int satVerbal = !request.getParameter("satVerbal").equals("")
			? Integer.parseInt(request.getParameter("satVerbal")) : -1;
	int satMath = !request.getParameter("satMath").equals("")
			? Integer.parseInt(request.getParameter("satMath")) : -1;
	int expenses = !request.getParameter("expenses").equals("")
			? Integer.parseInt(request.getParameter("expenses")) : -1;
	double perFA = !request.getParameter("percentFA").equals("")
			? Double.parseDouble(request.getParameter("percentFA")) : -1;
	double percentAdmitted = !request.getParameter("percentAdmitted").equals("")
			? Double.parseDouble(request.getParameter("percentAdmitted")) : -1;
	int numApplicants = !request.getParameter("numberOfApplicants").equals("")
			? Integer.parseInt(request.getParameter("numberOfApplicants")) : -1;
	double percentEnrolled = !request.getParameter("percentEnrolled").equals("")
			? Double.parseDouble(request.getParameter("percentEnrolled")) : -1;
	int aScale = !request.getParameter("qualityAcademic").equals("")
			? Integer.parseInt(request.getParameter("qualityAcademic")) : -1;
	int sScale = !request.getParameter("qualitySocial").equals("")
			? Integer.parseInt(request.getParameter("qualitySocial")) : -1;
	int lScale = !request.getParameter("qualityLife").equals("")
			? Integer.parseInt(request.getParameter("qualityLife")) : -1;

	University univ = dbController.getUniversity(name);

	ArrayList<String> oldEmp = dbController.getEmphases(name);
	ArrayList<String> newEmp = new ArrayList<String>();
	if (!request.getParameter("emp1").equals(""))
		newEmp.add(request.getParameter("emp1"));
	if (!request.getParameter("emp2").equals(""))
		newEmp.add(request.getParameter("emp2"));
	if (!request.getParameter("emp3").equals(""))
		newEmp.add(request.getParameter("emp3"));
	if (!request.getParameter("emp4").equals(""))
		newEmp.add(request.getParameter("emp4"));
	if (!request.getParameter("emp5").equals(""))
		newEmp.add(request.getParameter("emp5"));
	if (!request.getParameter("emp6").equals(""))
		newEmp.add(request.getParameter("emp6"));
	if (!request.getParameter("emp7").equals(""))
		newEmp.add(request.getParameter("emp7"));
	if (!request.getParameter("emp8").equals(""))
		newEmp.add(request.getParameter("emp8"));
	if (!request.getParameter("emp9").equals(""))
		newEmp.add(request.getParameter("emp9"));
	if (!request.getParameter("emp10").equals(""))
		newEmp.add(request.getParameter("emp10"));

	if (percentFemale > 100 || (percentFemale < 0 && percentFemale != -1) || percentEnrolled > 100
			|| (percentEnrolled < 0 && percentEnrolled != -1) || percentAdmitted > 100
			|| (percentAdmitted < 0 && percentAdmitted != -1) || (perFA < 0 && perFA != -1) || perFA > 100) {
		response.sendRedirect("editUniv.jsp?schoolName=" + name + "&error=1");
		return;
	}

	if (satVerbal > 800 || (satVerbal < 200 && satVerbal != -1) || satMath > 800
			|| (satMath < 200 && satMath != -1)) {
		response.sendRedirect("editUniv.jsp?schoolName=" + name + "&error=2");
		return;
	}

	// removes any emphases that were removed 
	for (String emphasis : oldEmp) {
		if (!newEmp.contains(emphasis)) {
			dbController.removeEmphases(request.getParameter("schoolName"), emphasis);
		}
	}
	// adds any new emphases
	for (String emphasis : newEmp) {
		if (!oldEmp.contains(emphasis)) {
			dbController.addEmphases(request.getParameter("schoolName"), emphasis);
		}
	}

	dbController.editUniversity(name, state, location, control, numStudents, percentFemale, satVerbal, satMath,
			expenses, perFA, numApplicants, percentAdmitted, percentEnrolled, aScale, sScale, lScale, newEmp);

	response.sendRedirect("manageUniv.jsp");
%>