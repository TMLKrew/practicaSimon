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
         <c:forEach var="eliminarCliente" items="${eliminarClientes}">
        <sql:update dataSource="${ds}" var="delete">
            DELETE FROM clientes where codigo = ?
            <sql:param value="${eliminarCliente}"/>
        </sql:update>
            <c:set var="contador" value="${contador + delete}"/>
         </c:forEach>
            <p>Se han eliminado <c:out value="${contador}"/> datos</p>
        <input type="button" onclick="location.href = '${pageContext.request.contextPath}/el/sql/menuCRUD.jsp';" value="Menú SQL" />
        <jsp:scriptlet>
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        </jsp:scriptlet>
    </body>
</html>
