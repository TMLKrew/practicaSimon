<%-- 
    Document   : import
    Created on : 16-nov-2017, 17:21:20
    Author     : Simon
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="mensaje.jsp">
            <c:param name="param1" value="hola"/>
            <c:param name="param2" value="mundo"/>
        </c:import>
        <a href="${pageContext.request.contextPath}">Menú inicial</a>
    </body>
</html>
