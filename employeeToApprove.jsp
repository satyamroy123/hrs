<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.ConnectionProvider" %>
    <!Doctype HTML>
    <html>

    <head>
        <title>Employee To Approve</title>
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
            <form id="employeeListContainer">
                <input type="hidden" id="txtUsername" name="txtUsername" />
                    <%
                    String name;
                    String fatherName;
                    String username;
                    String query = String.format("SELECT FIRST_NAME, FATHER_NAME, USERNAME, PASSWORD FROM USER_DETAILS WHERE USERNAME NOT IN (SELECT USERNAME FROM ACCOUNT_INFO)");
                    int row = 0;
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
                            <th class="table_head">
                                Name
                            </th>
                            <th class="table_head">
                                Father's Name
                            </th>
                            <th class="table_head">
                                Username
                            </th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                            <%
                            }
                            %>
                        <tr id="row<%=row++%>" class="table_row" onclick="select(this.id)">
                            <td id="row<%=row-1%>col0" class="table_cell">
                                <%=rs.getString("FIRST_NAME")%>
                            </td>
                            <td id="row<%=row-1%>col1" class="table_cell">
                                <%=rs.getString("FATHER_NAME")%>
                            </td>
                            <td id="row<%=row-1%>col2" class="table_cell">
                                <%=rs.getString("USERNAME")%>
                            </td>
                        </tr>
                        <%
                        }
                        if(row == 0) {
                            %>
                            <div class="message notification">
                                There is no more employees to be approved
                            </div>
                            <%
                        } else {
                            %>
                </table>
                <a id="link" href="">
                    <input type="button" class="button" id="btnVeiwDetails" value="Veiw Details" />
                </a><br /><br />
                <input id="btnApprove" class="button" type="submit" value="Approve" onclick="approve()" />
                <input id="btnDisapprove" class="button" type="submit" value="Disapprove" onclick="disapprove()" />
                            <%
                        }
                    } catch (Exception ex) {
                        out.println(ex.getMessage());
                    }
                    %>
            </form>
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
        <script src="script/employeeToApproveList.js">
        </script>
    </body>

    </html>