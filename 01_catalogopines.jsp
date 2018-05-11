<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="identidad.Pin"%>
<%@page import="bd.Consultar"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/panelStyle.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

        <title>
            Cátalogo de usuarios
        </title>
    </head>
    <body onpaste="return false" ondrop="return false">
        <%
            HttpSession sesion = request.getSession();
            if ((sesion.getAttribute("nombre") != null) && (Integer.parseInt(String.valueOf(sesion.getAttribute("tipousuario"))) == 1))
            {
        %>
            <div class="real-container exp-all">
                <div class="row exp-all">
                    <div id="container" class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 col-offset-sm-3 col-offset-md-4 col-offset-lg-4dot5 col-offset-xl-4dot5">
                        <div id="nav">
                            <div id="options">
                                <div class="option">
                                    <a class="exp-all" href="01_catalogousuarios.jsp">
                                        <span class="icon-user"></span>
                                    </a>
                                </div>
                                <div class="option">
                                    <a class="exp-all" href="01_catalogopines.jsp">
                                        <span class="icon-location"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div id="line-separator"></div>
                        <div id="section">
                            <h1 id="titlePage">
                                Pines
                            </h1>
                            <div id="puntos-interes">
                                <%
                                    Consultar consultar = new Consultar();
                                    Pin pin = new Pin();
                                    ArrayList<Pin> array = new ArrayList();

                                    array = consultar.pines();

                                    Iterator<Pin> iterator = array.iterator();

                                    while(iterator.hasNext())
                                    {
                                        pin = iterator.next();
                                %>
                                <div class="punto-interes" style="vertical-align: middle">
                                    <div class="nombre-punto">
                                        #<%=pin.getId()%> <br>
                                        Tipo de Pin: <%=pin.getNomcat()%><br>
                                        Coordenadas <%=pin.getLat()%>,<%=pin.getLon()%>
                                    </div>
                                    <span class="icon-cross" style="vertical-align: middle"></span>
                                </div>
                                <div class="line-separator"></div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
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