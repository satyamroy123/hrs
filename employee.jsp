<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionProvider" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" type="text/css" href="css/validation.css">
        <!-- <link rel="stylesheet" type="text/css" href="css/userDetails.css" /> -->
        <title>
            <%=session.getAttribute("name")%>
        </title>

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
                    <li class="active-menu-item menu-item">
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
            String username = request.getParameter("username");
            String query = String.format("SELECT FIRST_NAME, MIDDLE_NAME, LAST_NAME, FATHER_NAME, SALARY, USERNAME, TO_CHAR(DATE_OF_BIRTH, 'DD/MM/YYYY') DATE_OF_BIRTH, GENDER, EMAIL, CONTACT_NO, AADHAAR_NO FROM USER_DETAILS WHERE USERNAME = '%s'", username);
            
            try {
                Connection con = ConnectionProvider.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                rs.next();
                String firstName = rs.getString("FIRST_NAME");
                String middleName = rs.getString("MIDDLE_NAME").equals("null") ? "" : rs.getString("MIDDLE_NAME");
                String lastName = rs.getString("LAST_NAME");
                String fatherName = rs.getString("FATHER_NAME");
                String salary = rs.getString("SALARY") == null ? "0" : rs.getString("SALARY");
                String dob = rs.getString("DATE_OF_BIRTH");
                String gender = rs.getString("GENDER").equals("M") ? "Male" : "Female";
                String email = rs.getString("EMAIL");
                String contactNo = rs.getString("CONTACT_NO");
                String aadhaarNo = rs.getString("AADHAAR_NO") == null ? "" : rs.getString("AADHAAR_NO");
                
                %>
                <div id="userDetails" class="user_details">
                    <div class="name_container">
                        <label class="name">
                                <%=firstName%> <%=middleName%> <%=lastName%>
                        </label>
                    </div>
                    <center>
                    <div class="form_container">
                        <form method="POST" action="updateEmployeeDetails.jsp" class="formontent">
                            <div style="text-align:right"><label class="edit_form" <%if(session.getAttribute("userType") == null){%>onclick="enableFields()"<%}else{%>onclick="enableAllFields()"<%}%> >edit</label></div>
                            <input type="hidden" id="txtUsrname" name="txtUsername" value="<%=username%>" />
                            
                            <label>First Name</label><br />
                            <input class="text_input" type="text" id="txtFirstName" name="txtFirstName" value="<%=firstName%>" disabled />
                            <label id="errFirstName" class="err hidden">Please enter your first name</label>
                            <label id="errFirstNameNotProper" class="err hidden">Please enter a proper name</label>
                
                            <label>Middle Name</label><br />
                            <input class="text_input" type="text" id="txtMiddleName" name="txtMiddleName" value="<%=middleName%>" disabled />
                            <label id="errMiddleNameNotProper" class="err hidden">Please enter a proper name</label>

                            <label>Last Name</label><br />
                            <input class="text_input" type="text" id="txtLastName" name="txtLastName" value="<%=lastName%>" disabled />
                            <label id="errLastName" class="err hidden">Please enter your last name</label>
                            <label id="errLastNameNotProper" class="err hidden">Please enter a proper name</label>
                
                            <label>Father's Name</label><br />
                            <input class="text_input" type="text" id="txtFatherName" name="txtFatherName" value="<%=fatherName%>" disabled />
                            <label id="errFatherName" class="err hidden">Please enter your father's name</label>
                            <label id="errFatherNameNotProper" class="err hidden">Please enter a proper name</label>
                
                            <label>Salary</label><br />
                            <input class="text_input" type="text" id="txtSalary" name="txtSalary" value="<%=salary%>" disabled />
                            <label id="errSalary" class="err hidden">Please enter a salary</label>
                            <label id="errSalaryNotProper" class="err hidden">Please enter a proper salary</label>
                            <label id="errSalaryTooBig" class="err hidden">Salary out of range</label>

                            <label>Date of Birth</label><br />
                            <input class="text_input" type="text" id="txtDOB" name="txtDOB" value="<%=dob%>" disabled />
                            <label id="errDOBNotProper" class="err hidden">Please enter a proper date</label>

                            <label>Gender</label><br />
                            <input class="text_input" type="text" id="txtGender" name="txtGender" value="<%=gender%>" disabled />
                            <label>Email</label><br />
                            <input class="text_input" type="text" id="txtEmail" name="txtEmail" value="<%=email%>" disabled />
                            <label id="errEmail" class="err hidden">Please enter your Email address</label>
                            <label id="errEmailNotProper" class="err hidden">Please enter a proper Email address</label>
                
                            <label>Contact No</label><br />
                            <input class="text_input" type="text" id="txtContactNo" name="txtContactNo" value="<%=contactNo%>" disabled />
                            <label id="errContactNo" class="err hidden">Please enter your contact number</label>
                            <label id="errContactNoNotProper" class="err hidden">Please enter a proper contact number</label>
                
                            <label>Aadhaar No</label><br />
                            <input class="text_input" type="text" id="txtAadhaarNo" name="txtAadhaarNo" value="<%=aadhaarNo%>" disabled />
                            <label id="errAadhaarNoNotProper" class="err hidden">Please enter a proper Aadhaar number</label>

                            <input type="submit" id="btnSubmit" value="submit" class="button hidden" onclick="return validateForm()" />
                            <input type="button" id="btnCancel" value="Cancel" class="button hidden" onclick="disablefields()" />
                        </form>
                    </div>
                    </center>
                </div>
                <script src="script/updateFormValidation.js">
                </script>
                <%
            } catch (SQLException ex) {
                out.println(ex.getMessage());
                %><p style="color:red"><%=query%></p> <%
            } catch (ClassNotFoundException ex) {
                out.println(ex.getMessage());
            }
            %>
        </center>

    </body>

    </html>