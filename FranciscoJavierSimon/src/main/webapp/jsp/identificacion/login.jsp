<%-- 
    Document   : login
    Created on : 10-oct-2017, 17:43:07
    Author     : Simon
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../../css/estilo.css">
    </head>
    <body>
         <% 
        Cookie fecha = null;
        Cookie user = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null){
            for (Cookie s : cookies){
                if (s.getName().equals("fecha")){
                    fecha=s;
                }
                 if (s.getName().equals("user")){
                    user=s;
                }
            }
        }
        
        if (fecha == null){
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy-HH:mm:ss");
        Date date = new Date();
        String f = dateFormat.format(date);
        fecha = new Cookie ("fecha", f);
        fecha.setMaxAge(30 * 24 * 60 * 60);
        }
        response.addCookie(fecha);
        String cadenaError="";
        if (request.getParameter("error") != null){
            switch (request.getParameter("error")){
                case "1" : cadenaError = "Tienes que logearte";
                    break;
                case "2" : cadenaError = "Usuario no autorizado";
                    break;
            }
        }
        %>
        <div id="cabecera">
        <h1>Proceso de identificación</h1>
        <h2>Último acceso : <%= fecha.getValue() %></h2>
        <form action="loginIN.jsp" method="post">
            <p><em><%= cadenaError %></em></p>
            <%-- FALTA CERRAR EL INPUT 
                CONSIGUE PRIMERO EL VALOR DE LA VARIABLE Y AQUI LO METES DONDE CORRESPONDA IGUAL QUE HACES CON cadenaError
            --%>
            
        <p>Usuario <input type="text" name="usuario"
            <% String cadenaValor = (user != null ? "value='"+user.getValue()+"'": ""); %>
            <%= cadenaValor %>>
          </p>
          <%-- FALTA CERRAR EL INPUT --%>
          <p>Contraseña <input type="password" name="pass"></p>
        <p><input type="checkbox" name="recordar" value="recordar"> Recordar contraseña</p>
        <input type="submit" name="enviar" value="Enviar">
        <%-- MEJOR CON EL EVENTO ONCLICK DE LA ETIQUETA INPUT --%>
        <a href="../../index.html"><input type="button" name="menu" value="Menú inicial"></a>
        </form>
        </div>
    </body>
</html>
