<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Gest. Pedido</title>
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
                                        <h4 class="card-title">Consulta pedidos historial</h4>
                                        <hr />
                                        <form method="get" action="PedidoControl" class="mt-3">
                                            <div class="row">
                                                <div class="form-group col-md-2">
                                                    <label>Fecha Inicio:</label>
                                                    <input value="${inicio}" name="inicio" type="date" class="form-control" required="" >
                                                </div>

                                                <div class="form-group col-md-2">
                                                    <label>Fecha Fin:</label>
                                                    <input value="${fin}" name="fin"  type="date" class="form-control" required="" >
                                                </div>

                                                <div class="form-group col-md-8 mt-4" style="text-align: right;">
                                                    <input type="hidden" name="accion" value="historial">
                                                    <button  type="submit" class="btn btn-primary btn-sm">
                                                        <i class="fa fa-search"></i> Consultar
                                                    </button>
                                                </div>

                                            </div>
                                        </form>

                                        <jsp:include page="includes/Mensaje.jsp" />

                                        <table class="table table-bordered table-striped mt-2">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th>ID Pedido</th>
                                                    <th>Mesa</th>
                                                    <th>Mozo</th>
                                                    <th>Cliente</th>
                                                    <th>Fecha Pedido</th>
                                                    <th>Metodo Pago</th>
                                                    <th>Pago</th>
                                                    <th>Acción</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${lista}" var="item">
                                                    <tr>
                                                        <td>${item.idPedido}</td>
                                                        <td>${item.mesa.numeroMesa}</td>
                                                        <td>${item.mozo.nombre}</td>
                                                        <td>${item.cliente.nombre}</td>
                                                        <td>${item.fechaPedido}</td>
                                                        <td>${item.pago.metodoPago}</td>
                                                        <td>${item.pago.monto}</td>
                                                        <td>
                                                            <a 
                                                                class="btn btn-success btn-sm"
                                                                data-toggle="modal" data-target="#detalleModal"
                                                                onclick="cargarDetalle('${item.idPedido}')">
                                                                <i class="fa fa-info"></i> Ver detalle
                                                            </a>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${lista.size() == 0}">
                                                    <tr class="text-center">
                                                        <td colspan="8">No hay registros</td>
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

        <div class="modal fade" id="detalleModal" tabindex="-1" role="dialog" aria-labelledby="pagoModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="pagoModalLabel">Detalle Pedido</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div id="detallePedido">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>

                </div>
            </div>
        </div>


        <script src="assets2/vendors/base/vendor.bundle.base.js"></script>
        <script src="assets2/js/off-canvas.js"></script>
        <script src="assets2/js/hoverable-collapse.js"></script>
        <script src="assets2/js/template.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.1.3/axios.min.js" ></script>
    </body>
    <script>
                                                                    function cargarDetalle(idPedido) {
                                                                        var _params = {
                                                                            "accion": "detalleHtml",
                                                                            "id": idPedido
                                                                        };

                                                                        axios
                                                                                .get("PedidoControl", {params: _params})
                                                                                .then((response) => {
                                                                                    document.getElementById('detallePedido').innerHTML = response.data;
                                                                                })
                                                                                .catch((error) => {
                                                                                    console.dir(error);
                                                                                    alert("No se pudo cargar detalle.");
                                                                                });
                                                                    }

    </script>
</html>
