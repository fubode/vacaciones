<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="recursos/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/estilos.css" rel="stylesheet" type="text/css"/>
        <!-- style para table -->
        <link href="recursos/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <title>SGV-FUBODE</title>
    </head>
    <body>
        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>    

    <header class="container-fluid site-navbar js-sticky-header site-navbar-target" role="banner">
        <div class="container-fluid">
            <div class="linea"></div>
            <div class="row align-items-center position-relative">
                <div class="site-logo">
                    <a href="index.htm" class="text-black">
                        <img src="${pageContext.request.contextPath}/recursos/images/logo.png" alt=""/>
                    </a>
                </div>

                <div class="col-12">
                    <nav class="site-navigation text-right ml-auto " role="navigation">
                        <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                            <li class=""><a href="srvUsuario?accion=inicio" class="nav-link">INICIO</a></li>
                            <li class="t"><a href="srvUsuario?accion=nueva" class="nav-link">SOLICITUDES NUEVAS</a></li>                  
                            <li class="t"><a href="srvUsuario?accion=pendientes" class="nav-link">SOLICITUDES PENDIENTES</a></li>
                            <li class="t"><a href="srvUsuario?accion=aceptadas" class="nav-link">SOLICITUDES ACEPTADAS</a></li>
                            <li class="t"><a href="srvUsuario?accion=rechazadas" class="nav-link">SOLICITUDES RECHAZADAS</a></li>
                            <li class="sombra"><a href="srvUsuario?accion=actividades" class="nav-link">CALENDARIO</a></li>
                            <li class="nav-item dropdown t user">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    JP
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <c:if test="${esSupervisor==true}">
                                        <a class="t dropdown-item" href="svrSupervisor?accion=pendientes">SUPERVISOR</a>                                        
                                    </c:if>
                                    <c:forEach var="data" items="${roles}">
                                        <a class="t dropdown-item" href="srvSesion?accion=${data.nombre_rol}">${data.nombre_rol}</a>  
                                    </c:forEach>
                                    <div class="dropdown-divider"></div>
                                    <a href="#" class="nav-link dropdown-item"  data-toggle="modal" data-target="#exampleModalCenter">
                                        ${nombreFuncionario}
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a href="srvSesion?accion=cerrar" class="nav-link">cerrar sesion</a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>
            </div>
        </div>
        <div class="linea2"></div>
    </header>

    <h1 class="text-center">Calendario de actividades</h1>

    <div class="container">
        <div class="container">
            <label ><strong>SELECIONE UN AÑO </strong></label>
            <select name="gestion" id="gestion" class="">
                <c:forEach var="dato" items="${gestiones}">
                    <c:choose>
                        <c:when  test="${gestion==dato}">
                            <option value="${dato}" selected>${dato}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${dato}">${dato}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>                    
            </select>
            <label ><strong>   SELECCIONE UN MES </strong></label>
            <select name="mes" id="mes" class="">
                <c:forEach var="dato" items="${meses}">
                    <c:choose>
                        <c:when  test="${mes==dato.valor}">
                            <option value="${dato.valor}" selected>${dato.mes}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${dato.valor}">${dato.mes}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>                         
            </select>
        </div>
    </div>
    <table class="table">
        <thead>
            <tr>
                <th>LUNES</th>
                <th>MARTES</th>
                <th>MIERCOLES</th>
                <th>JUEVES</th>
                <th>VIERNES</th>
                <th>SABADO</th>
                <th>DOMINGO</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="lista" items="${listas}">
                <tr>
                    <c:forEach var="dato" items="${lista}">
                        <c:choose>
                            <c:when  test="${dato.tipo=='NO_LABORAL'}">
                                <td class="bg-danger" data-toggle="modal" data-target="#${dato.diaNumeral}">
                                    ${dato.diaNumeral}  
                                    <div class="modal fade" id="${dato.diaNumeral}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header bg-warning">
                                                    <h5 class="modal-title" id="exampleModalLongTitle">DATOS DEL FUNCIONARIO</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <h1>hola</h1>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </c:when>
                            <c:when  test="${dato.tipo=='MANANA'}">
                                <td class="bg-warning text-white">
                                    ${dato.diaNumeral}                                    

                                </td>
                            </c:when>
                            <c:when  test="${dato.tipo=='TARDE'}">
                                <td class="bg-info text-white">
                                    ${dato.diaNumeral}                                    

                                </td>
                                </td>
                            </c:when>
                            <c:when  test="${dato.tipo=='SABADO'}">
                                <td class="bg-primary text-white">
                                    ${dato.diaNumeral}                                    

                                </td>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td class="" data-toggle="modal" data-target="#exampleModalCenter">${dato.diaNumeral}</td>
                            </c:otherwise>
                        </c:choose> 
                    </c:forEach>    
                </tr>
            </c:forEach>
        </tbody>
    </table>



    <div class="linea2 mt-4"></div>
    <div class="row">
        <div class="col-lg-2">
            <div class="text-center">
                LIBRE TODO EL DIA
            </div>
            <div class="container align-items-center text-center bg-danger circulo-color ">
            </div>
        </div>
        <div class="col-lg-2">
            <div class="text-center">
                LIBRE TODA LA MAÑANA
            </div>
            <div class="container align-items-center text-center bg-warning circulo-color ">
            </div>
        </div>
        <div class="col-lg-2">
            <div class="text-center">
                LIBRE TODA LA TARDE
            </div>
            <div class="container align-items-center text-center bg-info circulo-color ">
            </div>
        </div>
        <div class="col-lg-2">
            <div class="text-center">
                PRIMEROS DOS SABADOS
            </div>
            <div class="container align-items-center text-center bg-primary circulo-color ">
            </div>
        </div>
        <div class="col-lg-2">
            <div class="text-center">
                DIA LABORAL
            </div>
            <div class="container align-items-center text-center bg-white circulo-laboral">
            </div>
        </div>
    </div>                        

    <!-- Modal datos usuario -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h5 class="modal-title" id="exampleModalLongTitle">DATOS DEL FUNCIONARIO</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h4 class="text-center">FUNCIONARIO</h4>
                    <label><strong>NOMBRE: </strong> ${nombreFuncionario}</label><br>
                    <label><strong>CARGO: </strong> ${nombre_cargo}</label><br>
                    <label><strong>ENTIDAD: </strong> ${nombre_entidad}</label><br>
                    <label><strong>CORREO: </strong> ${correo}</label><br>
                    <label><strong>FECHA DE INGRESO: </strong> ${fecha_ingreso}</label><br>
                    <c:if test="${supervisor!=0}">
                        <h4 class="text-center">SUPERVISOR</h4>
                        <label><strong>NOMBRE: </strong> ${supervisor_nombre}</label><br>
                        <label><strong>CARGO: </strong> ${supervisor_cargo}</label><br>
                        <label><strong>ENTIDAD: </strong> ${supervisor_entidad}</label><br>
                        <label><strong>CORREO: </strong> ${supervisor_correo}</label><br>
                    </c:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="recursos/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="recursos/js/popper.min.js" type="text/javascript"></script>
    <script src="recursos/js/bootstrap.min.js" type="text/javascript"></script> 
    <!-- scripts para table -->
    <script src="swetalert/sweetalert.js" type="text/javascript"></script>
    <script src="recursos/js/dataTable.js" type="text/javascript"></script>
    <script src="recursos/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="js/calendario.js" type="text/javascript"></script>
</body>
</html>