<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Feedbacks</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
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
        <form id="listContainer" >
            <%
            String query = String.format("SELECT NAME, CONTACT_NO, EMAIL, MESSAGE, FEEDBACK_DATE FROM FEEDBACK ORDER BY FEEDBACK_DATE DESC");
            int row = 0;
            try {
                Connection con = ConnectionProvider.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next()) {
                    if (row == 0) {
                        %>
                        <table id="feedbackList" class="table">
                            <thead>
                                <tr class="table_row">
                                    <th class="table_head">
                                        Name
                                    </th>
                                    <th class="table_head">
                                        Contact No.
                                    </th>
                                    <th class="table_head">
                                        Email
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                    }
                    %>
                    <tr id="row<%=row++%>" class="table_row" onclick="select(this.id)">
                        <td id="row<%=row-1%>col1" class="table_cell">
                            <%=rs.getString("NAME")%>
                        </td>
                        <td id="row<%=row-1%>col2" class="table_cell">
                            <%=rs.getString("CONTACT_NO")%>
                        </td>
                        <td id="row<%=row-1%>col3" class="table_cell">
                            <%=rs.getString("EMAIL")%>
                        </td>
                    </tr>
                    <tr class="table_row selected hidden" id="mrow<%=row-1%>">
                       <td colspan="3" id="row<%=row-1%>col4" class="table_cell">
                           <%=rs.getString("MESSAGE")%>
                       </td> 
                    </tr>
                    <%
                }
                if (row == 0) {
                    %>
                    <div class="message notification">
                        There is no feedback to be displayed.
                    </div>
                    <%
                } else {
                    %>
                            </tbody>
                            </table>
                    <%
                }
            } catch(SQLException | ClassNotFoundException ex) {
                out.println(query);
                out.println(ex.getMessage());
            }
            %>
        </form>
    </center>
    <script src="script/feedbackList.js">
    </script>
</body>
</html>