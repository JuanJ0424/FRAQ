<%-- 
    Document   : new_user
    Created on : 12/11/2017, 03:09:00 PM
    Author     : Ximena
--%>

<%@taglib  uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class='no-js' lang='es'>
    <head>
        <meta charset='utf-8' />
        <meta http-equiv='x-ua-compatible' content='ie=edge'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <title>FRAQ | Registrar Nuevo Usuario</title>
        <link rel='stylesheet' href='assets/css/app.css'>
        <script src='assets/js/app.js'></script>
    </head>
    <body>
        <br />
        <header class='sticky-shrinknav-header'>
            <img class="sticky-shrinknav-header-title logo" src='assets/img/logos/fraq.png'>
            <ul class='menu align-center sticky-shrinknav-menu'>
                <li><a href='<s:url action="teacher-panel"/>'>Inicio</a></li>
                <li><a href='#'>Acerca de </a></li>
                <li><a href='<s:url action="list_user"/>'Panel de administración</a></li>
                <li><a href='<s:url action="logout"/>'>Cerrar sesión</a></li>
            </ul>
        </header>
        <div class='row'>
            <div class='large-12 columns text-center'>
                <h1>Registrar Nuevo Ejercicio</h1>
            </div>
        </div>
        <s:form action="build-fraction-page" method="get">
            <s:if test="hasActionErrors()">
                <div class='row'>
                    <div class='medium-12 columns callout alert' data-closable='slide-out-right'>
                        <button class='close-button' aria-label='Dismiss alert' type='button' style='position:static;' data-close>
                            <span aria-hidden='true'>&times;</span>
                        </button>
                        <s:actionerror/>
                    </div>
                </div>
            </s:if>
            <div class='row'>
                <div class='medium-6 medium-offset-3 columns primary'>
                    <fieldset class='fieldset'>
                        <legend>Nuevo Ejercicio</legend>
                        <div class='row'>
                            <div class='medium-12 columns'>
                                <label> Nombre del ejercicio
                                    <s:textfield name="name" key="Nombre" cssClass='input-group-field'/> 
                                </label>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='medium-12 columns'>
                                <label>
                                    <br />
                                    <s:submit value="Registrar nuevo ejercicio" cssClass='button expanded'/>
                                </label>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </s:form>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    </body>
</html>
