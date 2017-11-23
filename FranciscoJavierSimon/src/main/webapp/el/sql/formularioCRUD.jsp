<%-- 
    Document   : formularioCRUD
    Created on : 23-nov-2017, 16:56:36
    Author     : Simon
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/pruebasJAVA"
                           user="java2018"  password="2018" scope="session"/>

        <sql:query dataSource="${ds}" sql="select * from clientes" var="result" scope="session"/>
        <c:set var="opcion" value="${param.valor}" scope="session"/>
        <c:choose>
            <c:when test="${opcion == 1}">
                <form action="datosCRUD.jsp" method="post">
                    <table>
                        <tr>
                            <th colspan="2">Datos del cliente</th>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nombre"/></td>
                        </tr>
                        <tr>
                            <td>Apellidos</td>
                            <td><input type="text" name="apellidos"/></td>
                        </tr>
                        <tr>
                            <td>Direccion</td>
                            <td><input type="text" name="direccion"/></td>
                        </tr>
                        <tr>
                            <td>Télefono</td>
                            <td><input type="text" name="telefono"/></td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="enviar" value="Enviar"/></td>
                            <td><input type="reset" name="limpiar" value="Limpiar"/></td>
                        </tr>
                    </table>
                </form>
            </c:when>
            <c:when test="${opcion == 2}">
                <table>
                    <tr>
                        <th colspan="2">Clientes</th>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td>Direccion</td>
                    </tr>
                    <tr>
                        <td>Cliente$1</td>
                        <td>Dirección$1</td>
                    </tr>
                    <tr>
                        <td><input type="button" onclick="location.href='datosCRUD.jsp';" value="Continuar" /></td>
                    </tr>
                </table>

            </c:when>
            <c:when test="${opcion == 3}">
                <form action="datosCRUD.jsp" method="post">
                    <table>
                        <tr>
                            <th colspan="2">Actualizar cliente</th>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Cliente</td>
                        </tr>
                        <c:forEach var="clientes" items="${result}">
                            <tr>
                                <td><input type="radio" name="updateCliente" value="${clientes.codigo}"/></td>
                                <td><c:out value="${clientes.nombre}"/></td>
                            </tr>

                        </c:forEach>

                        <tr>
                            <td><input type="submit" name="enviar" value="Enviar"/></td>
                            <td><input type="reset" name="limpiar" value="Limpiar"/></td>
                        </tr>
                    </table>
                </form>

            </c:when>
            <c:when test="${opcion == 4}">
                <form action="datosCRUD.jsp" method="post">
                    <table>
                        <tr>
                            <th colspan="2">Eliminar clientes</th>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Cliente</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="deleteCliente" value="claveCliente"/></td>
                            <td>Cliente$1</td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="enviar" value="Enviar"/></td>
                            <td><input type="reset" name="limpiar" value="Limpiar"/></td>
                        </tr>
                    </table>
                </form>

            </c:when>

        </c:choose>


    </body>
</html>
