<%@page language="java" import="java.util.*,Project.*"%>
<%@include file="verifyLogin.jsp"%>
<%
	UserFuncController uc = (UserFuncController)session.getAttribute("sess");
	DBController dbController = (DBController) session.getAttribute("dbController");
	String name = request.getParameter("schoolName");
	boolean result = dbController.deleteUniversity(name);
	if(result==false){
		%><script type="text/javascript">
		
		alert("Cannot delete university"); 
		window.location.href = "manageUniv.jsp";
		</script><%
	}
	else{
		response.sendRedirect("manageUniv.jsp");
	}
%>
