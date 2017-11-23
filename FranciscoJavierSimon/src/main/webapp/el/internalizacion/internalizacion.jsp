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
        <c:set var="paises" scope="session" value="${paises}"/>
        <form action="${pageContext.request.contextPath}/el/internalizacion/mensaje.jsp" method="post">
            <input type="hidden" name="fecha" value="${fecha}">
            <select name="pais">
                <c:forEach var="list" items="${paises}">
                    <option value='${list.key}'>${list.value}</option>        
                </c:forEach>
            </select>
            <input type="submit" name="enviar" value="Enviar">
        </form>
    </body>
</html>
