<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Change Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/validation.css" />
    <link rel="stylesheet" type="text/css" href="css/custom.css" />
    <script src="script/script.js"></script>
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
                <li class="hover-menu-item menu-item">
                    <%
                    if(session.getAttribute("name") == null) {
                        %><a id="menu-link" href="login.jsp">LOGIN</a><%
                    } else {
                        %><a id="menu-link" href="employee.jsp?username=<%=session.getAttribute("username")%>">PROFILE</a><%
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
                <li class="hover-menu-item menu-item">
                    <a id="menu-link" href="contacts.jsp">CONTACTS</a>
                </li>
            </ul>
        </div>
        <div id="formContainer" class="form_container">
            <form method="POST" action="changePasswordAction.jsp">
                <label id="error" class="error message hidden">Wrong current password</label><br />
                <label>Enter Current Password</label><br />
                <input class="text_input" type="password" id="txtCurrentPassword" name="txtCurrentPassword" placeholder="Enter your current password here" />
                <label id="errCurrentPassword" class="err hidden">Please enter your current password</label>
                <br /><br />
                
                <label>Enter New password</label><br />
                <input class="text_input" type="password" id="txtNewPassword" name="txtNewPassword" placeholder="Enter your new password here" />
                <label id="errNewPassword" class="err hidden">Please enter your new password</label>
                <label id="errNewPasswordNotProper" class="err hidden">Please enter a proper password. A proper password contains atleast 1 capital letter, 1 small letter, 1 number and must contain 8-16 characters</label>
                <br /><br />

                <label>Enter New password Again</label><br />
                <input class="text_input" type="password" id="txtCNewPassword" name="txtCNewPassword" placeholder="Enter your new password again here" />
                <label id="errCNewPassword" class="err hidden">Please enter your new password again</label>
                <label id="errCNewPasswordNotMatching" class="err hidden">The password your entered is not matching</label>
                <br />
                <label for="checkboxPasswordVisibility" class="input_container" style="font-size: 17px;">Show Password
                        <br />
                        <input type="checkbox" id="checkboxPasswordVisibility" onclick="toggleVisibiltiy()" />
                        <span class="checkmark"></span>
                </label>
                <br />
                <input type="submit" id="btnChangePassword" class="button" value="Change Password" onclick="return validateChangePasswordForm()" />
                <a href="index.jsp">
                    <input type="button" class="button" value="Cancel" />
                </a>
            </form>
        </div>
    </center>
    <script src="script/changePasswordValidation.js"></script>
</body>
</html>