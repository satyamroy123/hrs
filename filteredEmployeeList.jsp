<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionProvider" %>
    <!Doctype HTML>
    <html>

    <head>
        <title>Human Resource Management</title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" />
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
            <form id="EmployeeListContainer" method="post" action="makeAdmin.jsp">
                <input type="hidden" id="txtUsername" name="txtUsername" />
                <div id="search" class="search">
                    <input type="text" class="search_text" name = "txtSearchParameter" id="txtSearchParameter" placeholder="Search..." />
                    <a id="searchLink" href=""><input type="button" class="search_button" value="Search" onclick="search()" /></a>
                </div>
                <%
                String parameter = request.getParameter("parameter");
                String name;
                String fatherName;
                String username;
                String salary;
                int row = 0;
                char per = '%';
                String query = String.format("SELECT FIRST_NAME, FATHER_NAME, U.USERNAME, SALARY FROM USER_DETAILS U, ACCOUNT_INFO A WHERE U.USERNAME = A.USERNAME AND (FIRST_NAME LIKE '%c%s%c' OR U.USERNAME LIKE '%c%s%c')", per, parameter, per, per, parameter, per);
                try {
                    Connection con = ConnectionProvider.getConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    while(rs.next()) {
                        if(row == 0) {
                            %>
                <table id="employeeToApprove" class="table">
                    <thead id="tableHeader">
                        <tr class="table_row">
                            <th class="table_head" width="25%">
                                Name
                            </th>
                            <th class="table_head" width="30%">
                                Father's Name
                            </th>
                            <th class="table_head" width="25%">
                                Username
                            </th>
                            <th  class="table_head" width="20%">
                                Salary
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        }
                        %>
                        <tr class="table_row" id="row<%=row++%>" onclick="select(this.id)">
                            <td id="row<%=row-1%>col0" class="table_cell" width="25%">
                                <%=rs.getString("FIRST_NAME")%>
                            </td>
                            <td id="row<%=row-1%>col1" class="table_cell" width="30%">
                                <%=rs.getString("FATHER_NAME")%>
                            </td>
                            <td id="row<%=row-1%>col2" class="table_cell" width="25%">
                                <%=rs.getString("USERNAME")%>
                            </td>
                            <td id="row<%=row-1%>col3" class="table_cell" width="20%">
                                <%=rs.getString("SALARY")%>
                            </td>
                        </tr>
                        <%
                    }
                } catch (Exception ex) {
                    out.println(ex.getMessage());
                }
                if (row == 0) {
                    %>
                    <div id="" class="message notification">
                        There is no employee to display
                    </div>
                    <%
                } else {
                    %>
                    </tbody>
                </table>
                <a id="link" href="">
                    <input type="button" class="button" id="btnVeiwDetails" value="Veiw Details" />
                </a>
                <input type="submit" id="btnMakeAdmin" class="button" value="Make Admin" onclick="return makeAdmin()" />
                    <%
                }
                %>
                    
            </form>
        </center>
        <script src="script/employeeList.js">
        </script>
    </body>
    </html>