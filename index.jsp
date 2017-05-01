<html>
<head>
<title>Login Form</title>
</head>
<style>
table {
    position: absolute;
    top: 200px;
    left: 250px;
    border-collapse: collapse;
    width: 100%;
}
th {
	text-align: center;
	background-color: darkslategray;
    color: white;
    font-size: 12px;
    font-family: Verdana, Helvetica, sans-serif;
    height:60px;
}
td{
	text-align: center;
	background-color: #d1e0e0;
	font-family: Verdana, Helvetica, sans-serif;
}
.guestButton{
	position: absolute;
    top: 435px;
    left: 250px;
    overflow: hidden;
    background-color: #1f2e2e;
    color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 15px 32px;
    text-decoration: none;
    display: inline-block;
    border: none;
}
.guestButton:hover{
	background-color: #344c4c;
}
.loginButton{
	width: auto;
	argin: 0;
    padding: 0;
    overflow: hidden;
	background-color: #1f2e2e;
	color: white;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 10px 15px;
    text-decoration: none;
    display: inline-block;
    border: none;
	
}
.loginButton:hover{
    background-color: #d1e0e0;
    color: black;
}
.resetButton{
	width: auto;
	argin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #d1e0e0;
    color: black;
    font-family: Verdana, Helvetica, sans-serif;
    padding: 10px 15px;
    text-decoration: none;
    display: inline-block;
    border: none;
}
.resetButton:hover{
	background-color: #1f2e2e;
	color: white;
}
.logo{
	position: absolute;
    top: 100px;
    left: 275px;
    width: 200px;
    height: 80px;
}
</style>
<body>
	<img alt="CMCadmin" src="g60.png" class="logo">
	<%
		String anyErrors = request.getParameter("Error");
		if (anyErrors != null && anyErrors.equals("1")) { 
		%>
			<script type="text/javascript">
			alert("You are deactivated");
			</script> <%
		} else if (anyErrors != null && anyErrors.equals("2")) { %>
			<script type="text/javascript">
			alert("Username or password is invalid");
			</script>
		<% } else if (anyErrors != null && anyErrors.equals("3")){
			out.println("SOMETHING WENT WRONG");
		}
		else if(anyErrors != null && anyErrors.equals("4")){
			out.println("MUST LOGIN");
		}
	%>
	<form method="post" action="Login_action.jsp" name="Login">
		<table style="text-align: left; width: 266px; height: 228px;"
			border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">Username
					</td>
					<td style="vertical-align: top;"><input name="Username">
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Password
					</td>
					<td style="vertical-align: top;"><input type="password" name="Password">
					</td>
				</tr>
			<tr>
				<th style="vertical-align: top;"><input value="Reset"
					name="Reset" type="reset" class="resetButton"></th>
				<th style="vertical-align: top;"><input value="Log in"
					name="Log in" type="submit" class="loginButton"></th>
				
			</tr>
			</tbody>
		</table>
		<a href="guestLogin_Action.jsp" class="guestButton">Guest</a>
	</form>
	<br>
</body>
</html>
