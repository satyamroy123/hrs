<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!Doctype HTML>
<html>

<head>
	<title>Human Resource Management</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/validation.css">
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
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
		<!-- #region navigation-->
		<div id="navigation" style="width:100%">
			<ul id="menu" align="center" class="menu">
				<li class="hover-menu-item menu-item">
					<a id="menu-link" href="index.jsp">HOME</a>
				</li>
				<li class="hover-menu-item menu-item">
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
		<!-- #endregion -->
		<div id="form_container" class="form_container">
			<div id="discription" class="discription">
				this is discription
			</div>
			<div id="error" class="error message hidden">
				The username you have selected is already in use. choose anather one
			</div>
			<form id="form_new_user" method="POST" action="newUserAction.jsp">
				First Name
				<br />
				<input class="text_input" type="text" id="txtFirstName" name="txtFirstName" placeholder="Your First Name" maxlength="20" autofocus/>
				<label id="errFirstName" class="err hidden">Please enter your first name</label>
				<label id="errFirstNameNotProper" class="err hidden">Please enter a proper name</label>

				<br /> Middle Name
				<br />
				<input class="text_input" type="text" id="txtMiddleName" name="txtMiddleName" placeholder="Your Middle Name" maxlength="20" />
				<label id="errMiddleNameNotProper" class="err hidden">Please enter a proper name</label>

				<br /> Last Name
				<br />
				<input class="text_input" type="text" id="txtLastName" name="txtLastName" placeholder="Your Last Name" maxlength="20" />
				<label id="errLastName" class="err hidden">Please enter your last name</label>
				<label id="errLastNameNotProper" class="err hidden">Please enter a proper name</label>

				<br /> Father's Name
				<br />
				<input class="text_input" type="text" id="txtFatherName" name="txtFatherName" placeholder="Your Father's Name" maxlength="50" />
				<label id="errFatherName" class="err hidden">Please enter your father's name</label>
				<label id="errFatherNameNotProper" class="err hidden">Please enter a proper name</label>

				<br /> Username
				<br />
				<input class="text_input" type="text" id="txtUsername" name="txtUsername" placeholder="Choose Your Username" maxlength="20" />
				<label id="errUsername" class="err hidden">Please enter a username</label>
				<label id="errUsernameNotProper" class="err hidden">Please enter a proper username</label>

				<br /> Password
				<br />
				<input class="text_input" type="password" id="txtPassword" name="txtPassword" placeholder="Your Password" maxlength="16" />
				<label id="errPassword" class="err hidden">Please enter a password</label>
				<label id="errPasswordNotProper" class="err hidden">Please enter a proper password. A proper password contains atleast 1 capital letter, 1 small letter, 1 number and must contain 8-16 characters</label>

				<br /> Confirm Password
				<br />
				<input class="text_input" type="password" id="txtCPassword" name="txtCPassword" placeholder="Re-type Your Password" maxlength="16" />
				<label id="errCPassword" class="err hidden">Please enter your password again</label>
				<label id="errCPasswordNotMatching" class="err hidden">The password your entered is not matching</label>
				<label for="checkboxPasswordVisibility" class="input_container" style="font-size: 17px;">Show Password
					<br />
					<input type="checkbox" id="checkboxPasswordVisibility" onclick="toggleVisibiltiy()" />
					<span class="checkmark"></span>
				</label>

				<br /> Email Address
				<br />
				<input class="text_input" type="text" id="txtEmail" name="txtEmail" placeholder="Your Email Address" maxlength="30" />
				<label id="errEmail" class="err hidden">Please enter your Email address</label>
				<label id="errEmailNotProper" class="err hidden">Please enter a proper Email address</label>

				<br /> Contact No.
				<br>
				<input class="text_input" type="text" id="txtContactNo" name="txtContactNo" placeholder="Your Contact Number" maxlength="10" />
				<label id="errContactNo" class="err hidden">Please enter your contact number</label>
				<label id="errContactNoNotProper" class="err hidden">Please enter a proper contact number</label>

				<br /> Gender
				<label for="radioGender1" class="input_container">Male
					<input type="radio" id="radioGender1" name="radioGender" value="M" checked="checked">
					<span class="radiomark"></span>
				</label>
				<label for="radioGender2" class="input_container">Female
					<input type="radio" id="radioGender2" name="radioGender" value="F">
					<span class="radiomark"></span>
				</label>
				<br /> Date Of Birth
				<br />
				<input class="text_input" type="date" id="txtDOB" name="txtDOB" placeholder="Select Your Date of Birth" required />
				<label id="errDOBNotProper" class="err hidden">Please enter a proper date</label>

				<br /> Aadhaar No.
				<br />
				<input class="text_input" type="text" id="txtUIDNo" name="txtUIDNo" placeholder="Your Aadhaar Number" maxlength="12" />
				<label id="errUIDNoNotProper" class="err hidden">Please enter a proper Aadhaar number</label>

				<br />
				<input class="submit" type="submit" value="Submit" onclick="return validateRegistrationForm()" />
				<br />
			</form>
			<script src="script/registrationFormValidation.js"></script>
		</div>
		<br />
		<div id="slide_container" class="slide_container">
			<img id="slide" class="slide_image_holder">
			<script type="text/javascript">
				slideIt();
			</script>
		</div>
		<div id="footer" class="footer">
			welcome
		</div>
	</center>
</body>
</html>