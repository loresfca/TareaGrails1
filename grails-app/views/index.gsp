<!doctype html>
<html>
<head>
    <meta name="layout" content="mymain"/>
    <title>Grails tarea 1</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body class="main">
    <div class="espacio"></div>
    <div class="row">
        <div class="col-md-1"></div>
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
        
        <g:link controller="${c.logicalPropertyName}"><div class="col-md-2 boton_menu1">
            <g:if test="${c.fullName.substring(13)=='AlumnoController'}"><asset:image src="student.png" class="img1"/></g:if>
            <g:if test="${c.fullName.substring(13)=='CarreraController'}"><asset:image src="diploma.png" class="img1"/></g:if>
            <g:if test="${c.fullName.substring(13)=='CampusController'}"><asset:image src="school.png"class="img1"/></g:if>
            <hr>
            <label>${c.fullName.substring(13)}</label></div></g:link>
        <div class="col-md-2"></div>
    </g:each>
    </div>
</body>
</html>



