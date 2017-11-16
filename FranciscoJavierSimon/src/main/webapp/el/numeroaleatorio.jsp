<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<style>
    #a{
        background: red;
        color: white;
    }
    #b{
        background: blue;
        color: yellow;
    }
    #c{
        color:red;
        font-weight: bold;
    }
</style>


<h1>Hello World!</h1>
<c:set var="aleatorio" scope="request" value="${aleatorio}"/>
<c:choose>
    <c:when test="${aleatorio < 4}">
        <div id="a">El número es <c:out value="aleatorio"/></div>
    </c:when>
    <c:when test="${aleatorio >= 4 && aleatorio <8}">
        <div id="b">El número es <c:out value="aleatorio"/></div>
    </c:when>
    <c:when test="${aleatorio >= 8}">
        <div id="c">El número es <c:out value="aleatorio"/></div>
    </c:when>
</c:choose>

<a href="${pageContext.request.contextPath}">Menú inicial</a>
</head>
</html>




