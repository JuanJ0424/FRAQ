<%-- 
    Document   : modify_user
    Created on : 12/11/2017, 11:01:20 PM
    Author     : Ximena
--%>

<%@page import="entity.User"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        
<html class='no-js' lang='es'>
    <head>
        <meta charset='utf-8' /> 
       <meta http-equiv='x-ua-compatible' content='ie=edge'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <title>FRAQ | Modificar Usuario</title>
        <link rel='stylesheet' href='assets/css/app.css'>
        <script src='assets/js/app.js'></script>
    </head>
    <body>
        <br />
        <header class='sticky-shrinknav-header'>
            <img class="sticky-shrinknav-header-title logo" src='assets/img/logos/omic.png'>
            <ul class='menu align-center sticky-shrinknav-menu'>
                <li><a href='#'>Inicio</a></li>
                <li><a href='#'>Acerca de </a></li>
                <li><a href='list_user.action'>Panel de administración</a></li>
                <li><a href='logout.action'>Cerrar sesión</a></li>
            </ul>
        </header>
        <div class='row'>
            <div class='large-12 columns text-center'>
                <h1>Modificar Usuario</h1>
            </div>
        </div>
        <s:form action="modify_user" >
            <s:if test="hasActionErrors()">
                <div class='row'>
                    <div class='medium-12 columns callout alert' data-closable='slide-out-right'>
                        <button class='close-button' aria-label='Dismiss alert' type='button' style='position:static;' data-close>
                            <span aria-hidden='true'>&times;</span>
                        </button>
                        <s:actionerror />
                    </div>
                </div>
            </s:if>
            <div class='row'>
                <div class='medium-6 medium-offset-3 columns primary'>
                    <fieldset class='fieldset'>
                        <legend>Información del usuario</legend>
                        <div class='row'>
                            <div class='medium-6 columns'>     
                                <label> Nombre de usuario
                                    <s:textfield name="username" key="Usuario" cssClass='input-group-field' value="%{#parameters.username}" readonly="true"/> 
                                </label>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='medium-6 columns'>
                                <label> Contraseña
                                    <s:password name="password" key="Contraseña" cssClass='input-group-field' cssClass='input-group-field' value="%{#parameters.password}"/>  
                                </label>
                            </div>
                            <div class='medium-6 columns'>
                                <label> Confirmación de Contraseña
                                    <s:password name="password_confirmation" key="Confirmar contraseña" cssClass='input-group-field' value="%{#parameters.password}"/> 
                                </label>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='medium-12 columns'>
                                <label> Correo electrónico
                                    <s:textfield name="email" key="Correo electrónico" cssClass='input-group-field' value="%{#parameters.email}"/> 
                                </label>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='medium-6 columns'>
                                <label> Nombre(s)
                                    <s:textfield name="firstname" key="Nombre(s)" cssClass='input-group-field' value="%{#parameters.firstname}"/> 
                                </label>
                            </div>
                            <div class='medium-6 columns'>
                                <label>Apellidos
                                    <s:textfield name="lastname" key="Apellidos" cssClass='input-group-field' value="%{#parameters.lastname}"/> 
                                </label>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='medium-12 columns'>
                                <label>Tipo de usuario
                                    <s:select name ="type_wocode" key="Tipo de usuario"
                                        list="{'Administrador','Profesor(a)'}"
                                        headerKey="-1"
                                        headerValue="Seleccione..."
                                    />
                                </label>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='medium-12 columns'>
                                <label>
                                    <br />
                                    <s:submit value="Guardar Cambios" cssClass='button expanded'/>
                                </label>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </s:form>
        
    </body>
</html>
