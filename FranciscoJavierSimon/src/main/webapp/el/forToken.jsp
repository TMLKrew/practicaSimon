<%-- 
    Document   : forToken
    Created on : 16-nov-2017, 17:12:41
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
        <h1>For Tokens</h1>
        <c:forTokens items = "Domingo$Lunes$Martes$Miercoles$Jueves$Viernes$Sabado" delims = "$" var = "dias" varStatus="i">
        <c:choose>
            <c:when test="${i.index == 0}">
                <c:out value = "${dias} día del señor"/>
            </c:when>
            <c:otherwise>
                <c:out value = "${dias}"/>
            </c:otherwise>
        </c:choose>
     
    </c:forTokens>
        <a href="${pageContext.request.contextPath}">Menú inicial</a>
</body>
</html>
