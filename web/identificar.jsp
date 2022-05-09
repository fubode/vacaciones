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
        <title>SGV-FUBODE</title>
    </head>
    <div class="global-container">
        <div class="card login-form">
            <div class="card-body">
                <h3 class="card-title text-center">INICIO DE SESION</h3>
                <div class="card-text">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control form-control-sm" id="usuario" aria-describedby="USUARIO" placeholder = "USUARIO">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control form-control-sm" id="password" aria-describedby="PASSWORD" placeholder = "PASSWORD">
                        </div>
                            <button type="button" class="btn btn-primary btn-block" title="INICIAR SESION" id="sesion">
                                Sing in
                            </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="recursos/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="recursos/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/sesiones.js" type="text/javascript"></script>
</body>
</html>



