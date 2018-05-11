<%@page import="identidad.Usuario"%>
<%@page import="bd.Consultar"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            Iniciando sesion...
        </title>
    </head>
    <body>
        <%
            Usuario usuario = new Usuario();
            Consultar consultar = new Consultar();

            String nombre, contraseña;
            nombre = request.getParameter("nombre");
            contraseña = request.getParameter("contrasena");

            usuario = consultar.usuario(nombre, contraseña);
            //        usuario.setUsuario(2,nombre, contraseña,"gustavopdzz0@gmail.com",1);
            if (usuario == null)
            {
                response.sendRedirect("error-usuario_inexistente.jsp");
            }
            else
            {
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("id", String.valueOf(usuario.getId()));
                sesion.setAttribute("nombre", usuario.getNombre());
                sesion.setAttribute("correo", usuario.getCorreo());
                sesion.setAttribute("tipousuario", String.valueOf(usuario.getTipoUsuario()));

                response.sendRedirect("0"+String.valueOf(sesion.getAttribute("tipousuario"))+"_home.jsp");
            }
        %>
    </body>
</html>
