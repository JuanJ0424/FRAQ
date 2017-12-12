
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <img class='sticky-shrinknav-header-title logo' src='assets/img/logos/fraq.png'>
            <ul class='menu align-center sticky-shrinknav-menu'>
                <li><a href='#'>Inicio</a></li>
                <li><a href='list_user.action'>Panel de administración</a></li>
                <li><a href='logout.action'>Cerrar sesión</a></li>
            </ul>
        </header>
        
        <div class='row'>
            <div class='large-12 columns text-center'>
                <h1>Panel de administración</h1>
            </div>
        </div>
        
        
        <div class='row'>
            <div class='medium-3 primary callout text-center'>
                <a href="<s:url action="new_user"/>" >Nuevo usuario</a>
            </div>
        </div>
        
        <br />
        <br />
        
        <div class='row'>
            <div class='medium-10 medium-offset-1'>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre de usuario</th>
                            <th>Nombre(s)</th>
                            <th>Apellidos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="lista">
                            
                            <s:url action="delete_user.action" var="urldelete">
                                <s:param name="idUser">
                                    <s:property value="idUser" />
                                </s:param>
                            </s:url>
                            
                            <s:url action="modify_user_page" var="urlmodify" escapeAmp="false">
                                <s:param name="username">
                                    <s:property value="username" />
                                </s:param>
                                <s:param name="password">
                                    <s:property value="password" />
                                </s:param>
                                <s:param name="email">
                                    <s:property value="email" />
                                </s:param>
                                <s:param name="firstname">
                                    <s:property value="firstname" />
                                </s:param>
                                <s:param name="lastname">
                                    <s:property value="lastname" />
                                </s:param>
                            </s:url>
                                <tr>
                                    <td>
                                        <s:property value="username" />
                                    </td>
                                    <td>
                                        <s:property value="firstname" />
                                    </td>
                                    <td>
                                        <s:property value="lastname" />
                                    </td>
                                    <td>
                                        <a href="<s:property value="#urldelete" />"> Delete </a>
                                    </td>
                                    <td>
                                        <a href="<s:property value="#urlmodify" />"> Modify </a>
                                    </td>
                                </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    </body>
</html>
