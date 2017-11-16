<%-- 
    Document   : catch
    Created on : 16-nov-2017, 16:24:08
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
        <c:catch var="ex">
            <jsp:expression> 3 / 0</jsp:expression>
        </c:catch>
        <c:if test="${ex != null}">
            <c:out value="${ex}: Se ha intentado dividir por cero"></c:out>
        </c:if>
        <a href="${pageContext.request.contextPath}">Menú inicial</a>

    </body>
</html>
