<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.ConnectionProvider"%>

<!Doctype HTML>
<html>

<head>
    <title>Human Resource Management</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
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
                            <%
                            if(session.getAttribute("name") == null) {
                                %><a id="menu-link" href="login.jsp">LOGIN</a><%
                            } else {
                                %><a id="menu-link" href="employee.jsp?username=<%=session.getAttribute("username")%>">PROFILE</a><%
                            }
                            %>
                        </a>
                    </li>
                    <li class="active-menu-item menu-item">
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
            <form id="feeback_form" method="POST" action="feedbackAction.jsp">
                Name
                <br />
                <input class="text_input" type="text" name="txtName" placeholder="Your Name" required/>
                <br /> Phone
                <br />
                <input class="text_input" type="text" name="txtPhone" placeholder="Your phone number" required />
                <br /> EMail
                <br />
                <input class="text_input" type="text" name="txtEmail" placeholder="Your Email Address" required />
                <br /> Message
                <br />
                <textarea name="txtMessage" placeholder="Your message..." required ></textarea>
                <br />
                <input class="submit" type="submit" value="Submit" />
            </form>
        </div>
        <div id="slide_container" class="slide_container">
            <img id="slide" class="slide_image_holder">
            <script type="text/javascript">
                slideIt();
            </script>
        </div>

    </center>
</body>

</html>