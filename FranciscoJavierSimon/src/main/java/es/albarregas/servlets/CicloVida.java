/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.servlets;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Simon
 */
@WebServlet(name = "CicloVida", urlPatterns = {"/CicloVida"})
public class CicloVida extends HttpServlet {

    public CicloVida() {
        super();
        System.out.println("Se ha creado el Servlet ");
    }
    @Override
    public void init(ServletConfig config) throws ServletException{
        System.out.println("Se ha inicializado el Servlet " + config.getServletName());
    }
      @Override
    public void destroy(){
        System.out.println("Se ha destruido el Servlet");
    }
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        System.out.println("Se accede al Servlet " + request.getServletPath());
        System.out.println("Se ha ulitizado el método " + request.getMethod());
    }
  
}
