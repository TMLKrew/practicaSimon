<%-- 
    Document   : actualizar
    Created on : 27-nov-2017, 10:24:00
    Author     : Simon
--%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix ="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:update dataSource="${ds}" var="update">
            UPDATE clientes SET nombre = ? , apellidos = ? , direccion = ? , telefono = ? where codigo = ?
            <sql:param value="${param.updateNombre}"/>
            <sql:param value="${param.updateApellidos}"/>
            <sql:param value="${param.updateDireccion}"/>
            <sql:param value="${param.updateTelefono}"/>
            <sql:param value="${actualizar}"/>
        </sql:update>
            <p>Se han actualizado los datos</p>
        <input type="button" onclick="location.href = '${pageContext.request.contextPath}/el/sql/menuCRUD.jsp';" value="Menú SQL" />
        <jsp:scriptlet>
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        </jsp:scriptlet>
    </body>
</html>
