<%@page import="identidad.Usuario"%>
<%@page import="bd.Agregar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrando Usuario</title>
    </head>
    <body>
        <%
            Usuario usuario = new Usuario();
            Agregar agregar = new Agregar();

            usuario.setNombre(request.getParameter("nombre"));
            usuario.setContraseña(request.getParameter("contrasena"));
            usuario.setCorreo(request.getParameter("correo"));

            System.out.println(usuario.getNombre()+request.getParameter("contrasena")+usuario.getCorreo());

            agregar.usuarioLogeado(usuario);
            response.sendRedirect("successful-registro_logeado.jsp");
        %>
    </body>
</html>
