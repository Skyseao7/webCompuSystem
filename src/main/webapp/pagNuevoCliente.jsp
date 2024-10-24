<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Gestión de Cliente</title>
        <link rel="stylesheet" href="assets2/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets2/vendors/base/vendor.bundle.base.css">
        <link rel="stylesheet" href="assets2/css/style.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-scroller">
            <jsp:include page="includes/Navegacion.jsp" />

            <div class="container-fluid page-body-wrapper">
                <jsp:include page="includes/Aside.jsp" />

                <div class="main-panel">        
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-md-12 grid-margin stretch-card">
                                <div class="container mt-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <h3>${cliente.idCliente == 0 ? "Nuevo" : "Editar"} Cliente</h3>
                                            <hr />

                                            <form action="ClienteControl" method="post">
                                                <div class="mb-3">
                                                    <label>Nombre:</label>
                                                    <input value="${cliente.nombre}" name="nombre" type="text" 
                                                           class="form-control" required="" maxlength="50">
                                                </div>

                                                <div class="mb-3">
                                                    <label>Teléfono:</label>
                                                    <input value="${cliente.telefono}" name="telefono" type="text" 
                                                           class="form-control" required="" maxlength="15">
                                                </div>

                                                <div class="mb-3">
                                                    <label>Email:</label>
                                                    <input value="${cliente.email}" name="email" type="email" 
                                                           class="form-control" required="" maxlength="100">
                                                </div>

                                                <div class="mb-3">
                                                    <input type="hidden" name="id" value="${cliente.idCliente}">
                                                    <input type="hidden" name="accion" value="guardar">
                                                    <button class="btn btn-primary btn-sm">
                                                        <i class="fa fa-save"></i> Guardar
                                                    </button>
                                                    <a href="ClienteControl?accion=listar" 
                                                       class="btn btn-dark btn-sm">
                                                        <i class="fa fa-arrow-left"></i> Volver atrás
                                                    </a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="assets2/vendors/base/vendor.bundle.base.js"></script>
        <script src="assets2/js/off-canvas.js"></script>
        <script src="assets2/js/hoverable-collapse.js"></script>
        <script src="assets2/js/template.js"></script>
    </body>
</html>
