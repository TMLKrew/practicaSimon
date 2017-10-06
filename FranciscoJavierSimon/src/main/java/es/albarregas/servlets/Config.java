/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Simon
 */
@WebServlet(name = "Config", urlPatterns = {"/config"}, initParams = {
    @WebInitParam(name = "primero", value = "Hola")
    , @WebInitParam(name = "segundo", value = "Adios")})
public class Config extends HttpServlet {
    Map <String,String> parametros = new HashMap<String,String>();
    /**
     *
     * @param config
     */
    @Override
    public void init(ServletConfig config){
        Enumeration <String> params = config.getInitParameterNames();
        while (params.hasMoreElements()) {
                String nombre = params.nextElement();
                String valor = config.getInitParameter(nombre);
                System.out.println("Nombre parametro "+nombre+ " con valor "+valor);
                parametros.put(nombre , valor);
        }     
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Salida</title>");
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href='css/estilo.css' media=\"screen\" />");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id='cabecera'>");
        out.println("<h2>Configurando un Servlet</h2>");         
        Set s = parametros.keySet();
        Iterator it = s.iterator();
                while (it.hasNext()) {
                String nombre = (String) it.next();
                out.println(nombre + " - <strong>" + parametros.get(nombre) + "</strong><br/>");                
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
        processRequest(request, response);
                
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
