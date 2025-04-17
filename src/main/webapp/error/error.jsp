<%--
  Created by IntelliJ IDEA.
  User: GIGABYTE
  Date: 11/23/2023
  Time: 1:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Architects+Daughter&family=Inter:wght@400;500;700&display=swap"
            rel="stylesheet"
    />
    <title>Error</title>
</head>
<body>
<center>
    <h1>Error</h1>
    <h2><%=exception.getMessage() %><br/> </h2>
</center>
</body>
</html>
