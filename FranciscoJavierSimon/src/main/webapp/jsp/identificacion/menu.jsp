<%-- 
    Document   : menu
    Created on : 10-oct-2017, 17:43:38
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link rel="stylesheet" type="text/css" href="../../css/estilo.css">
    </head>
    <body>
        <% HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usuario")== null){
            response.sendRedirect("login.jsp?error=1");
        }
        %>
        <div id="cabecera">
            <h1>Menú admin de <%= sesion.getAttribute("usuario") %></h1>
        <h2>Varias opciones</h2>
        <p><a href="loginOUT.jsp">Cerrar sesión</a></p>
        </div>
    </body>
</html>
