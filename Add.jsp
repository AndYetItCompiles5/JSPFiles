<%@include file="verifyLogin.jsp"%>
<html>
<head>
<title></title>
</head>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}
td:nth-child(even){
	background-color: #d1e0e0;
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
<body>
	<ul>
	<li><a href="adminMenu.jsp"><img border="0" alt="CMCadmin" src="g106.png" width="34" height="18"></a></li>
  	<li><a href="manageUniv.jsp" class="active">Universities</a></li>
  	<li><a href="ManageUsers.jsp">Users</a></li>
 	<li style="float:right"><a href="logout_action.jsp">Logout</a></li>
 	</ul>
	<% 	
		String error = request.getParameter("error");
		if(error != null && error.equals("1"))out.println("USERNAME, PASSWORD AND TYPE ARE REQUIRED");
		else if(error != null && error.equals("2")) out.print("THAT USERNAME IS ALREADY TAKEN");
		else if(error != null && error.equals("3")) out.println("AN UNEXPECTED ERROR OCCURED");
	%>
	<p class="header"></p>
	<form method="post" action="Add_action.jsp" name="addUser">
		<table style="text-align: left; width: 266px; height: 228px;"
			border="1" cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td style="vertical-align: top;">First Name<br>
					</td>
					<td style="vertical-align: top;"><input name="FirstName"><br>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Last Name<br>
					</td>
					<td style="vertical-align: top;"><input name="LastName"><br>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Username<br>
					</td>
					<td style="vertical-align: top;"><input name="Username">
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Password<br>
					</td>
					<td style="vertical-align: top;"><input name="Password">
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;">Type<br>
					</td>
					<td style="vertical-align: top;">
						<select name="Type">
							<option value = "U">U</option>
							<option value = "A">A</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top;"><input value="Reset"
						name="Reset" type="reset" class="resetButton"></td>
					<td style="vertical-align: top;"><input value="Add" name="Add"
						type="submit" class="submitButton"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</tbody>
		</table>
		<br>
	</form>
	<br>
</body>
</html>


