<%-- 
    Document   : calcularCookies
    Created on : 09-oct-2017, 20:44:35
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/estilo.css">
    </head>
    <body>
        <div id="cabecera">
        <%-- La aplicacion crea un objeto Cookie y un array de Objetos Cookie, en el array utiliza el metodo getCookies()
        para comprobar todos los objetos Cookies en el localhost, comprueba si existe nuestro objeto Cookie contador si
        existe le asigna a la variable "valor" el valor del objeto Cookie con el metodo getValue sino inicializa el objeto
        aumenta la variable "valor" y se la asigna al objeto Cookie. Después muestra por pantalla distintos valores, si
        el valor del objeto Cookie es "1" muestra el nombre, ruta, tiempo de vida, seguridad y versión con los distintos
        metodos del objeto Cookie, si el valor del objeto Cookie es mayor muestra un mensaje con dicho valor.
        En el formulario con el input "Eliminar" le asignamos al objeto Cookie el valor 0.
        --%>
        <% 
    Cookie contador = null;
    Cookie[] cookies = request.getCookies();
    int valor=0;
    if (request.getParameter("Eliminar") != null){
        contador = new Cookie ("contador" , "0");
    }else
    for (Cookie s : cookies){
        if (s.getName().equals("contador")){
            valor = Integer.parseInt(s.getValue());
        }else
             contador = new Cookie("contador" , "0");
    }   
    valor++;
    contador.setValue(String.valueOf(valor));
    contador.setMaxAge(24 * 60 * 60);
    response.addCookie(contador);
        
        if (contador.getValue().equals("1")){
        %>
        <h1>Se ha visitado la página <%= contador.getValue() %> vez</h1>
        <h2>Nombre : <%= contador.getName() %></h2>
        <h2>Ruta : <%= contador.getPath() %></h2>
        <h2>Caduca : <%= contador.getMaxAge()%></h2>
        <h2>Seguro : <%= contador.getSecure()%></h2>
        <h2>Version : <%= contador.getVersion() %></h2>
        <% } else {
        %>
        <h1> Se ha visitado la página <%= contador.getValue() %> veces</h1>
        <% }
        %>
        <form action="calcularCookies.jsp">
        <a href="calcularCookies.jsp"><input type="button" name="Recargar" value="Recargar"></a>
          <input type="submit" name="Eliminar" value="Eliminar">
          <a href="../index.html"><input type="button" name="Menu" value="Menú inicial"></a>
        </form>
        </div>
    </body>
</html>
