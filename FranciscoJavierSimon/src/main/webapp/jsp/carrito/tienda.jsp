<%-- 
    Document   : tienda
    Created on : 13-oct-2017, 15:09:12
    Author     : Simon
--%>

<%@page import="es.albarregas.models.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../../css/tienda.css">
    </head>
    <body>
        <% HttpSession sesion = request.getSession();
        String error="";
        String mensaje="";
        String salir="";
        boolean pintar=true;
        boolean lista=false;
        ArrayList<Libro> carrito = new ArrayList();
        if (request.getParameter("enviar") != null ){
            if (request.getParameter("libros") == null ){
                error="Seleccione un libro por favor...";
            }else
            try{
                if (Integer.parseInt(request.getParameter("cantidad")) <= 0 ){
                    error="La cantidad de entrada no puede ser 0 o negativa";
                }
            }
            catch (Exception ex){
                error="La cantidad de entrada no es número válido";
            }
            if (error.equals("")){
                int cantidad;
                carrito = (ArrayList<Libro>) sesion.getAttribute("carrito");
                if (carrito.size() != 0){  
                    boolean encontrado=false;
                    for (int i= 0 ; i < carrito.size() ; i++){                        
                        if (carrito.get(i).getNombre().equals(request.getParameter("libros"))){
                            cantidad=carrito.get(i).getCantidad();
                            carrito.remove(i);
                            carrito.add(new Libro(request.getParameter("libros"),Integer.parseInt(request.getParameter("cantidad"))+cantidad));
                            mensaje="Añadido a la cesta "+ (Integer.parseInt(request.getParameter("cantidad"))+cantidad) + " unidades del libro "+request.getParameter("libros");
                            sesion.setAttribute("carrito", carrito); 
                            encontrado=true;
                            break;
                        }
                    }
                        if (encontrado==false){
                              carrito.add(new Libro(request.getParameter("libros"),Integer.parseInt(request.getParameter("cantidad"))));
                              mensaje="Añadido a la cesta "+ Integer.parseInt(request.getParameter("cantidad")) + " unidades del libro "+request.getParameter("libros");
                              sesion.setAttribute("carrito", carrito);
                        }
                    
                }else{
                    carrito.add(new Libro(request.getParameter("libros"),Integer.parseInt(request.getParameter("cantidad"))));
                    mensaje="Añadido a la cesta "+ Integer.parseInt(request.getParameter("cantidad")) + " unidades del libro "+request.getParameter("libros");
                    sesion.setAttribute("carrito", carrito);
                }
            } // EN TODAS LAS SALIDAS HACES CARRITO.ADD. MEJOR HACERLO FUERA DE ESTE IF
        }else
        if (request.getParameter("fin") != null ){
            pintar=false;
            carrito=(ArrayList<Libro>)sesion.getAttribute("carrito");
            if (carrito.size() != 0){
                sesion.invalidate();
                lista=true;
            }else{
                sesion.invalidate();
            }
                
        }else
            if (sesion.getAttribute("carrito") != null){
                carrito=(ArrayList<Libro>)sesion.getAttribute("carrito");
            }else
                sesion.setAttribute("carrito", carrito);
        
            %>
        <div id="tienda">
            <h1 id="cabecera">Libros On-Line </h1>
            <img id="logo" src="../../images/carrito.jpg">
            <p><em><%= error %></em></p>
            <%-- EN EL MENSAJE HAY QUE PONER LOS LIBROS AÑADIDOS EN EL MOMENTO Y NO LOS QUE LLEVAS EN TOTAL --%>
            <p><%= mensaje %></p>
            <% if (pintar==true){ %>
            <form action="tienda.jsp" method="post">                
                <p>Seleccione un libro</p>
                <select name="libros" size="6">
                    <option>LA MUERTE LLEGA A PEMBERLEY</option>
                    <option>LA CONJURA DE CORTES</option>
                    <option>BUENOS DIAS, PRINCESA</option>
                    <option>EMOCIONES TOXICAS</option>
                    <option>JUEGO DE TRONOS</option>
                    <option>LA ORDEN DEL TEMPLE</option>
                </select>
                <p><label for="cantidad">Cantidad: <input type="text" name="cantidad" id="cantidad"></label></p>
                <input type="submit" name="enviar" value="Añadir a la cesta">
                <a href="tienda.jsp"><input type="button" name="limpiar" value="Limpiar"></a>
                <input type="submit" name="fin" value="Finalizar la compra">                
            </form>
            <% } else 
            if (lista==false) { %>
            <p>No ha seleccionado ningún producto</p>
            <p><a href="../../index.html">Gracias por confiar en nosotros</a></p>
            <%  } else { 
            %> 
            <p>Este es el detalle de su pedido:</p>
            <table>
                 <tr> 
                    <th> Cantidad </th>
                    <th> Título </th>
                </tr>
            <% for (Libro lib : carrito) { %>
            <tr> 
                <td> <%= lib.getCantidad() %> </td>
                <td> <%= lib.getNombre() %> </td>
            </tr>
            <% } %>
            </table>
            <%-- MEJOR UTILIZAR getContextPath --%>
            <p><a href="../../index.html">Gracias por confiar en nosotros</a></p>
            <% 
            }
            %>
        </div>
    </body>
</html>
