<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/homeStyle.css">
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

        <title>
              B-Aware
        </title>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEAZHA3Oz9Fl_O36L-Ly0Ohy6M8NB8MZc&callback=initMap"></script> 
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/animacion_home.js"></script>
        <script src="js/k.js"></script>
    </head>
    <body onpaste="return false" ondrop="return false" onload="initMap()">
        <%
            HttpSession sesion = request.getSession();
            if ((sesion.getAttribute("nombre") != null) && (Integer.parseInt(String.valueOf(sesion.getAttribute("tipousuario"))) == 2))
            {
        %>
        <div id="map"></div>
        <div id="real-container">
            <div id="logo">
                B-Aware
            </div>
            <div id="panel-lateral">
                <div>
                    <span class="icon-user icon"></span>
                </div>
                <div>
                    <span class="icon-notification icon"></span>
                </div>
                <div>
                    <span class="icon-map icon"></span>
                </div>
                <div>
                    <span class="icon-configuration icon"></span>
                </div>
            </div>
            <a href="index.jsp?cerrar=true">
                <div id="log-out">
                    <span class="icon-exit"></span>
                </div>
            </a>
            <div id="bottom-panel">
                <span class="icon-info icon"></span>
            </div>
            <!--<div id="create-pin">
                <a href="crearpin.jsp">
                    <span class="icon-pushpin"></span>
                </a>
            </div>-->
        </div>
        <div id="nomenclatura">
            <iframe id="frame-nomenclatura" src="nomenclatura.jsp" frameborder="0"></iframe>
        </div>
        <div id="panel" class="row">
            <iframe id="frame-panel" class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 col-offset-sm-3 col-offset-md-4 col-offset-lg-4dot5 col-offset-xl-4dot5" src="" frameborder="0"></iframe>
        </div>
        <%
            }
            else
            {
        %>
            <script>
                location.replace('index.jsp');
                alert("Tipo de usuario <%=sesion.getAttribute("tipousuario")%> no permitido en esta pagina");
            </script>
        <%
            }
        %>
    </body>
</html>