<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Delete Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/validation.css" />
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
        <%
        String username = session.getAttribute("username").toString();
        String query = String.format("UPDATE ACCOUNT_INFO SET ACCOUNT_TYPE = 'S' WHERE USERNAME = '%s'", username);
        try {
            Connection con = ConnectionProvider.getConnection();
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);
            %>
            <div id="message" class="success message">
                Your resignation is accepted. Thank you for your service
            </div>
            <%
            session.setAttribute("userType", null);
        } catch(ClassNotFoundException ex) {
            out.println(query);
            out.println(ex.getMessage());
        } catch(SQLException ex) {
            out.println(query);
            out.println(ex.getMessage());
        }
        %>
    </center>
</body>
</html>