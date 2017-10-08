<%-- 
    Document   : saludo
    Created on : 06-oct-2017, 17:02:19
    Author     : Simon
--%>

<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String tratamiento = null;
            String nombre = null;
            int tiempo = LocalTime.now().getHour();
            tratamiento = request.getParameter("sexo").equals("hombre") ? "señor" : "señora";   
            nombre =request.getParameter("nombre");
        %>            
        <% 
            if (tiempo >= 6 && tiempo <= 14)
                {
        %>
            <h1>Buenos días <%=tratamiento%> <%= nombre%></h1>
        <%
          } else if (tiempo > 14 && tiempo <= 22)
            {
        %><h1>Buenas tardes <%=tratamiento%></H1>
        <%
            } else {
        %>
        <h1>Buenas noches <%= tratamiento %> <%=nombre%></h1>
        <%
            }
        %>
        <p><a href="../index.html">Menú inicial</a></p>
    </body>
</html>
