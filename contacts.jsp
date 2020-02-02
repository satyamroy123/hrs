<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!Doctype HTML>
	<html>

	<head>
		<title>Human Resource Management</title>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="css/style.css" />
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
                        %>Welcome
					<%
                    } else {
                        %>Welcome Admin
						<%
                    }%>
							<a href="employee.jsp?username=<%=session.getAttribute(" username ")%>">
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
					<li class="hover-menu-item menu-item">
						<%
                        if(session.getAttribute("name") == null) {
                            %>
							<a id="menu-link" href="login.jsp">LOGIN</a>
							<%
                        } else {
                            %>
								<a id="menu-link" href="employee.jsp?username=<%=session.getAttribute(" username ")%>">PROFILE</a>
								<%
                        }
                            %>
									</a>
					</li>
					<li class="hover-menu-item menu-item">
						<a id="menu-link" href="feedback.jsp">FEEDBACK</a>
					</li>
					<li class="hover-menu-item menu-item">
						<a id="menu-link" href="aboutUs.jsp">ABOUT US</a>
					</li>
					<li class="active-menu-item menu-item">
						<a id="menu-link" href="contacts.jsp">CONTACTS</a>
					</li>
				</ul>
			</div>
			<center>
				<p1>
					<h2>
						<u>Design by:-</u>
						<h2>
				</p1>
				<table border="0" align="center">
					<tr>
						<td>
							<b>Mohan</b>
							<br> Branch:CSE
							<br> College:Krupajal Engineering College
							<br> Email Id:mohanmahato222@gmail.com
							<br> Mob No:7381887295
						</td>
			</center>
			<td>
				<img src="images/mohan.jpg" align="right" width="150" height="150">
				<td>
					</tr>
					<tr>
						<td>
							<b>Lipsa</b>
							<br> Branch:CSE
							<br> College:Krupajal Engineering College
							<br> Email Id:priyadarsini.lipsa1996@gmail.com
							<br> Mob No:7894826118
						</td>
		</center>
		<td>
			<img src="images/lipsa.png" align="right" width="150" height="150">
			<td>
				</tr>
				<tr>
					<td>
						<b>Satyam</b>
						<br> Branch:CSE
						<br> College:Krupajal Engineering College
						<br> Email Id:satyamkumarroy007@gmail.com
						<br> Mob No:8280060665
					</td>
					</center>
					<td>
						<img src="images/satyam.jpg" align="right" width="150" height="150">
						<td>
				</tr>
				<tr>
					<td>
						<b>Tanveer</b>
						<br> Branch:CSE
						<br> College:Krupajal Engineering College
						<br> Email Id:tnvr000@gmail.com
						<br> Mob No:7894230752
					</td>
					</center>
					<td>
						<img src="images/tanveer.jpg" align="right" width="150" height="150">
						<td>
				</tr>
				<tr>
					<td>
						<b>Rajesh</b>
						<br> Branch:CSE
						<br> College:Krupajal Engineering College
						<br> Email Id:rajeshpradhan5310@gmail.com
						<br> Mob No:8797933024
					</td>
					</center>
					<td>
						<img src="images/rajesh.jpg" align="right" width="150" height="150">
						<td>
				</tr>
				</table>
				<center>
					<a href="index.jsp">Go To The Home Page</a>
				</center>
				<br>
	</body>

	</html>