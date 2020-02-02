<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.ConnectionProvider, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Thank You For Feedback</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
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

        <%
        String name = request.getParameter("txtName");
        String phone = request.getParameter("txtPhone");
        String email = request.getParameter("txtEmail");
        String message = request.getParameter("txtMessage");
        Date feedbackDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY");
        String date = sdf.format(feedbackDate);
        String query = String.format("INSERT INTO FEEDBACK VALUES('%s', %S, '%s', '%s', TO_DATE('%s',  'DD/MM/YYYY'))", name, phone, email, message, date);
        try {
            Connection con = ConnectionProvider.getConnection();
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);
            %>
            <div class="success message">
                Thank You for your much appriciated feedback.
            </div>
            <%
        } catch (SQLException ex) {
            out.println(query);
            out.println(ex.getMessage());
            %>
            <div class="error message">
                something went wrong. please try again later or rephrase your message
            </div>
            <%
        } catch (ClassNotFoundException ex) {
            out.println(query);
            out.println(ex.getMessage());
        }
        %>

        <div id="slide_container" class="slide_container">
            <img id="slide" class="slide_image_holder">
            <script type="text/javascript">
                slideIt();
            </script>
        </div>

    </center>
</body>
</html>