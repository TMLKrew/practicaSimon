<%-- 
    Document   : internalizacion
    Created on : 16-nov-2017, 19:30:23
    Author     : Simon
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="fecha" scope="request" value="${fecha}"/>
        <fmt:setLocale value="es_ES"/>
        <fmt:setTimeZone value="GMT+1"/>
        <p>Fecha actual: <fmt:formatDate value = "${fecha}" type = "both" timeStyle = "long" dateStyle = "long" /></p>
        <c:set var = "balance" value = "120000.2309" />
        <p>FormatNumber Currency: <fmt:formatNumber value = "${balance}" type = "currency"/></p>
        <p>FormatNumber 3 dígitos : <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${balance}" /></p>
        <p>FormatNumber : <fmt:formatNumber type = "number" groupingUsed = "false" value = "${balance}" /></p>
    </body>
</html>
