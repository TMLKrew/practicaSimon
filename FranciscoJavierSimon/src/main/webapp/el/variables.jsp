<%-- 
    Document   : variables
    Created on : 14-nov-2017, 16:40:58
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
        <h1>Variables EL</h1>
        <c:set var="variable" scope="session" value="variable sesión"/>
        <c:set var="variable" scope="request" value="variable petición"/>
        <p>Sesión : <c:out value="${sessionScope.variable}"/></p>
        <p>Petición : <c:out value="${requestScope.variable}"/></p>
        <c:remove var="variable" scope="session"></c:remove>
        <p>Sesión : <c:out value="${sessionScope.variable}" default="No tiene valor"/></p>
        <p>Petición : <c:out value="${requestScope.variable}" default="No tiene valor"/></p>
        
        <a href="${pageContext.request.contextPath}">Menú inicial</a>
        


    </body>
</html>
