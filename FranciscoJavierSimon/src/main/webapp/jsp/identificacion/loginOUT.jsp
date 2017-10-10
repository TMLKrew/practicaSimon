<%-- 
    Document   : loginOUT
    Created on : 10-oct-2017, 17:43:30
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    response.sendRedirect("login.jsp");
    %>
