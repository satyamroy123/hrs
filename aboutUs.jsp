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
                    <li class="active-menu-item menu-item">
                        <a id="menu-link" href="aboutUs.jsp">ABOUT US</a>
                    </li>
                    <li class="hover-menu-item menu-item">
                        <a id="menu-link" href="contacts.jsp">CONTACTS</a>
                    </li>
                </ul>
            </div>
            <div id="aboutUs" class="aboutUs">
            Human Resource Management <br>
            Human resource management project is implemented in java platform.
            <br> Main aim of this project is to develop a software application through which organizations can manage employee’s
            information, client’s data, work related information.
            <br> This application is mainly used in software companies for managing employees details which include in which
            project they are allocated and employee experience in different streams.
            <br> Using these application employees can view job information and different features company is providing for employees.
            <br> Employees can use this application to communicate with higher officials like project managers or human resource
            management system for any queries.
            <br> In existing system there are no sources for controlling human resources in a company and organizing work between
            employees effectively which is one of the draw backs on existing system.
            <br> For any organization maintain employees details based on departments and skills and experience is important
            for shifting employees to new project.
            <br> In present system we provide a online application through which human resource management system can handle
            employees details and use employees based on requirement.
            <br> Using this system organization can save time and improve efficiency in organizing available employees and taking
            new employees. In human resource management system project report we provide detailed explanation on existing
            and present system, sequence diagrams, data flow diagrams, UML diagrams and module description.
            </div>
            <div id="slide_container" class="slide_container">
                <br />
                <img id="slide" class="slide_image_holder">
                <script type="text/javascript">
                    slideIt();
                </script>
            </div>
            <footer>
                welcome
            </footer>
        </center>
    </body>

    </html>