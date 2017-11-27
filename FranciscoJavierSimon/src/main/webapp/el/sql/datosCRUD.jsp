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
                <jsp:useBean id="cliente" scope="session" class="es.albarregas.bean.Cliente"/>
                <jsp:setProperty name="cliente" property="*"/>
                <form action="insertar.jsp" method="post">
                    <table>
                        <tr>
                            <th colspan="2">Datos del cliente</th>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td>${cliente.nombre}</td>
                        </tr>
                        <tr>
                            <td>Apellidos</td>
                            <td>${cliente.apellidos}</td>
                        </tr>
                        <tr>
                            <td>Direccion</td>
                            <td>${cliente.direccion}</td>
                        </tr>
                        <tr>
                            <td>Télefono</td>
                            <td>${cliente.telefono}</td>
                        </tr>
                        <tr>
                            <td><input type="submit" name="confirmar" value="Confirmar"/></td>
                            <td><input type="button" onclick="location.href = '${pageContext.request.contextPath}/el/sql/menuCRUD.jsp';" value="Menú SQL" /></td>
                        </tr>
                    </table>
                </form>

            </c:when>
            <c:when test="${opcion == 2}">
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                    </tr>
                    <c:forEach items="${result.rows}" var="clientes">
                        <tr>
                            <td>${clientes.nombre}</td>
                            <td>${clientes.apellidos}</td>
                            <td>${clientes.direccion}</td>
                            <td>${clientes.telefono}</td>

                        </tr>
                    </c:forEach>
                </table>
                <input type="button" onclick="location.href = '${pageContext.request.contextPath}/el/sql/menuCRUD.jsp';" value="Menú SQL" />


            </c:when>
            <c:when test="${opcion == 3}">               
                <form action="actualizar.jsp" method="post">
                    <table>
                        <c:set var="actualizar" value="${param.updateCliente}" scope="session"/>                       
                        <tr>
                            <th>Nombre</th>
                            <td><input type="text" name="updateNombre"/></td>
                        </tr>
                        <tr>
                            <th>Apellidos</th>
                            <td><input type="text" name="updateApellidos"/></td>
                        </tr>
                        <tr>
                            <th>Direccion</th>
                            <td><input type="text" name="updateDireccion"/></td>
                        </tr>
                        <tr>
                            <th>Teléfono</th>
                            <td><input type="text" name="updateTelefono"/></td>
                        </tr>                        
                        <tr>
                            <td><input type="submit" name="enviar" value="Enviar"/></td>
                            <td><input type="button" onclick="location.href = '${pageContext.request.contextPath}/el/sql/menuCRUD.jsp';" value="Cancelar" /></td>
                        </tr>
                    </table>
                </form>


            </c:when>
            <c:when test="${opcion == 4}">
                <form action="eliminar.jsp" method="post">
                    <table> 
                        <c:set var="eliminarClientes" scope="session" value="${paramValues.eliminar}"/>
                        <c:forEach var="eliminarCliente" items="${eliminarClientes}">
                            <c:forEach var="lista" items="${result.rows}">                                
                                <c:if test="${lista.codigo == eliminarCliente}">
                                    <tr>
                                        <th>Nombre</th>
                                        <td>${lista.nombre}</td>
                                    </tr>
                                    <tr>
                                        <th>Apellidos</th>
                                        <td>${lista.apellidos}</td>
                                    </tr>
                                    <tr>
                                        <th>Direccion</th>
                                        <td>${lista.direccion}</td>
                                    </tr>
                                    <tr>
                                        <th>Teléfono</th>
                                        <td>${lista.telefono}</td>
                                    </tr>  
                                    <tr>
                                        <td/>
                                    </tr>
                                    
                                </c:if>
                            </c:forEach>
                        </c:forEach>

                        <tr>
                            <td><input type="submit" name="enviar" value="Enviar"/></td>
                            <td><input type="button" onclick="location.href = '${pageContext.request.contextPath}/el/sql/menuCRUD.jsp';" value="Cancelar" /></td>
                        </tr>
                    </table>
                </form>

            </c:when>
        </c:choose>
    </body>
</html>
