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
                                        <h4 class="card-title">Gestión de Pedidos atención</h4>
                                        <hr />
                                        <a href="PedidoControl?accion=nuevo" class="btn btn-success btn-sm">
                                            <i class="fa fa-plus-circle"></i> Nuevo
                                        </a>

                                        <jsp:include page="includes/Mensaje.jsp" />

                                        <table class="table table-bordered table-striped mt-2">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th>ID Pedido</th>
                                                    <th>Mesa</th>
                                                    <th>Mozo</th>
                                                    <th>Cliente</th>
                                                    <th>Fecha Pedido</th>
                                                    <th>Total</th>
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
                                                        <td>${item.pago.monto}</td>
                                                        <td>
                                                        
                                                            <a href="PedidoControl?accion=eliminar&id=${item.idPedido}"
                                                               onclick="return confirm('¿Está seguro que desea eliminar el pedido con id ${item.idPedido}?')"
                                                               class="btn btn-danger btn-sm">
                                                                <i class="fa fa-trash"></i>
                                                            </a>

                                                            <a 
                                                                class="btn btn-success btn-sm"
                                                                data-toggle="modal" data-target="#pagoModal"
                                                                onclick="cargarDatosPago('${item.cliente.nombre}', '${item.pago.monto}', '${item.idPedido}')">
                                                                <i class="fa fa-dollar"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${lista.size() == 0}">
                                                    <tr class="text-center">
                                                        <td colspan="7">No hay registros</td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>


                                        <div class="modal fade" id="pagoModal" tabindex="-1" role="dialog" aria-labelledby="pagoModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="pagoModalLabel">Realizar Pago</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <form action="PedidoControl" method="post">
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label for="cliente">Nombre del Cliente:</label>
                                                                <input type="text" class="form-control" id="cliente" placeholder="Nombre del cliente" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="metodoPago">Método de Pago:</label>
                                                                <select class="form-control" id="metodoPago" name="metodoPago">
                                                                    <option value="efectivo">Efectivo</option>
                                                                    <option value="transferencia">Transferencia</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="total">Total a Pagar:</label>
                                                                <input type="number" class="form-control" id="total" placeholder="Ingrese el total" readonly>
                                                            </div>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" name="idPedido" id="idPedido" value="">
                                                            <input type="hidden" name="accion" value="pagar_pedido" >
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit" class="btn btn-primary">Confirmar Pago</button>
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
            </div>
        </div>

        <script src="assets2/vendors/base/vendor.bundle.base.js"></script>
        <script src="assets2/js/off-canvas.js"></script>
        <script src="assets2/js/hoverable-collapse.js"></script>
        <script src="assets2/js/template.js"></script>

        <script>
                                                                    function cargarDatosPago(cliente, monto, idPedido) {
                                                                        document.getElementById("cliente").value = cliente;
                                                                        document.getElementById("total").value = monto;
                                                                        document.getElementById("idPedido").value = idPedido;
                                                                    }
        </script>
    </body>

</html>
