<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/log-sign.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

        <script src="js/jquery-3.3.1.min.js"></script>

        <title>
            Registro a B-Aware
        </title>
    </head>
    <body onpaste="return false" ondrop="return false">
    <img id="background" src="image/background.jpg" alt="Error al cargar la imagen" ondrag="return false">
        <div class="real-container exp-all">
            <div class="row exp-all">
                <div id="container" class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 col-offset-sm-3 col-offset-md-4 col-offset-lg-4dot5 col-offset-xl-4dot5">
                    <div id="logo">
                        B-Aware
                    </div>
                    <div id="formulario">
                        <h1 id="titlePage">
                            <span class="icon-user-added icon"> </span>Registro
                        </h1>
                        <form id="form" method="post" action="RegistrarLogueado.jsp">
                            <div class="set-ic-in">
                                <span class="icon-user icon"> </span>
                                <input name="nombre" id="campoNickName" class="i-form input-signin" type="text" minlength="3" maxlength="15" placeholder="Usuario" required>
                            </div>
                            <div class="set-ic-in">
                                <span class="icon-password icon"> </span>
                                <input name="contrasena" id="campoPassword" class="i-form input-signin" type="password" minlength="5" maxlength="15" placeholder="Contraseña" required>
                            </div>
                            <div class="set-ic-in input-confirm">
                                <span class="icon-password icon"> </span>
                                <input id="campoCPassword" class="i-form input-signin" type="password" minlength="5" maxlength="15" placeholder="Confirmar Contraseña" required>
                            </div>
                            <div id="errorPassword" class="sinCoincidencias"></div>
                            <div class="set-ic-in">
                                <span class="icon-mail icon"> </span>
                                <input name="correo" id="campoEmail" class="i-form input-signin" type="email" minlength="5" maxlength="28" placeholder="Correo Electronico" required>
                            </div>
                            <div class="set-ic-in input-confirm">
                                <span class="icon-mail icon"> </span>
                                <input id="campoCEmail" class="i-form input-signin" type="email" minlength="5" maxlength="28" placeholder="Confirmar Correo" required>
                            </div>
                            <div id="errorEmail" class="sinCoincidencias"></div>

                            <input id="send-sign" type="submit" value="Registrarme">
                        </form>
                    </div>
                    <div id="alternativas">
                        <a class="exp-half" href="index.jsp" style="border-right: 1px solid black">
                            <div class="alternativas-btn exp-all">
                                <span class="icon-enter"> </span> Iniciar Sesion
                            </div>
                        </a>
                        <a class="exp-half" href="03_home.jsp">
                            <div class="alternativas-btn exp-all">
                                <span class="icon-map2 icon"> </span> Ver Mapa
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/validacion.js"></script>
    </body>
</html>
