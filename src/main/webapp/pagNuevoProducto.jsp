<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Gest. Productos</title>
        <link rel="stylesheet" href="assets2/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets2/vendors/base/vendor.bundle.base.css">
        <link rel="stylesheet" href="assets2/css/style.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet" >
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
                                            <h3>${producto.idProd == 0 ? "Nuevo": "Editar"} Producto</h3>
                                            <hr />

                                            <form action="ProductoControl" method="post">
                                                <div class="mb-3">
                                                    <label>Nombres:</label>
                                                    <input value="${producto.nombre}" name="nombre" type="text" maxlength="150" 
                                                           class="form-control" required="">
                                                </div>

                                                <div class="mb-3">
                                                    <label>Descripción:</label>
                                                    <input value="${producto.descripcion}" name="descripcion" type="text" maxlength="200" 
                                                           class="form-control" required="">
                                                </div>

                                                <div class="mb-3">
                                                    <label>Categoria:</label>
                                                    <input value="${producto.categoria}" name="categoria" type="text" maxlength="80" 
                                                           class="form-control" required="">
                                                </div>

                                                <div class="mb-3">
                                                    <label>Precio:</label>
                                                    <input value="${producto.precio}" name="precio" type="number" step="0.1"
                                                           class="form-control" required="">
                                                </div>

                                                <div class="mb-3">
                                                    <label>Stock:</label>
                                                    <input value="${producto.stock}" name="stock" type="number" 
                                                           class="form-control" required="">
                                                </div>

                                                <div class="mb-3">
                                                    <input type="hidden" name="id" value="${producto.idProd}">
                                                    <input type="hidden" name="accion" value="guardar">
                                                    <button class="btn btn-primary btn-sm">
                                                        <i class="fa fa-save"></i> Guardar
                                                    </button>
                                                    <a href="ProductoControl?accion=listar" 
                                                       class="btn btn-dark btn-sm">
                                                        <i class="fa fa-arrow-left"></i> Volver atras
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
