<%-- 
    Document   : pr
    Created on : 7/05/2018, 11:27:03 PM
    Author     : usuario1
--%>

<%@page import="bd.Agregar"%>
<%@page import="identidad.Pin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Agregando pin...</h1>
        <%
           String categoria="";
           String coords="";
           String fecha="";
           int zona=0;
           Pin pin= new Pin();
           Agregar ag= new Agregar();
           
           String descripcion="";
           int idcat=0;
           categoria= request.getParameter("cate");
           coords=request.getParameter("coords");
           descripcion= request.getParameter("descrip");
           zona=Integer.parseInt(request.getParameter("zona"));
           fecha=request.getParameter("fecha");
           String sCadena = coords.substring(coords.indexOf("(") + 1, coords.indexOf(")"));
           
           out.println(categoria);
           String cat= "Asalto";
           out.println(cat);
            String[] s =  sCadena.split(",");
            double latitude = Double.parseDouble(s[0]);
            double longitude = Double.parseDouble(s[1]);
           
            pin.setDes(descripcion);
            pin.setFecha(fecha);
            pin.setLat(latitude);
            pin.setLon(longitude);
            pin.setZona(zona);
            pin.setIdusu(2);
            //pin.setCat(3);
            
            //out.println("<p>"+pin.getCat()+"</p>");
            //pin.setCat(9);
            //out.println("<p>"+pin.getCat()+"</p>");
            ag.pin(pin);
            if(categoria==cat){
                out.println("1");
                pin.setCat(3);
                out.println("2");
                out.println("<p>"+pin.getCat()+"</p>");
                
            }
           
               
           response.sendRedirect("03_home.jsp");
        %>
    </body>
</html>
