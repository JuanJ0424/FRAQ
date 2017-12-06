<%-- 
    Document   : login
    Created on : 12/11/2017, 11:00:40 AM
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
        <title>FRAQ | Iniciar sesión</title>
        <link rel='stylesheet' href='assets/css/app.css'>
    </head>
    <body>
        <br/>
        <header class='sticky-shrinknav-header'>
            <img class="sticky-shrinknav-header-title logo" src='assets/img/logos/omic.png'>
            <ul class='menu align-center sticky-shrinknav-menu'>
                <li><a href='#'>Inicio</a></li>
                <li><a href='#'>Acerca de </a></li>
                <li><a href='#'>Iniciar sesión</a></li>
            </ul>
        </header>
        <div class='row'>
            <div class='large-12 columns text-center'>
                <h1>Inicia Sesión en FRAQ</h1>
            </div>
        </div>
        <br />
        <div class='row'>
            <div class='medium-6 medium-offset-3'>
                <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css' rel='stylesheet'>
                <s:form action="login" cssClass="" method="post">
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
                    <div class='form-icons' >
                    <div class='input-group'>
                        <span class='input-group-label'>
                            <i class='fa fa-user'></i>
                        </span>
                        <s:textfield name="username" cssClass='input-group-field' placeholder='Nombre de usuario'/>
                    </div>
                    <div class='input-group'>
                        <span class='input-group-label'>
                            <i class='fa fa-key'></i>
                        </span>
                        <s:password name="password" cssClass='input-group-field' placeholder='Contraseña'/>
                        </div>
                    </div>
                    <s:submit value="Iniciar Sesión" cssClass='button expanded'/>
                </s:form>
                <br />
            </div>
        </div>
        <script src="assets/js/app.js"></script>
        <br/>
        <br/>
        <br/>
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
