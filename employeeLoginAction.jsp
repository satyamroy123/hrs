<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Login</title>
</head>
<body>
    <%
    int status;
    String name;
    String username = request.getParameter("txtUsername");
    String password = request.getParameter("txtPassword");
    String query = String.format("SELECT COUNT(*) FROM ACCOUNT_INFO WHERE USERNAME = '%s' AND PASSWORD = '%s'", username, password);
    try {
        Connection con = ConnectionProvider.getConnection();
        
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        if (rs.next()) {
           status = rs.getInt(1);
           if (status == 1) {
               query = String.format("SELECT FIRST_NAME FROM USER_DETAILS WHERE USERNAME = '%s'", username);
               rs = stmt.executeQuery(query);
               rs.next();
               out.println(rs.getString(1));
               session.setAttribute("name", rs.getString(1));
               session.setAttribute("username", username);
               session.setAttribute("password", password);

               response.sendRedirect("employee.jsp?username=" + username);
           } else {
               response.sendRedirect("error.jsp?errorPage=login.jsp");
           }
        } else {
            %><p style="color:red">Sorry, no record Available</p> <%
        }
    } catch (SQLException ex) {
        out.println(query);
        out.println(ex.getMessage());
    } catch (ClassNotFoundException ex) {
        out.println(ex.getMessage());
    }
    %>
</body>
</html>