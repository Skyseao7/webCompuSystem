<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Gestión de Mozos</title>
        <link rel="stylesheet" href="assets2/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets2/vendors/base/vendor.bundle.base.css">
        <link rel="stylesheet" href="assets2/css/style.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet" >
        <link href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap4.css" rel="stylesheet" >
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
                                            <h3>${pedido.idPedido == 0 ? "Nuevo" : "Editar"} Pedido</h3>
                                            <hr />

                                            <jsp:include page="includes/Mensaje.jsp" />

                                            <form method="post" action="PedidoControl" onsubmit="return fnValidarProceso()">
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <label  class="form-label">Mozo: </label>
                                                        <select class="form-control form-select" required="" name="mozo" id="mozo" >
                                                            <option value="">:::Seleccione:::</option>
                                                            <c:forEach var="item" items="${mozos}" >
                                                                <option value="${item.idMozo}"
                                                                        >${item.nombre} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-4">
                                                        <label  class="form-label">Cliente: </label>
                                                        <div class="input-group mb-6">
                                                            <input type="text" name="lbCliente" id="lbCliente" readonly="" class="form-control" disabled="">
                                                            <a href="#" class="btn btn-primary btn-sm" title="Buscar Cliente" data-toggle="modal" data-target="#modalClientes">
                                                                <i class="fa fa-search"></i>
                                                            </a>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-2">
                                                        <label  class="form-label">Mesa: </label>
                                                        <select class="form-control form-select" required="" name="mesa" id="mesa" >
                                                            <option value="">:::Seleccione:::</option>
                                                            <c:forEach var="item" items="${mesas}" >
                                                                <option value="${item.idMesa}"
                                                                        >${item.numeroMesa} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <br>
                                                <div class="row g-3"> 
                                                    <div class="col-md-12">
                                                        <span class="badge bg-info">Datos Requeridos</span>
                                                        <hr>
                                                    </div>
                                                </div>

                                                <div class="row g-3">
                                                    <div class="col-md-3">
                                                        <label  class="form-label">Producto: </label>
                                                        <select class="form-control form-select" name="producto" id="producto" onchange="fnCargarProducto()">
                                                            <option value="">:::Seleccione:::</option>

                                                        </select>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <label  class="form-label">Descripción: </label>
                                                        <textarea rows="3"  disabled="" name="descripcion" id="descripcion" class="form-control" ></textarea>
                                                    </div>
                                                </div>

                                                <div class="row g-3">
                                                    <div class="col-md-3">
                                                        <label class="form-label">Precio (S/):</label>
                                                        <input type="text" class="form-control"  readonly name="precio" id="precio" disabled="" >
                                                    </div>
                                                    <div class="col-md-3">
                                                        <label class="form-label">Stock:</label>
                                                        <input type="text" class="form-control"  readonly name="stock" id="stock" disabled="" >
                                                    </div>

                                                    <div class="col-md-3">
                                                        <label class="form-label">Cantidad:</label>
                                                        <input type="number" class="form-control"  name="cantidad" id="cantidad" min="1" >
                                                    </div>
                                                </div>

                                                <div class="row g-3 mt-3">
                                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                        <button class="btn btn-success me-md-2 btn-sm" type="button" onclick="fnAgregarCarrito()">
                                                            <i class="fa fa-plus-circle"></i> Agregar
                                                        </button>

                                                        &nbsp;

                                                        <button class="btn btn-primary btn-sm" type="submit" id="btnProcesar" >
                                                            <i class="fa fa-save"></i> Procesar Pedido

                                                        </button>
                                                    </div>
                                                </div>

                                                <input type="hidden" name="accion" value="guardar">
                                                <input type="hidden" name="cliente" id="cliente">
                                                <div class="row g-3 mt-3">
                                                    <div class="table-responsive">
                                                        <table class="table  table-striped table-bordered text-center" >
                                                            <thead class="bg-primary text-white">
                                                                <tr>
                                                                    <th class="text-center">Categoria</th>
                                                                    <th class="text-center">Producto</th>
                                                                    <th class="text-center">Descripción</th>
                                                                    <th class="text-center">Precio</th>
                                                                    <th class="text-center">Cantidad</th>
                                                                    <th class="text-center">Total</th>
                                                                    <th class="text-center">Acción</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="lblCarrito" >

                                                            </tbody>
                                                        </table>
                                                    </div>
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

        <div class="modal fade" id="modalClientes" data-backdrop="static" data-keyboard="false" tabindex="-1"  
             data-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >Listado de Clientes</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="table-responsive mt-4">
                            <table class="table  table-striped table-bordered text-center" id="tabla">
                                <thead>
                                    <tr>
                                        <th  class="text-center" style="width: 5px;">Seleccionar</th>  
                                        <th  class="text-center">Nombre</th>
                                        <th  class="text-center">Teléfono</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${clientes}"  >
                                        <tr>
                                            <td style="width: 5px;">
                                                <a href="javascript:fnCargarCliente(${item.idCliente},'${item.nombre}')"
                                                   class="btn btn-success btn-sm" title="Seleccionar" >
                                                    <i class="fa fa-check-circle"></i>
                                                </a>
                                            </td>
                                            <td  class="text-center">${item.nombre}</td>
                                            <td  class="text-center">${item.telefono}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${clientes.size() == 0 or clientes == null}">
                                        <tr>
                                            <td colspan="4">No se encontraron datos</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <i class="fa fa-times"></i>&nbsp; Cancelar</button>
                    </div>

                </div>
            </div>
        </div>

        <script src="assets2/vendors/base/vendor.bundle.base.js"></script>
        <script src="assets2/js/off-canvas.js"></script>
        <script src="assets2/js/hoverable-collapse.js"></script>
        <script src="assets2/js/template.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.1.3/axios.min.js" ></script>
 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap4.js"></script>
    </body>

    <script>
                                                            $(document).ready(function () {
                                                                $('#tabla').DataTable({
                                                                    language: {
                                                                        "decimal": "",
                                                                        "emptyTable": "No hay información",
                                                                        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                                                                        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                                                                        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                                                                        "infoPostFix": "",
                                                                        "thousands": ",",
                                                                        "lengthMenu": "Mostrar _MENU_ Entradas",
                                                                        "loadingRecords": "Cargando...",
                                                                        "processing": "Procesando...",
                                                                        "search": "Buscar:",
                                                                        "zeroRecords": "Sin resultados encontrados",
                                                                        "paginate": {
                                                                            "first": "Primero",
                                                                            "last": "Ultimo",
                                                                            "next": "Siguiente",
                                                                            "previous": "Anterior"
                                                                        }
                                                                    }
                                                                });
                                                            });

                                                            var listProductos = [];
                                                            var listCarrito = [];
                                                            var producto = {};


                                                            function fnCargarCliente(id, nombre) {
                                                                document.getElementById("cliente").value = id;
                                                                document.getElementById("lbCliente").value = nombre;
                                                                $("#modalClientes").modal("hide");
                                                            }

                                                            function fnListarProductos() {
                                                                var _params = {
                                                                    "accion": "listarJson"
                                                                };
                                                                var combo = document.getElementById("producto");
                                                                combo.innerHTML = '<option value="">::: Seleccione :::</option>';

                                                                axios
                                                                        .get("ProductoControl", {params: _params})
                                                                        .then((response) => {
                                                                            listProductos = response.data;
                                                                            response = response.data;
                                                                            response.forEach(item => {
                                                                                const option = document.createElement("option");
                                                                                option.value = item.idProd;
                                                                                option.text = item.nombre;
                                                                                combo.appendChild(option);
                                                                            });

                                                                        })
                                                                        .catch((error) => {
                                                                            console.dir(error);
                                                                            alert("No se pudo cargar productos.");
                                                                        });
                                                            }

                                                            function fnCargarProducto() {

                                                                var idProd = document.getElementById("producto").value;
                                                                var descripcion = document.getElementById("descripcion");
                                                                var precio = document.getElementById("precio");
                                                                var stock = document.getElementById("stock");

                                                                var productoSeleccionado = listProductos.find(item => item.idProd === parseInt(idProd));

                                                                if (productoSeleccionado) {
                                                                    descripcion.value = productoSeleccionado.descripcion;
                                                                    precio.value = productoSeleccionado.precio;
                                                                    stock.value = productoSeleccionado.stock;
                                                                } else {
                                                                    descripcion.value = "";
                                                                    precio.value = "";
                                                                    stock.value = "";
                                                                }
                                                            }

                                                            function fnAgregarCarrito() {
                                                                var idProd = document.getElementById("producto").value;
                                                                var cantidad = document.getElementById("cantidad").value;
                                                                var stock = document.getElementById("stock").value;

                                                                if (!idProd) {
                                                                    alert("Debe seleccionar un producto");
                                                                    return;
                                                                }

                                                                if (!cantidad) {
                                                                    alert("Debe ingresar una cantidad");
                                                                    return;
                                                                }


                                                                var _params = {
                                                                    "accion": "agregar",
                                                                    "id": idProd,
                                                                    "cantidad": cantidad
                                                                };

                                                                axios
                                                                        .get("CarritoControl", {params: _params})
                                                                        .then((response) => {
                                                                            response = response.data;

                                                                            if (response.msg === "OK") {
                                                                                fnListarCarrito();
                                                                            } else {
                                                                                alert(response.msg);
                                                                            }
                                                                        })
                                                                        .catch((error) => {
                                                                            console.dir(error);
                                                                            alert("No se pudo agregar producto.");
                                                                        });
                                                            }

                                                            function fnListarCarrito() {
                                                                var _params = {
                                                                    "accion": "listar"
                                                                };

                                                                axios
                                                                        .get("CarritoControl", {params: _params})
                                                                        .then((response) => {
                                                                            response = response.data;

                                                                            listCarrito = response.carrito;
                                                                            var total = response.total;
                                                                            var cadena = "";
                                                                            var index = 0;
                                                                            listCarrito.forEach(item => {
                                                                                cadena += "<tr>";
                                                                                cadena += "<td>" + item.producto.categoria + "</td>";
                                                                                cadena += "<td>" + item.producto.nombre + "</td>";
                                                                                cadena += "<td>" + item.producto.descripcion + "</td>";
                                                                                cadena += "<td>" + parseFloat(item.producto.precio).toFixed(2) + "</td>";
                                                                                cadena += "<td>" + item.cantidad + "</td>";
                                                                                cadena += "<td>" + parseFloat(item.producto.precio * item.cantidad).toFixed(2) + "</td>";
                                                                                cadena += "<td><a href='javascript:fnEliminarItemCarrito(" + index + ")' class='btn btn-danger btn-sm'><i class='fa fa-trash'></i></a></td>";
                                                                                cadena += "</tr>";

                                                                                index++;
                                                                            });

                                                                            if (listCarrito.length > 0) {
                                                                                cadena += "<tr><td colspan='5'>Total</td><td colspan='2'>" + total + "</td></tr>";
                                                                                document.getElementById("lblCarrito").innerHTML = cadena;
                                                                            } else {
                                                                                cadena += "<tr><td colspan='7'>No hay datos</td></tr>";
                                                                                document.getElementById("lblCarrito").innerHTML = cadena;
                                                                            }
                                                                        })
                                                                        .catch((error) => {
                                                                            console.dir(error);
                                                                            alert("No se pudo cargar productos.");
                                                                        });
                                                            }

                                                            function fnEliminarItemCarrito(index) {
                                                                var _params = {
                                                                    "accion": "eliminar",
                                                                    "indice": index
                                                                };

                                                                axios
                                                                        .get("CarritoControl", {params: _params})
                                                                        .then((response) => {
                                                                            response = response.data;

                                                                            if (response.msg === "OK") {
                                                                                fnListarCarrito();
                                                                            } else {
                                                                                alert(response.msg);
                                                                            }
                                                                        })
                                                                        .catch((error) => {
                                                                            console.dir(error);
                                                                            alert("No se pudo eliminar producto.");
                                                                        });
                                                            }

                                                            function fnValidarProceso() {
                                                                var cliente = document.getElementById("cliente").value;
                                                                var mozo = document.getElementById("mozo");
                                                                var mesa = document.getElementById("mesa");

                                                                if (!cliente) {
                                                                    alert("Debe seleccionar un cliente");
                                                                    return false;
                                                                }

                                                                if (!mesa) {
                                                                    alert("Debe seleccionar una mesa");
                                                                    return false;
                                                                }

                                                                if (!mozo) {
                                                                    alert("Debe seleccionar un mozo");
                                                                    return false;
                                                                }

                                                                if (listCarrito.length === 0) {
                                                                    alert("No hay productos seleccionados para el pedido");
                                                                    return false;
                                                                }

                                                                return true;
                                                            }


                                                            fnListarProductos();
                                                            fnListarCarrito();

    </script>
</html>
