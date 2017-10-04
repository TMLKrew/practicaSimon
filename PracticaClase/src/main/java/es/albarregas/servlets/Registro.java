/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Simon
 */
@WebServlet(name = "Registro", urlPatterns = {"/registro"})
public class Registro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @param correcto
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, boolean correcto)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Salida</title>");
// ES CONVENIENTE UTILIZAR request.getContextPath PARA ENCONTRAR LOS RECURSOS
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href='css/estilo.css' media=\"screen\" />");
        out.println("<meta charset='UTF-8'>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id='cabecera'>");
        out.println("<h2>Datos introducidos en el formulario</h2>");
        if (!correcto) {
            out.println("<p>No se han introducido datos</p>");
        } else {
                out.println("Nombre y apellidos: <strong>"+request.getParameter("Nombre")+" "+request.getParameter("Apellido")+"</strong><br>");
                    out.println("Sexo: <strong>"+request.getParameter("Sexo")+"</strong><br>");
                    out.println("Fecha de nacimiento: <strong>"+request.getParameter("dia")+" de ");
                    /**
                     * Utilizamos un Switch para escribir el nombre del mes que corresponde con su número.
                     */
// AYUDANDONOS DE UN ARRAY ES MUCHO MAS CORTO Y PROFESIONAL
                    switch(request.getParameter("mes")){
                        case "1": out.print("Enero");
                            break;                         
                        case "2": out.print("Febrero");
                            break;
                        case "3": out.print("Marzo");
                            break;
                        case "4": out.print("Abril");
                            break;
                        case "5": out.print("Mayo");
                            break;
                        case "6": out.print("Junio");
                            break;
                        case "7": out.print("Julio");
                            break;
                        case "8": out.print("Agosto");
                            break;                           
                        case "9": out.print("Septiembre");
                            break;
                        case "10": out.print("Octubre");
                            break;
                        case "11": out.print("Noviembre");
                            break;
                        case "12": out.print("Diciembre");
                            break;
                    }
                    out.println(" de "+request.getParameter("ano")+"</strong><br>");
                    out.println("Usuario: <strong>"+request.getParameter("Usuario")+"</strong><br>");
                    out.println("Contraseña: <strong>"+request.getParameter("Contrasena")+"</strong><br>");
                    /**
                     * Comprobamos si se han marcado los checkbox de Preferencias, de ser asi recorremos el Array con getParameterValues
                     * para mostrarlos
                     */
                    if (request.getParameter("Preferencias") != null){
                    out.print("Preferencias: <strong>");
                    for (String s : request.getParameterValues("Preferencias"))
                        out.print(s+" "); 
                    out.println("</strong><br>");
                    }
            
        }
        out.print("<p><a href='" + request.getContextPath() + "'>Men&uacute; inicial</a></p>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
   

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean correcto = false;
        processRequest(request, response, correcto);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * En el metodo doPost validamos si todos los campos requeridos son válidos
     * Para el Nombre, Usuario y Contraseña solo validamos que los campos no esten vacios
     * Para la fecha comprobamos mediante un int[] que los dias elegidos son válidos en los meses elegidos
     * Utilizamos variables booleanas para asignar que campos no son correctos si todas las variables son correctas se imprimen los datos
     * En caso de error nos aparece un mensaje en pantalla con un boton que nos permite volver a rellenar el formulario manteniendo los datos
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        boolean correcto = true;
        boolean errorN = false, errorU = false, errorP = false , errorF = false;
        int[] diasMes= {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if (null != request.getParameter("Enviar")){
// LA COMPROBACIÓN DE ERRORES LA HACES EN DOS SITIOS DIFERENTES, ES DECIR REPITES CÓDIGO
            if ("".equals(request.getParameter("Nombre"))){
                errorN=true;
            }
            if ("".equals(request.getParameter("Usuario"))){
                errorU=true;
            }
            if ("".equals(request.getParameter("Contrasena"))){
                errorP=true;
            }
           if (Integer.parseInt(request.getParameter("dia")) > diasMes[Integer.parseInt(request.getParameter("mes"))-1]){
               errorF=true;
           }    
            if (errorN==false && errorU==false && errorP==false && errorF==false){
                processRequest(request, response, correcto);
            }else{                
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Salida</title>");
                    out.println("<link rel=\"stylesheet\" type=\"text/css\" href='css/estilo.css' media=\"screen\" />");
                    out.println("<meta charset='UTF-8'>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div id='cabecera'>");
                    out.println("<h1>Errores en el registro</h1>");
                    out.println("<form action='registro' method='post'>");
                     Map<String,String[]> parametros = request.getParameterMap();
                        Set names = parametros.keySet();
                        Iterator it = names.iterator();
                        while (it.hasNext()) {
                            String nombre = (String) it.next();
                            if (!nombre.startsWith("Env")) {
                            out.println("<input type='hidden' name='" + nombre + "' value='" + request.getParameter(nombre) + "'></input>");
                            }
                           }
                    out.println("<input type='submit' name='Volver' value='Volver'></input>");
                    out.println("</form>");
                    out.println("</div>");
                    out.println("</body>");
                    out.println("</html>");     
                }
            }// if enviar 
            if (null != request.getParameter("Volver")){
                    if ("".equals(request.getParameter("Nombre"))){
                        errorN=true;
                    }
                    if ("".equals(request.getParameter("Usuario"))){
                        errorU=true;
                    }
                    if ("".equals(request.getParameter("Contrasena"))){
                        errorP=true;
                    }
                   if (Integer.parseInt(request.getParameter("dia")) > diasMes[Integer.parseInt(request.getParameter("mes"))-1]){
                       errorF=true;
                   } 
                 out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Salida</title>");
                    out.println("<link rel=\"stylesheet\" type=\"text/css\" href='css/estilo.css' media=\"screen\" />");
                    out.println("<meta charset='UTF-8'>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div id='errores'>");
                    if (errorN==true){
                        out.println("<h3>Errores en el Nombre</h3>");
                    }
                    if (errorU==true){
                        out.println("<h3>Errores en el Usuario</h3>");
                    }
                    if (errorP==true){
                        out.println("<h3>Errores en la Contraseña</h3>");
                    }
                    if (errorF==true){
                        out.println("<h3>Errores en la Fecha</h3>");
                    }                    
                    out.println("</div>"); 
                     out.println("<form action='registro' method='post'>");
                out.println("<fieldset>");
                 out.println("<legend>Información personal</legend>");
                 out.println("<label for='nombre'>*Nombre:&nbsp;&nbsp;<input type='text' name='Nombre' id='nombre' value='"+request.getParameter("Nombre")+"'></label>");
                 out.println("<br><br>");
                 out.println("<label for='apellido'>&nbsp;Apellidos:&nbsp;<input type='text' name='Apellido' id='apellido' value='"+request.getParameter("Apellido")+"'></label>");
                 out.println("<br>");
                 out.println("<p>Sexo: &nbsp;&nbsp;");
                     out.println("<label for='hombre'><input type='radio' name='Sexo' value='Hombre' id='hombre' ");
                             if("Hombre".equals(request.getParameter("Sexo")))
                                 out.print("checked='checked'");
                                 out.println(">Hombre</label>");
                     out.println("<br>");
                     out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                     out.println("<label for='mujer'><input type='radio' name='Sexo' value='Mujer' id='mujer'");
                       if("Mujer".equals(request.getParameter("Sexo")))
                                 out.print("checked='checked'");
                                 out.println(">Mujer</label>");
                 out.println("</p>");
                 out.println("<p>");
// MUCHISIMO CÓDIGO 
                     out.println("<label for='fecha'>Fecha de nacimiento: &nbsp;</label>");
                     out.println("<select name='dia' id='fecha'>");
                         out.println("<option value='1' ");
                         if("1".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">1</option>");
                         out.println("<option value='2' ");
                          if("2".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">2</option>");
                         out.println("<option value='3' ");
                          if("3".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">3</option>");
                         out.println("<option value='4' ");
                          if("4".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">4</option>");
                         out.println("<option value='5' ");
                          if("5".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">5</option>");
                         out.println("<option value='6' ");
                          if("6".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">6</option>");
                         out.println("<option value='7' ");
                          if("7".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">7</option>");
                         out.println("<option value='8' ");
                          if("8".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">8</option>");
                         out.println("<option value='9' ");
                          if("9".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">9</option>");
                         out.println("<option value='10' ");
                          if("10".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">10</option>");
                         out.println("<option value='11' ");
                          if("11".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">11</option>");
                         out.println("<option value='12' ");
                          if("12".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">12</option>");
                         out.println("<option value='13' ");
                          if("13".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">13</option>");
                         out.println("<option value='14' ");
                          if("14".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">14</option>");
                         out.println("<option value='15' ");
                          if("15".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">15</option>");
                         out.println("<option value='16' ");
                          if("16".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">16</option>");
                         out.println("<option value='17' ");
                          if("17".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">17</option>");
                         out.println("<option value='18' ");
                          if("18".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">18</option>");
                         out.println("<option value='19' ");
                          if("19".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">19</option>");
                         out.println("<option value='20' ");
                          if("20".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">20</option>");
                         out.println("<option value='21' ");
                          if("21".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">21</option>");
                         out.println("<option value='22' ");
                          if("22".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">22</option>");
                         out.println("<option value='23' ");
                          if("23".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">23</option>");
                         out.println("<option value='24' ");
                          if("24".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">24</option>");
                         out.println("<option value='25' ");
                          if("25".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">25</option>");
                         out.println("<option value='26' ");
                          if("26".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">26</option>");
                         out.println("<option value='27' ");
                          if("27".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">27</option>");
                         out.println("<option value='28' ");
                          if("28".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">28</option>");
                         out.println("<option value='29' ");
                          if("29".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">29</option>");
                         out.println("<option value='30' ");
                          if("30".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">30</option>");
                         out.println("<option value='31' ");
                          if("31".equals(request.getParameter("dia")))
                             out.print("selected='selected'"); 
                         out.println(">31</option>");
                     out.println("</select>&nbsp;/");
                     out.println("<select name='mes'>");               
                         out.println("<option value='1' ");
                          if("1".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">1</option>");
                         out.println("<option value='2' ");
                          if("2".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">2</option>");
                         out.println("<option value='3' ");
                          if("3".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">3</option>");
                         out.println("<option value='4' ");
                          if("4".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">4</option>");
                         out.println("<option value='5' ");
                          if("5".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">5</option>");
                         out.println("<option value='6' ");
                          if("6".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">6</option>");
                         out.println("<option value='7' ");
                          if("7".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">7</option>");
                         out.println("<option value='8' ");
                          if("8".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">8</option>");
                         out.println("<option value='9' ");
                          if("9".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">9</option>");
                         out.println("<option value='10' ");
                          if("10".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">10</option>");
                         out.println("<option value='11' ");
                          if("11".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">11</option>");
                         out.println("<option value='12' ");
                          if("12".equals(request.getParameter("mes")))
                             out.print("selected='selected'"); 
                         out.println(">12</option>");
                    
                     out.println("</select>&nbsp;/");
                     out.println("<select name='ano'>");
// ESTO LO PODIAS HABER PUESTO EN LOS DIAS Y LOS MESES
                       for (int i=1950; i<=2017; i++) {
			out.println("<option value='"+i+"'");
			if(i==Integer.parseInt(request.getParameter("ano")))                            
			out.println("selected='selected'");
			out.println(">"+i+"</option>");
                        }

                     out.println("</select>");
                 out.println("</p>");
             out.println("</fieldset>");
             out.println("<fieldset>");
                 out.println("<legend>Datos de acceso</legend>");
                 out.println("<p><label for='user'>*Usuario: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='Usuario' id='user' value='"+request.getParameter("Usuario")+"'></label>");
                     out.println("<br><br>");
                     out.println("<label for='pass'>*Contraseña: &nbsp;<input type='text' name='Contrasena' id='pass' value='"+request.getParameter("Contrasena")+"'></label>");
                 out.println("</p>");
             out.println("</fieldset>");
             out.println("<fieldset>");
                 out.println("<legend>Información general</legend>");
                 out.println("<p>Preferencias &nbsp;&nbsp;");
                     out.println("<label for='deporte'><input type='checkbox' name='Preferencias' value='Deporte' id='deporte' ");
                     if (request.getParameterValues("Preferencias") != null)
                     for (String s : request.getParameterValues("Preferencias"))          
                     if (s.equals("Deporte")){
                                    out.print("checked='checked'");
                                }
                                out.println(">Deporte</label>");
                     out.println("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                     out.println("<label for='lectura'><input type='checkbox' name='Preferencias' value='Lectura' id='lectura'");
                     if (request.getParameterValues("Preferencias") != null)
                     for (String s : request.getParameterValues("Preferencias"))          
                     if (s.equals("Lectura")){
                                       out.print("checked='checked'");
                                   }
                                   out.println(">Lectura</label>");
                     out.println("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                     out.println("<label for='cine'><input type='checkbox' name='Preferencias' value='Cine' id='cine'");
                     if (request.getParameterValues("Preferencias") != null)
                     for (String s : request.getParameterValues("Preferencias"))          
                     if (s.equals("Cine")){
                                       out.print("checked='checked'");
                                   }
                                   out.println(">Cine</label>");
                     out.println("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                     out.println("<label for='viaje'><input type='checkbox' name='Preferencias' value='Viaje' id='viaje'");
                     if (request.getParameterValues("Preferencias") != null)
                     for (String s : request.getParameterValues("Preferencias"))          
                     if (s.equals("Viaje")){
                                       out.print("checked='checked'");
                                   }
                                   out.println(">Viaje</label>");
                 out.println("</p>");
             out.println("</fieldset>");
             out.println("<input type='submit' name='Enviar' value='Enviar'>");
             out.println("<a href='html/registro.html'><input type='button' name='limpiar' value='Limpiar'></a>");
         out.println("</form>");
                    out.println("</body>");
                    out.println("</html>");            
            }// if volver
        }// fin dopost    
}//fin clase