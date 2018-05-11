<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("Nombre") != null && sesion.getAttribute("TipoUsuario") != "1")
    {
%>
<%
    }
    else
    {
%>
<script>location.replace('index.jsp');</script>
<%
    }
%>