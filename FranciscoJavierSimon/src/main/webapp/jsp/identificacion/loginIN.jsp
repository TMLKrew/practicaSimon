<%-- 
    Document   : loginIN
    Created on : 10-oct-2017, 17:43:20
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuario = "simon";
    String pass = "1234";
    if (request.getParameter("usuario").equals(usuario) && request.getParameter("pass").equals(pass)){
        java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("dd/MM/yyyy-HH:mm:ss");
        java.util.Date date = new java.util.Date();
        String f = dateFormat.format(date);
        Cookie fecha = new Cookie ("fecha", f);
        fecha.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(fecha);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", request.getParameter("usuario"));
        if (request.getParameter("recordar")!= null){
            Cookie cookieUser = new Cookie("user",request.getParameter("usuario"));
            response.addCookie(cookieUser);
        }
        response.sendRedirect("menu.jsp");
    }else{
        response.sendRedirect("login.jsp?error=2");
    }
    
%>
