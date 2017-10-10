<%-- 
    Document   : calculadora
    Created on : 06-oct-2017, 17:35:25
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calculadora básica</h1>
         <h1>
         <% 
             float resultado = 0;
             if (request.getParameter("Enviar") != null)
            if ( request.getParameter("operador01") != null && request.getParameter("operador02") != null){
                float p1 = Float.parseFloat(request.getParameter("operador01"));
                float p2 = Float.parseFloat(request.getParameter("operador02"));                
                switch (request.getParameter("accion")){
                case "suma" : resultado = p1 + p2;
                    break;
                case "resta" : resultado = p1 - p2;
                    break;
                case "multiplicacion" : resultado = p1 * p2;
                    break;
                case "division" : resultado = p1 / p2;
                    break;
                }                
            }  
            %>   
            <%= resultado %>
        </h1>
        <form action="calculadora.jsp">
        <label for="parametro01">Introduzca el primer parametro <input type="text" name="operador01" id="parametro01"/></label>
        <label for="parametro02">Introduzca el segundo parametro <input type="text" name="operador02" id="parametro02"/></label>
        <p>
        <label for="suma"><input type="radio" name="accion" value="suma" id="suma" checked="checked ">Suma</label>
        <br>
        <label for="resta"><input type="radio" name="accion" value="resta" id="resta">Resta</label>
        <br>
        <label for="multiplicacion"><input type="radio" name="accion" value="multiplicacion" id="multiplicacion">Multiplicación</label>
        <br>
        <label for="division"><input type="radio" name="accion" value="division" id="division">División</label>
        </p>
        <input type="submit" name="Enviar" value="Enviar"/>
        <a href="calculadora.jsp"><input type="button" name="Limpiar" value="Limpiar"/></a>
        <a href="../index.html"><input type="button" name="Volver" value="Menú Inicial"/></a>
        </form>
    </body>
</html>
