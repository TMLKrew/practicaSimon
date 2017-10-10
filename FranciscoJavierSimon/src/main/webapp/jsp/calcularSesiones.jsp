<%-- 
    Document   : calcularSesiones
    Created on : 10-oct-2017, 10:36:10
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
        <%-- La aplicacion crea un objeto HttpSession y se instancia mediante el metodo getSession().
        Comprueba si se pulsa el input "Eliminar". Si se ha pulsado elimina el atributo "contador" sino comprueba si
        el atributo "contador" no es nulo, entonces le asigna a la variable "valor" el valor del atributo contador, 
        utiliza un casting para asignarle valor Integer.
        Se aumenta la variable "valor" y se le asigna al atributo "contador"
        Si el atributo "contador" es distinto de nulo y es igual a "1" muestra un mensaje si el atributo "contador"
        es distinto de "1" muestra otro mensaje distinto y si el atributo "contador" es nulo muestra el input "Recargar"
        esto ocurre cuando se pulsa en el input "Eliminar".
        --%>
    <% 
    HttpSession s = request.getSession(); 
    int valor = 0;
    if (request.getParameter("Eliminar") != null){
        s.removeAttribute("contador");
    }else{
        if (s.getAttribute("contador") != null ){
            valor = (Integer)s.getAttribute("contador");
        }
        valor++;
        s.setAttribute("contador", valor); 
    }
    if (s.getAttribute("contador") != null){
        if (s.getAttribute("contador").equals(1)){
            %>
            <h1> Se ha visitado la página <%= s.getAttribute("contador") %> vez</h1> 
        <%
        } else {
        %>       
            <h1> Se ha visitado la página <%= s.getAttribute("contador") %> veces</h1>
            <%
            }
            %>
            <form action="calcularSesiones.jsp">
            <a href="calcularSesiones.jsp"><input type="button" name="Recargar" value="Recargar"></a>
            <input type="submit" name="Eliminar" value="Eliminar">
            <a href="../index.html"><input type="button" name="Menu" value="Menú inicial"></a>
            </form>
    <%
    } else {
    %>
    <form action="calcularSesiones.jsp">
        <input type="submit" name="Recargar" value="Recargar">
    </form>
    <%
        }
    %>
</html>
