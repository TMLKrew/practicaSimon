/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;
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
@WebServlet(name = "FormularioComplejo", urlPatterns = {"/FormularioComplejo"})
public class FormularioComplejo extends HttpServlet {

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
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href='css/estilo.css' media=\"screen\" />");
        out.println("<meta charset='UTF-8'>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id='cabecera'>");
        out.println("<h2>Datos introducidos en el formulario</h2>");
        if (!correcto) {
            out.println("<p>No se han introducido datos</p>");
        } else {
            Map<String,String[]> parametros = request.getParameterMap();
            Set names = parametros.keySet();
            Iterator it = names.iterator();
            while (it.hasNext()) {
                String nombre = (String) it.next();
                if (!nombre.startsWith("env")) {
                      out.print(nombre + " - <strong> ");
                          for (String valor : parametros.get(nombre)) {
                              out.print(" "+valor);
                          }
                        out.println("</strong><br/>");
                }
              
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
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean correcto = true;
        processRequest(request, response, correcto);
    }

}