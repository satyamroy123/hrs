<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!Doctype HTML>

<html>

<head>
	<title>Human Resource Management</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/validation.css" />
	<script src="script/script.js">
	</script>
</head>

<body>
		<header id="header">
				<a href="index.jsp">Home</a> |
				<a href="aboutUs.jsp">About Us</a> |
				<a href="contacts.jsp">Contact Us</a> |
				<%
			if(session.getAttribute("name") == null) {
				%>
				<a href="newUser.jsp">Employee Registration</a> |
				<a href="login.jsp">Login</a>
				<%
			} else {
				if (session.getAttribute("userType") == null) {
					%>Welcome<%
				} else {
					%>Welcome Admin<%
				}%>
				<a href="employee.jsp?username=<%=session.getAttribute("username")%>">
				<%=session.getAttribute("name") %>
				</a> | 
				<a href="logout.jsp">Log out</a>
				<%
			}
			%>
		</header>
	<center>
		<div id="heading" class="heading">
			<img src="images/hrm_logo02.png" id="hr_logo" alt="hr logo" />
			<img src="images/banner04.png" id="hr_title" alt="hr title" />
		</div>
		<div id="navigation" style="width:100%">
			<ul id="menu" align="center" class="menu">
				<li class="hover-menu-item menu-item">
					<a id="menu-link" href="index.jsp">HOME</a>
				</li>
				<li class="active-menu-item menu-item">
					<a id="menu-link" href="login.jsp">LOGIN</a>
				</li>
				<li class="hover-menu-item menu-item">
					<a id="menu-link" href="feedback.jsp">FEEDBACK</a>
				</li>
				<li class="hover-menu-item menu-item">
					<a id="menu-link" href="aboutUs.jsp">ABOUT US</a>
				</li>
				<li class="hover-menu-item menu-item">
					<a id="menu-link" href="contacts.jsp">CONTACTS</a>
				</li>
			</ul>
		</div>
		<div>

		<div id="form_container" class="form_container">
			<form id="loginForm" method="GET" action="employeeLoginAction.jsp" class="form_content">
				<div id="error" class="error message hidden">Invalid username or password</div>
				<input type="button" class="login_type" id="btnEmployeeLogin" value="Employee Login" onclick="activateEmployeeLoginForm()" />
				<input type="button" class="login_type" id="btnAdminLogin" value="Admin Login" onclick="activateAdminLoginForm()" />
				<br />
				<div id="error" class="error message hidden">Invalid username or password</div>
				Username
				<br />
				<input class="text_input" type="text" id="txtUsername" name="txtUsername" placeholder="Enter user name" maxlength="20" />
				<label id="errUsername" class="err hidden">Enter your username here.
				</label>
				<br /> Password
				<br />
				<input class="text_input" type="password" id="txtPassword" name="txtPassword" placeholder="Enter password" />
				<label id="errPassword" class="err hidden">Enter your password here.
				</label>
				<br />
				<input class="submit" type="submit" value="Log In" onclick="return validateLoginForm()" />
				<div id="registrationLink" style="color:white; text-align:center">
					<p>Don't have an account?
						<a href="newUser.jsp">Click here to create an account</a>
					</p>
				</div>
				
			</form>
			<script src="script/loginFormValidation.js">
			</script>
		</div>
		<br />
		<div id="slide_container" class="slide_container">
			<img id="slide" class="slide_image_holder">
			<script type="text/javascript">
				slideIt();
			</script>
		</div>
	</center>
</body>

</html>