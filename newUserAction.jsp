<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
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
        <div id="navigation" style="width:100%">
            <ul id="menu" align="center" class="menu">
                <li class="hover-menu-item menu-item">
                    <a id="menu-link" href="index.jsp">HOME</a>
                </li>
                <li class="hover-menu-item menu-item">
                    <%
                    if(session.getAttribute("name") == null) {
                    %>
                        <a id="menu-link" href="login.jsp">
                            LOGIN
                        </a>
                    <%
                    } else {
                    %>
                        <a id="menu-link" href="employee.jsp?username=<%=session.getAttribute("username")%>">
                            PROFILE
                        </a>
                    <%
                    }
                    %>
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
        String query = null;
        String query2 = null;
        try {
            String firstName = request.getParameter("txtFirstName");
            String middleName = request.getParameter("txtMiddleName");
            String lastName = request.getParameter("txtLastName");
            String fatherName = request.getParameter("txtFatherName");
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String email = request.getParameter("txtEmail");
            String contactNo = request.getParameter("txtContactNo");
            String gender = request.getParameter("radioGender");
            String dob = request.getParameter("txtDOB");
            String aadhaarNo = request.getParameter("txtUIDNo");
            if(middleName.equals("")) {
                middleName = "null";
            }
            if (aadhaarNo.equals("")) {
                aadhaarNo = "null";
            }
            query = String.format("INSERT INTO USER_DETAILS(FIRST_NAME, MIDDLE_NAME, LAST_NAME, FATHER_NAME, SALARY, USERNAME, PASSWORD, DATE_OF_BIRTH, GENDER, EMAIL, CONTACT_NO, AADHAAR_NO) VALUES('%s', '%s', '%s', '%s', 0, '%s', '%s', TO_DATE('%s', 'YYYY/MM/DD'), '%s', '%s', %s, %s)", firstName, middleName, lastName, fatherName, username, password, dob, gender, email, contactNo, aadhaarNo);
            Connection con = ConnectionProvider.getConnection();
            Statement stmt = con.createStatement();
            query2 = String.format("SELECT COUNT(*) FROM USER_DETAILS WHERE USERNAME = '%s'", username);
            ResultSet rs = stmt.executeQuery(query2);
            rs.next();
            int status = rs.getInt(1);
            if (status == 1) {
                response.sendRedirect("error.jsp?errorPage=newUser.jsp");
            }
            stmt.executeUpdate(query);
            out.println(query);
            %>
        <div class="success message">
            You have successfully registered with username <%=username%>. You will be able login as soon as you are approved. This takes no more than 1 day. 
        </div>
        <%
        } catch (SQLException ex) {
            out.println(query);
            out.println(ex.getMessage());
            %>
            <div class="error message">
                Some unknown error occured. please try again later or report it in the feedback.
            </div>
            <%
        }
        %>
    </center>
</body>
</html>