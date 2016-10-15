<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mymain" />
        <g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
       <div class="nav navbar barra2" role="navigation">
            <div class="navbar-header headerbarra">
                <label class="navbar-brand">Alumnos</label></div>
            <ul class="nav navbar-nav"> 
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div class="container">
        <div id="show-alumno" class="content scaffold-show" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-1"><label>Matricula</label></div>
                <div class="col-md-4">${alumno.matricula}</div>
            </div>
            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-1"><label>Nombre</label></div>
                <div class="col-md-4">${alumno.nombre}</div>
            </div>

            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-1"><label>Apellido</label></div>
                <div class="col-md-4">${alumno.apellido}</div>
            </div>
            <div class="row">
                 <div class="col-md-5"></div>
                <div class="col-md-1"><label>Dirección</label></div>
                <div class="col-md-4">${alumno.direccion}</div>
            </div>
            <div class="row">
                 <div class="col-md-5"></div>
                <div class="col-md-1"><label>Correo</label></div>
                <div class="col-md-4">${alumno.correo}</div>
            </div>
             <div class="row">
                 <div class="col-md-5"></div>
                <div class="col-md-1"><label>Carrera</label></div>
                <div class="col-md-4">${alumno.carrera.nombre}</div>
            </div>
             <div class="row">
                 <div class="col-md-5"></div>
                <div class="col-md-1"><label>Campus</label></div>
                <div class="col-md-4">${alumno.campus.nombre}</div>
            </div>
            <g:form resource="${this.alumno}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.alumno}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
