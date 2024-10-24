<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form >
    <div class="row g-3">
        <div class="col-md-6">
            <label  class="form-label">Mozo: </label>
            <span>${pedido.mozo.nombre}</span>
        </div>

        <div class="col-md-6">
            <label  class="form-label">Cliente: </label>
            <span>${pedido.cliente.nombre}</span>
        </div>

        <div class="col-md-6">
            <label  class="form-label">Mesa: </label>
            <span>${pedido.mesa.numeroMesa}</span>
        </div>

        <div class="col-md-6">
            <label  class="form-label">Fecha Pedido </label>
            <span>${pedido.fechaPedido}</span>
        </div>
            <div class="col-md-6">
            <label  class="form-label">Metodo Pago </label>
            <span>${pedido.pago.metodoPago}</span>
        </div>
    </div>

    <input type="hidden" name="accion" value="guardar">

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
                    </tr>
                </thead>
                <tbody id="lblCarrito" >
                    <c:forEach items="${detalles}" var="item">
                        <tr>
                            <td>${item.producto.categoria}</td>
                            <td>${item.producto.nombre}</td>
                            <td>${item.producto.descripcion}</td>
                            <td>${item.producto.precio}</td>
                            <td>${item.cantidad}</td>
                            <td>${item.Importe()}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5" style="text-align: left">Total</td>
                        <td>${pedido.pago.monto}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</form>