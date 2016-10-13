<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-alumno" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form action="index" method="GET">
                <div class="form-group">
                <label for="query">Search:</label>
                <g:textField name="query" value="${params.query}" class="form-control" placeholder="Busqueda"/>
                </div>
                <button type="submit" class="btn btn-primary">Buscar</button>
            </g:form>
            <table class="table table-striped table-condensed table-bordered">
             <thead class="thead-inverse">
                <tr>
                     <th>ID</th>
                     <th>Nombre</th>
                     <th>Apellido</th>
                     <th>Carrera</th>
                      <th>Matriculo</th>
                </tr>
                </thead>
                <g:each var="alumno" in="${alumnoList}">
                <tr>
                <td>${alumno.id}</td>
                <td>${alumno.nombre}</td>
                <td>${alumno.apellido}</td>
                <td>${alumno.carrera} </td>
                  <td>${alumno.matricula} </td>
               
                </tr>
                </g:each>

            </table>

            <div class="pagination">
                <g:paginate total="${alumnoCount ?: 0}" />
            </div>
        </div>
    </body>
</html>