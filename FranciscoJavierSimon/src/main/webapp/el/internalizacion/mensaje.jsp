<%-- 
    Document   : mensaje
    Created on : 17-nov-2017, 16:59:31
    Author     : Simon
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="paises" scope="session" value="${paises}"/>

        <c:set var="nombre" value="${fn:split(param.pais,'/')}"/>
        <fmt:setLocale value="${nombre[0]}"/>
        <fmt:setBundle basename="${nombre[0]}" var="bundle"/>
        <c:choose>
            <c:when test="${bundle} != null">
                <p>Hola : <fmt:message key = "hola"/></p>
                <p>Adios : <fmt:message key = "adios"/></p>  
            </c:when>
            <c:otherwise>
                <p>No se ha encontrado traducción para <c:out value="${nombre[1]}"/></p>
            </c:otherwise>
        </c:choose>
        <c:set var="fecha" scope="request" value="${fecha}"/>
        <p>Fecha actual: <fmt:formatDate value = "${fecha}" type = "both" timeStyle = "long" dateStyle = "long" /></p>
        <c:set var = "balance" value = "120000.2309" />
        <p>FormatNumber Currency: <fmt:formatNumber value = "${balance}" type = "currency"/></p>
        <p>FormatNumber 2 dígitos : <fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${balance}" /></p>
        <p>FormatNumber : <fmt:formatNumber type = "number" groupingUsed = "false" value = "${balance}" /></p>

        <a href="${pageContext.request.contextPath}">Menú inicial</a>
    </body>
</html>
