<%-- 
    Document   : teacher
    Created on : 12/11/2017, 11:29:13 AM
    Author     : Ximena
--%>


<%@taglib  uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
        <meta charset='utf-8' />
        <meta http-equiv='x-ua-compatible' content='ie=edge'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <title>FRAQ | Profesor</title>
        <link rel='stylesheet' href='assets/css/app.css'>
        <script src='assets/js/app.js'></script>
    </head>
    <body>
        <br />
        <header class='sticky-shrinknav-header'>
            <img class="sticky-shrinknav-header-title logo" src='assets/img/logos/fraq.png'>
            <ul class='menu align-center sticky-shrinknav-menu'>
                <li><a href=''>Inicio</a></li>
                <li><a href=''>Acerca de </a></li>
                <li><a href='logout.action'>Cerrar sesión</a></li>
            </ul>
        </header>
        
        <div class='row'>
            <div class='large-12 columns text-center'>
                <h1>Panel de profesor</h1>
            </div>
        </div>
        
        
        <div class='row'>
            <div class='medium-3 primary callout text-center'>
                <a href="<s:url action="new-exercise-page"/>" >Nuevo ejercicio</a>
            </div>
        </div>
        
        <br />
        <br />
        
        <div class='row'>
            <div class='medium-10 medium-offset-1'>
                <table>
                    <thead>
                        <tr>
                            <th>Ejercicio</th>
                            <th>Tipo</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="list" id="exercise">
                            <s:url action="delete_exercise.action" var="urldelete">
                                <s:param name="idExercise">
                                    <s:property value="#exercise.idExercise" />
                                </s:param>
                            </s:url>
                            
                            <s:url action="edit-exercise-page" var="urlmodify" escapeAmp="false">
                                <s:param name="idExercise">
                                    <s:property value="#exercise.idExercise" />
                                </s:param>
                                <s:param name="rows">
                                    <s:property value="#exercise.rows" />
                                </s:param>
                                <s:param name="columns">
                                    <s:property value="#exercise.columns" />
                                </s:param>
                                <s:param name="selecteds">
                                    <s:property value="#exercise.selecteds.size" />
                                </s:param>
                                <s:param name="type">
                                    <s:property value="#exercise.type"/>
                                </s:param>
                            </s:url>
                                <tr>
                                    <td>
                                        <s:property value="#exercise.name" />
                                    </td>
                                    <td>
                                        <s:if test="%{#exercise.type==0}">
                                            Cuadrado
                                        </s:if>
                                        <s:else>
                                            Circulo
                                        </s:else>
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
    </body>
</html>
