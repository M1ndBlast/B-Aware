<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/log-sign.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
        <title>
            Error en Modificar Contraseña
        </title>
        <script>
            function usuarrioInexistente()
                {
                    alert("La contraseña antigua es incorrecta");
                    location.replace("02_configuracion.jsp");
                }
        </script>
    </head>
    <body onpaste="return false" ondrop="return false" onload="usuarrioInexistente()">
        <%
            HttpSession sesion = request.getSession();
        %>
    </body>
</html>
