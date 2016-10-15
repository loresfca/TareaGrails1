<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mymain" />
        <g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        
        <a href="#list-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav navbar barra2" role="navigation">
            <div class="navbar-header headerbarra">
                <label class="navbar-brand">Alumnos</label></div>
            <ul class="nav navbar-nav"> 
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div class="container">
        <div id="list-alumno" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form action="index" method="GET">
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-2"> <label for="query">Buscar matrícula:</label></div>
                        <div class="col-sm-6"> <g:textField name="query" value="${params.query}" class="form-control" placeholder="Busqueda"/></div>
                        <div class="col-sm-2"><button type="submit" class="btn btn-primary">Buscar</button></div>
                    </div>
                </div>    
            </g:form>
            <table class="table table-condensed">
             <thead>
                <tr>
                     <th>ID</th>
                     <th>Matrícula</th>
                     <th>Nombre</th>
                     <th>Apellido</th>
                     <th>Carrera</th>
                     <th>Campus</th>
                </tr>
                </thead>
                <g:each var="alumno" in="${alumnoList}">
                <tr>
                <td>${alumno.id}</td>
                <td>${alumno.nombre}</td>
                <td>${alumno.apellido}</td>
                <td>${alumno.carrera.nombre} </td>
                  <td>${alumno.matricula} </td>
                    <td>${alumno.campus.nombre} </td>
               
                </tr>
                </g:each>

            </table>
        </div>
        </div>
    </body>
</html>