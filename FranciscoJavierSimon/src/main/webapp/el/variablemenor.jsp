<%-- 
    Document   : variablemenor
    Created on : 14-nov-2017, 17:03:06
    Author     : Simon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <h1>Hello World!</h1>
        <c:set var="variable" scope="session" value="15"/>
        <c:set var="cadena" scope="session" value="La variable es mayor que 10"></c:set>
        <c:if test="${variable <= 10}">
            <c:set var="cadena" scope="session" value="La variable es menor o igual que 10"></c:set>            
        </c:if>
            <p><c:out value="${cadena}"></c:out></p>
        <a href="${pageContext.request.contextPath}">Menú inicial</a>
    </body>
</html>



