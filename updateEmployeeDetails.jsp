<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <title>Update Employee Details</title>
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
        String firstName = request.getParameter("txtFirstName");
        String middleName = request.getParameter("txtMiddleName");
        String lastName = request.getParameter("txtLastName");
        String fatherName = request.getParameter("txtFatherName");
        String salary = request.getParameter("txtSalary");
        String username = request.getParameter("txtUsername");
        String dob = request.getParameter("txtDOB");
        String gender = request.getParameter("txtGender");
        String email = request.getParameter("txtEmail");
        String contactNo = request.getParameter("txtContactNo");
        String aadhaarNo = request.getParameter("txtAadhaarNo");
        if(middleName.equals("")) {
            middleName = "null";
        }
        if (aadhaarNo == null) {
            aadhaarNo = "null";
        } else if (aadhaarNo.equals("")) {
            aadhaarNo = "null";
        }
        String query = String.format("UPDATE USER_DETAILS SET FIRST_NAME = '%s', MIDDLE_NAME = '%s', LAST_NAME = '%s', FATHER_NAME = '%s', SALARY = %s, EMAIL = '%s', CONTACT_NO = %s, AADHAAR_NO = %s WHERE USERNAME = '%s'", firstName, middleName, lastName, fatherName, salary, email, contactNo, aadhaarNo, username);
            try {
                Connection con = ConnectionProvider.getConnection();
                Statement stmt = con.createStatement();
                stmt.executeUpdate(query);
                %>
                <div class="success message">
                    Record successfully updated!
                </div>
                <%
            } catch (ClassNotFoundException ex) {
                out.println(ex.getMessage());
            } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
        %>

    </center>
</body>
</html>