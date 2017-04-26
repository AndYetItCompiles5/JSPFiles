<%@ page import="Project.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>EditSelf</title>
</head>
<body>
<br>
<%
    out.println("Edit User : " + "calseth"); //request.getParameter("Username"));
	DBController dbController = new DBController();
	// will we have a session attribute for Username?
	//String username = (String)session.getAttribute("Username");
	String username = "calseth";
	Account user = dbController.getAccount(username);
	String fName = user.getFirstName();
	String lName = user.getLastName();
	String password = user.getPassword();
	char   type = user.getType();
	char   status = user.getStatus();
%>
<form action="EditAction.jsp" name="UserInfo">
  <table style="text-align: left; width: 778px; height: 195px;" border="1" cellpadding="2" cellspacing="2">
    <tbody>
      <tr>
        <td style="vertical-align: top;">First Name<br>
        </td>
        <td style="vertical-align: top;"><input name="firstName" value="<%=fName%>"><br>
        </td>
      </tr>
      <tr>
        <td style="vertical-align: top;">Last Name<br>
        </td>
        <td style="vertical-align: top;"><input name="lastName" value="<%=lName%>"><br>
        </td>
      </tr>
      <tr>
        <td style="vertical-align: top;">Username<br>
        </td>
        <td style="vertical-align: top;"><input readonly="readonly" name="username" value="<%=username%>"><br>
        </td>
      </tr>
      <tr>
        <td style="vertical-align: top;">Password<br>
        </td>
        <td style="vertical-align: top;"><input name="password" value ="<%=password%>"><br>
        </td>
      </tr>
      <tr>
        <td style="vertical-align: top;">Type<br>
        </td>
        <td style="vertical-align: top;"><input readonly="readonly" name="type" value="<%=type%>"><br>
        </td>
      </tr>
      <tr>
        <td style="vertical-align: top;">Status<br>
        </td>
        <td style="vertical-align: top;"><input readonly="readonly" name="status" value="<%=status%>"><br>
        </td>
      </tr>
      <tr>
      <td style="vertical-align: top;"><input name="submit" value="Submit Changes" type="submit"></td>
      <td style="vertical-align: top;"><input name="reset" value="Reset" type="reset"></td>
      </tr>
    </tbody>
  </table>
  
</form>


</body></html>