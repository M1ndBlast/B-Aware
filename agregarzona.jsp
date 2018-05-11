<%-- 
    Document   : agregarzona
    Created on : 8/05/2018, 05:19:32 PM
    Author     : Alumno
--%>

<%@page import="bd.Agregar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <%
           
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("nombre") != null && sesion.getAttribute("tipousuario") != "2")
        {
            
            String idusu = (String) (sesion.getAttribute("id"));
            int idusuario= Integer.parseInt(idusu);
                //array = consultar.zonas()
             int zona=Integer.parseInt(request.getParameter("zona"));
             Agregar ag= new Agregar();
             ag.zona(zona, idusuario);
            response.sendRedirect("02_home.jsp");
        }   
        
        else{
           response.sendRedirect("02_home.jsp");
        }
    %>
