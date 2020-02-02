<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="styleSheet" type="text/css" href="css/style.css" />
    <title>
        Error
    </title>
</head>
<body>
    <%
    String errorPage = request.getParameter("errorPage");
    getServletContext().getRequestDispatcher("/" + errorPage).include(request, response);
    %>
    <script  type="text/javascript">
        document.getElementById("error").style.display = "block";
    </script>
    <%
    %>
</body>
</html>