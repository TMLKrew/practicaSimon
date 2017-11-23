<%-- 
    Document   : datosCRUD
    Created on : 23-nov-2017, 17:23:39
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${opcion == 1}">
                   <form action="insertar.jsp" method="post">
                    <table>
                        <tr>
                            <th colspan="2">Datos del cliente</th>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td>${param.nombre}</td>
                        </tr>
                        <tr>
                            <td>Apellidos</td>
                            <td>${param.apellidos}</td>
                        </tr>
                        <tr>
                            <td>Direccion</td>
                            <td>${param.direccion}</td>
                        </tr>
                        <tr>
                            <td>Télefono</td>
                            <td>${param.telefono}</td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="confirmar" value="Confirmar"/></td>
                            <td><input type="button" onclick="location.href='${pageContext.request.contextPath}/el/sql/menuCRUD.jsp';" value="Menú SQL" /></td>
                        </tr>
                    </table>
                </form>
                
            </c:when>
               <c:when test="${opcion == 2}">
                
            </c:when>
               <c:when test="${opcion == 3}">
                
            </c:when>
               <c:when test="${opcion == 4}">
                
            </c:when>
        </c:choose>
    </body>
</html>
