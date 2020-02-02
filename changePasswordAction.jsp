<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/validation.css" />
    <title>Login</title>
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
                    <li class="active-menu-item menu-item">
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
        String DBPassword = null;
        String currentPassword = request.getParameter("txtCurrentPassword");
        String newPassword = request.getParameter("txtNewPassword");
        String username = session.getAttribute("username").toString();
        String query1 = String.format("SELECT PASSWORD FROM ACCOUNT_INFO WHERE USERNAME = '%s'", username);
        String query2 = String.format("UPDATE ACCOUNT_INFO SET PASSWORD = '%s' WHERE USERNAME = '%s'", newPassword, username);
        String query3 = String.format("UPDATE USER_DETAILS SET PASSWORD = '%s' WHERE USERNAME = '%s'", newPassword, username);
        try {
            Connection con = ConnectionProvider.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query1);
            rs.next();
            DBPassword = rs.getString("PASSWORD");
            if (DBPassword.equals(currentPassword   )) {
                stmt.executeUpdate(query2);
                stmt.executeUpdate(query3);
                %>
                <div class="message">Your have been Successfully changed</div>
                <%
            } else {
                response.sendRedirect("error.jsp?errorPage=changePassword.jsp");
                %>
                <script>hideError()</script>
                <%
            }

        } catch (ClassNotFoundException ex) {
            out.println(query1);
            out.println(query2);
            out.println(query3);
            out.println(ex.getMessage());
        } catch (SQLException ex) {
            out.println(query1);
            out.println(query2);
            out.println(query3);
            out.println(ex.getMessage());
        }
        %>
    </center>
</body>
</html>