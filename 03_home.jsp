<%@page import="java.util.List"%>
<%@page import="identidad.Pin"%>
<%@page import="bd.Consultar"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/homeStyle.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

        <title>
            B-Aware
        </title>

        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEAZHA3Oz9Fl_O36L-Ly0Ohy6M8NB8MZc&callback=initMap"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/animacion_home.js"></script>
        
    </head>
    <body onpaste="return false" ondrop="return false">
        <div id="map"></div>
        <div id="real-container">
            <div id="logo">
                B-Aware
            </div>
            <a href="index.jsp?cerrar=true">
                <div id="log-out">
                    <span class="icon-back iconLogOut"></span>
                    <input class="logOut" type="button">
                </div>
            </a>
            <div id="bottom-panel">
                    <span class="icon-info icon"></span>
            </div>
        </div>
        <div id="nomenclatura">
            <iframe id="frame-nomenclatura" src="nomenclatura.jsp" frameborder="0"></iframe>
        </div>
        
        <script>
            
   <% double lat= 19.432156;
      double lon=-99.147093;
      int i=0;
      Consultar con= new Consultar();
      List<Pin> lista= con.pines();
   %> 
   var minZoomLevel = 13;    
   var markers = [];
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
      zoom: minZoomLevel,
     <% out.println("center: new google.maps.LatLng("+lat+","+lon+"),");%>
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false
     });  
     
     //inicio
       <%
         for(Pin pin:lista){
             Pin p= new Pin();
             int idp=p.getId();
             int idcate=p.getCat();
             double lt=p.getLat();
             double ln=p.getLon();
             String des=p.getDes();
       %>      
               var infowincontent=document.createElement('div');
       <%      
            
             out.println("var strong= document.createElement('strong');");
             out.println("strong.textContent="+idp);
             out.println("infowincontent.appendChild(strong);");
             out.println("infowincontent.appendChild(document.createElement('br'));");
             out.println("var text=document.createElement('text');");
             out.println("infowincontent.appendChild(text);");
             out.println("strong.textContent="+des);
             
    %>         
         var marker = new google.maps.Marker({
                map: map,
                <% out.println("position: new google.maps.LatLng("+lt+","+ln+")");%>
        });     
             
           marker.addListener('click', function() {
                infowindow.setContent(infowincontent);
                infowindow.open(map, marker);
              });
   <%      
         }
     
     %>
     //fin
     
    var cooal = [
          {lat: 19.403642, lng: -99.171019},
          {lat: 19.399999, lng: -99.170418},
          {lat: 19.403925, lng: -99.156685},
          {lat: 19.403197, lng: -99.130592},
          {lat: 19.404522, lng: -99.125791},
          {lat: 19.413781, lng: -99.128333},
          {lat: 19.420641, lng: -99.127239},
          {lat: 19.423313, lng: -99.125952},
          {lat: 19.443144, lng: -99.122975},
          {lat: 19.447635, lng: -99.125909},
          {lat: 19.458116, lng: -99.123506},
          {lat: 19.459775, lng: -99.122304},
          {lat: 19.461596, lng: -99.127754},
          {lat: 19.465075, lng: -99.133548},
          {lat: 19.465780, lng: -99.141915},
          {lat: 19.463150, lng: -99.150627},
          {lat: 19.464081, lng: -99.158695},
          {lat: 19.460844, lng: -99.161313},
          {lat: 19.459185, lng: -99.162987},
          {lat: 19.449967, lng: -99.164273},
          {lat: 19.443654, lng: -99.165775},
          {lat: 19.424259, lng: -99.178033},
          //{lat: 19.423783, lng: -99.162987},
          {lat: 19.423176, lng: -99.175088},
          {lat: 19.407998, lng: -99.184357},
          {lat: 19.403642, lng: -99.171019}
        ];
     
        var alc = new google.maps.Polyline({
          path: cooal,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 5
        });
        

        alc.setMap(map);
        //19.459411, -99.163033

        var tCoords = [
            {lat: 19.423176, lng: -99.175088},
            {lat: 19.407998, lng: -99.184357},
            {lat: 19.403642, lng: -99.171019}
        ];

       
        var Triangle = new google.maps.Polygon({
          paths: tCoords,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
        });
        
        var t = [
            {lat: 19.403925, lng: -99.156685},
            {lat: 19.403925, lng: -99.171066},
            {lat: 19.399999, lng: -99.170418}
        ];

       
        var tt = new google.maps.Polygon({
          paths: t,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt.setMap(map);
        var t1 = [
            {lat: 19.403642, lng: -99.171019},
            {lat: 19.403925, lng: -99.171065},
            {lat: 19.403925, lng: -99.171078}
        ];

       
        var tt1 = new google.maps.Polygon({
          paths: t1,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt1.setMap(map);
        
        var t3 = [
            {lat: 19.423176, lng: -99.175088},
            {lat: 19.403925, lng: -99.171078},
            {lat: 19.423176, lng: -99.171078}
        ];

       
        var tt3 = new google.maps.Polygon({
          paths: t3,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt3.setMap(map);
        var t2 = [
            {lat: 19.403925, lng: -99.156685},
            {lat: 19.403197, lng: -99.130592},
            {lat: 19.403925, lng: -99.127953}
        ];

       
        var tt2 = new google.maps.Polygon({
          paths: t2,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt2.setMap(map);
        var t4 = [
            {lat: 19.403925, lng: -99.128333},
            {lat: 19.404522, lng: -99.125791},
            {lat: 19.413781, lng: -99.128333}
        ];

       
        var tt4 = new google.maps.Polygon({
          paths: t4,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt4.setMap(map);
        var t5 = [
            {lat: 19.420641, lng: -99.127239},
            {lat: 19.420641, lng: -99.128333},
            {lat: 19.413781, lng: -99.128333}
        ];

       
        var tt5 = new google.maps.Polygon({
          paths: t5,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt5.setMap(map);
        var t6 = [
            {lat: 19.420641, lng: -99.127239},
            {lat: 19.449673, lng: -99.127239},
            {lat: 19.443144, lng: -99.122975}
        ];

       
        var tt6 = new google.maps.Polygon({
          paths: t6,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt6.setMap(map);
        var t7 = [
          {lat: 19.420641, lng: -99.127239},
          {lat: 19.423313, lng: -99.125952},
          {lat: 19.443144, lng: -99.122975}
        ];

       
        var tt7 = new google.maps.Polygon({
          paths: t7,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt7.setMap(map);
        var t8 = [
          {lat: 19.423176, lng: -99.175088},
          {lat: 19.424259, lng: -99.178033},
          {lat: 19.423176, lng: -99.171078}
        ];

       
        var tt8 = new google.maps.Polygon({
          paths: t8,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt8.setMap(map);
     var t9 = [
          {lat: 19.435265, lng: -99.171078},
          {lat: 19.424259, lng: -99.178033},
          {lat: 19.423176, lng: -99.171078}
        ];

       
        var tt9 = new google.maps.Polygon({
          paths: t9,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt9.setMap(map);
        var t10 = [
          {lat: 19.435265, lng: -99.171078},
          {lat: 19.435265, lng: -99.162987},
          {lat: 19.443654, lng: -99.165775}
        ];

       
        var tt10 = new google.maps.Polygon({
          paths: t10,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
     });
        tt10.setMap(map);
        var t11 = [
          {lat: 19.449967, lng: -99.164273},
          {lat: 19.435265, lng: -99.162987},
          {lat: 19.443654, lng: -99.165775}
        ];

       
        var tt11 = new google.maps.Polygon({
          paths: t11,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt11.setMap(map);
       var t12 = [
          {lat: 19.459185, lng: -99.162987},
          {lat: 19.435265, lng: -99.162987},
          {lat: 19.449967, lng: -99.164273}
        ];

       
        var tt12 = new google.maps.Polygon({
          paths: t12,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt12.setMap(map);
        var t13 = [
            {lat: 19.461424, lng: -99.127239},
            {lat: 19.449673, lng: -99.127239},
            {lat: 19.447635, lng: -99.125909}
        ];

       
        var tt13= new google.maps.Polygon({
          paths: t13,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt13.setMap(map);
        var t14 = [
            {lat: 19.461424, lng: -99.127239},
            {lat: 19.458116, lng: -99.123506},
            {lat: 19.459775, lng: -99.122304}
        ];

       
        var tt14= new google.maps.Polygon({
          paths: t14,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt14.setMap(map);
       var t15 = [
            {lat: 19.461424, lng: -99.127239},
            {lat: 19.458116, lng: -99.123506},
            {lat: 19.447635, lng: -99.125909}
        ];

       
        var tt15= new google.maps.Polygon({
          paths: t15,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt15.setMap(map);
       var t16 = [
            {lat: 19.459185, lng: -99.162987},
            {lat: 19.459185, lng: -99.160844},
            {lat: 19.461424, lng: -99.160844}
            
        ];

       
        var tt16= new google.maps.Polygon({
          paths: t16,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt16.setMap(map);
        var t17 = [
            {lat: 19.461424, lng: -99.160844},
            {lat: 19.461424, lng: -99.159449},
            {lat: 19.463150, lng: -99.159449}
            
        ];
        
     var tt17= new google.maps.Polygon({
          paths: t17,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt17.setMap(map);
        
    var t18 = [
            {lat: 19.461424, lng: -99.127239},
            {lat: 19.461424, lng: -99.130341},
            {lat: 19.463150, lng: -99.130341}
            
        ];
        
     var tt18= new google.maps.Polygon({
          paths: t18,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt18.setMap(map);
        
     var t19 = [
            {lat: 19.463150, lng: -99.150627},
            {lat: 19.464081, lng: -99.158695},
            {lat: 19.463150, lng: -99.159449}
            
        ];
        
     var tt19= new google.maps.Polygon({
          paths: t19,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt19.setMap(map);
     
     var t20 = [
            {lat: 19.465780, lng: -99.141915},
            {lat: 19.463150, lng: -99.150627},
            {lat: 19.463150, lng: -99.130341}
            
        ];
        
     var tt20= new google.maps.Polygon({
          paths: t20,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt20.setMap(map);
        
        var t21 = [
            {lat: 19.463150, lng: -99.130341},
            {lat: 19.465780, lng: -99.141915},
            {lat: 19.465075, lng: -99.133548}
            
        ];
        
     var tt21= new google.maps.Polygon({
          paths: t21,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35
          
     });
        tt21.setMap(map);
        
         var rec = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.459185, 
            south: 19.403925,
            east: -99.128333,
            west: -99.162987
          }
        });
        var rec1 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.435265, 
            south: 19.403925, 
            east: -99.162987,
            west: -99.171078
          }
        });
        var rec2 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.461424, 
            south: 19.420641, 
            east: -99.127239,
            west: -99.128333
          }
        });
        var rec3 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.461424, 
            south: 19.459185, 
            east: -99.128333,
            west: -99.160844
          }
        });
        var rec4 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 0,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.463150, 
            south: 19.461424, 
            east: -99.130341,
            west: -99.159449
          }
        });
        
        Triangle.setMap(map);
        Triangle.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
          tt.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt1.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt2.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt3.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt4.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt5.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt6.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt7.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt8.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt9.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt10.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt11.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt12.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt13.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt14.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt15.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt16.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt17.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt18.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt19.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt20.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         tt21.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         rec.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         rec1.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         rec2.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         rec3.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         rec4.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         
    var strictBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(19.401801, -99.184054), 
    new google.maps.LatLng(19.464957, -99.122494)
    );
    
    /* map.addListener('mousemove', function(e) {
        document.getElementById("noc").value=(e.latLng);              
         });*/
    
            
            
   google.maps.event.addListener(map, 'dragend', function() {
     if (strictBounds.contains(map.getCenter())) return;
 var c = map.getCenter(),
         x = c.lng(),
         y = c.lat(),
         maxX = strictBounds.getNorthEast().lng(),
         maxY = strictBounds.getNorthEast().lat(),
         minX = strictBounds.getSouthWest().lng(),
         minY = strictBounds.getSouthWest().lat();

     if (x < minX) x = minX;
     if (x > maxX) x = maxX;
     if (y < minY) y = minY;
     if (y > maxY) y = maxY;

    
    map.setCenter({lat:19.432156 , lng: -99.147093});       
  
    });

  
   google.maps.event.addListener(map, 'zoom_changed', function() {
     if (map.getZoom() < minZoomLevel) map.setZoom(minZoomLevel);
   });
   
} 
      
      
       
      function placeMarkerAndPanTo(latLng, map) {
          
        var marker = new google.maps.Marker({
          position: latLng,
          icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
          map: map
          });
          var contv='<div id="div1">'+
                '<h1 align="center">¿Hola usuario que sucedió?</h1>'+
                '<br>'+
                '<form method="post" action="pr.jsp" name="datos">'+
                '<select id="cate" name="cate">'+
                '<option value="Robo(carterismo)">Robo(carterismo)</option>'+
                '<option value="Violación">Violación</option>'+
                '<option value="Asalto">Asalto</option>'+
                '<option value="Robo">Robo</option>'+
                '<option value="Homicidio">Homicidio</option>'+
                '<option value="Reunión maliciosa">Reunion maliciosa</option>'+
                '<option value="Acoso">Acoso</option>'+
                '</select>'+
                '<br><br>'+
                '<label>Coordenadas:</label><input type="text" id="coords" name="coords" value="'+latLng+'" readonly size="50">'+
                '<br><br>'+
                '<textarea id="descrip" name="descrip" rows="6" cols="50"></textarea>'+
                '<br>'+
                '<label>Zona:</label><input type="text" name="zona" id="zona" value="2" readonly>'+
                '<br>'+
                '<input type="date" name="fecha" id="fecha">'+
                '<br>'+
                '<input type="button" value="Envíar" onclick="mandar()">'+
                '</form>'+
                '</div>';
          var infowindow = new google.maps.InfoWindow({
          content: contv,
          map: map
        });
          
        //map.panTo(latLng);
        infowindow.open(map, marker);
        //alert(latLng);
        
      }
      
      function mandar(){
          var cat="";
          cat=$("#cate").val();
          var date="";
         date=$("#fecha").val();
          var des;
          des=$("#descrip").val();
          document.datos.submit()
      }
        </script>
        
        
    </body>
</html>