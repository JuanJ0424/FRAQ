<%-- 
    Document   : build_fraction
    Created on : 11-dic-2017, 13:37:31
    Author     : Juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foundation for Sites</title>
    <link rel="stylesheet" href="assets/css/app.css">
</head>

<body class="body-bzone">

    <header class="">
        <ul class="menu align-center sticky-shrinknav-menu top-menu">
            <li>
                <a href='<s:url action="teacher-panel"/>'>Inicio</a>
            </li>
            <li>
                <a href="#">Acerca de </a>
            </li>
            <li><a href='<s:url action="logout"/>'>Cerrar sesión</a></li>
        </ul>
    </header>
    
    <div class="build-zone">
        <canvas id="c"></canvas>
    </div>
    
    <s:form action="new-exercise" method="post" id="form">
        <s:hidden name="idExercise" id="idExercise"/>
        <s:hidden name="type" id="type" value="1"/>
        <s:hidden name="rows" id="rows"/>
        <s:hidden name="columns" id="columns"/>
        <s:hidden name="selecteds" id="selecteds"/>
        <s:hidden name="name" id="name" value="%{#parameters.name}"/>
    </s:form>
    
    <script src="assets/js/fabric.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/js/fraq.js"></script>
</body>

</html>