<%@ page import="mx.itesm.web.Carrera" %>
<%@ page import="mx.itesm.web.Campus" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="mymain" />
        <g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
       <div class="nav navbar barra2" role="navigation">
            <div class="navbar-header headerbarra">
                <label class="navbar-brand">Nuevo Alumno</label></div>
            <ul class="nav navbar-nav">
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div class="container"><div id="create-alumno" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.alumno}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.alumno}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                  <label> Matricula</label>  <g:textField name= "matricula" id="matricula" value="${alumno.matricula}" class="form-control"/>
                  <label> Nombre</label>  <g:textField name="nombre" id="nombre" value="${alumno.nombre}" class="form-control"/>
                  
                    <label> Apellido</label>  <g:textField name="apellido" id="apellido" value="${alumno.apellido}" class="form-control"/>
                    <label> Dirección</label><g:textField name="direccion" id="direccion" value="${alumno.direccion}" class="form-control"/>
                     <label>Correo</label><g:textField name="correo" id="correo" value="${alumno.correo}" class="form-control"/>
                    <label>Carrera</label> <g:select class="sel" name="carrera" from ="${Carrera.list()}"  optionKey="id" optionValue="nombre"/>
                   <label>Campus</label> <g:select class="sel" name="campus" from ="${Campus.list()}"  optionKey="id" optionValue="nombre"/>
                    
                    
                </fieldset>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-2"><g:submitButton name="create" class="btn btn-primary"value="${message(code: 'default.button.create.label', default: 'Create')}"/></div>
                </div>
                   
            </g:form>
        </div>
</div>
    </body>
</html>
