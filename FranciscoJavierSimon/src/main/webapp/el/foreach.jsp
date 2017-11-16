<%-- 
    Document   : foreach
    Created on : 16-nov-2017, 16:42:54
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
        <h1>For Each</h1>
        <jsp:useBean class="bean.Listado" id="lista"></jsp:useBean>
        <c:forEach var="list" items="${lista.listado}">        
            <c:out value="${list}"></c:out>
        </c:forEach>
        <h1>For Each VarStatus</h1>
        <ul>
            <c:forEach var="list" items="${lista.listado}" varStatus="i">
                <c:if test="${i.count%2 == 0}">
                    <li id="par"><c:out value="${i.index}. ${list}"></c:out></li>
                    </c:if>
                    <c:if test="${i.count%2 != 0}">
                    <li id="impar"><c:out value="${i.index}. ${list}"></c:out></li>
                    </c:if>
                </c:forEach>
        </ul>
        <h1>For Each Begin Step</h1>
        <c:forEach var="list" items="${lista.listado}" begin="2" step="2">        
            <c:out value="${list}"></c:out>
        </c:forEach>
        <br>
        <a href="${pageContext.request.contextPath}">Menú inicial</a>
    </body>
    <style>
        li {
            list-style: none;
        }
        #par{
            background: blue;
            color:white;
        }
        #impar{
            background: #333;
        }
    </style>
</html>
