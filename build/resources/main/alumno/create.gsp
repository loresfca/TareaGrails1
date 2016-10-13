<%@ page import="mx.itesm.web.Carrera" %>
<%@ page import="mx.itesm.web.Campus" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-alumno" class="content scaffold-create" role="main">
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
                  <label> nombre</label>  <g:textField name="nombre" id="nombre" value="${alumno.nombre}" class="form-control"/>
                   <label> Matricula</label>  <g:textField name= "matricula" id="matricula" value="${alumno.matricula}" class="form-control"/>
                    <label> Apellido</label>  <g:textField name="apellido" id="apellido" value="${alumno.apellido}" class="form-control"/>
                   <label>Carrera</label> <g:select name="carrera" from ="${Carrera.list()}"  optionKey="id" optionValue="nombre"/>
                   <label>Campus</label> <g:select name="campus" from ="${Campus.list()}"  optionKey="id" optionValue="nombre"/>
                </fieldset>

                <fieldset class="buttons">
                   <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
