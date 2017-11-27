<%-- 
    Document   : insertar
    Created on : 24-nov-2017, 13:02:39
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
 <sql:update dataSource="${ds}" var="count">
   INSERT INTO clientes VALUES (0,'${cliente.nombre}','${cliente.apellidos}','${cliente.direccion}','${cliente.telefono}')
 </sql:update>
   <p>Se han introducido los datos</p>
   <input type="button" onclick="location.href='${pageContext.request.contextPath}/el/sql/menuCRUD.jsp';" value="Menú SQL" />
   <jsp:scriptlet>
       HttpSession sesion = request.getSession();
       sesion.invalidate();
   </jsp:scriptlet>
    </body>
</html>
