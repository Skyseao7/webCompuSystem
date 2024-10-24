<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Gestión de Clientes</title>
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
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Gestión de Clientes</h4>
                                    <hr />
                                    <a href="ClienteControl?accion=nuevo" class="btn btn-success btn-sm">
                                        <i class="fa fa-plus-circle"></i> Nuevo Cliente
                                    </a>

                                    <jsp:include page="includes/Mensaje.jsp" />

                                    <table class="table table-bordered table-striped mt-2">
                                        <thead class="bg-primary text-white">
                                            <tr>
                                                <th>ID Cliente</th>
                                                <th>Nombre</th>
                                                <th>Teléfono</th>
                                                <th>Email</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lista}" var="item">
                                                <tr>
                                                    <td>${item.idCliente}</td>
                                                    <td>${item.nombre}</td>
                                                    <td>${item.telefono}</td>
                                                    <td>${item.email}</td>
                                                    <td>
                                                        <a href="ClienteControl?accion=editar&id=${item.idCliente}"
                                                           class="btn btn-primary btn-sm">
                                                            <i class="fa fa-edit"></i>
                                                        </a>
                                                        <a href="ClienteControl?accion=eliminar&id=${item.idCliente}"
                                                           onclick="return confirm('¿Está seguro que desea eliminar el cliente con id ${item.idCliente}?')"
                                                           class="btn btn-danger btn-sm">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${lista.size() == 0}">
                                                <tr class="text-center">
                                                    <td colspan="5">No hay registros</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
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
