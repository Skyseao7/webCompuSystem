<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>CompuSystem | Carrito</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <jsp:include page="components/Navegacion.jsp" />
        <jsp:include page="components/Mensaje.jsp"/>

        <!-- Shoping Cart Section Begin -->
        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Productos</th>
                                        <th>Precio</th>
                                        <th>Cantidad</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${carrito}" var="item" varStatus="loop">
                                        <tr>
                                            <td class="shoping__cart__item">
                                                <img src="img/productos/${item.producto.imagen}" alt="${item.producto.pNombre}" style="width: 100px; height: auto;">
                                                <span class="producto-nombre">${item.producto.pNombre}</span>
                                            </td>
                                            <td class="shoping__cart__price">
                                                s./${item.producto.precio}
                                            </td>
                                            <td class="shoping__cart__quantity">
                                                <div class="quantity">
                                                    ${item.cantidad}
                                                </div>
                                            </td>
                                            <td class="shoping__cart__total">
                                                ${item.Importe()}
                                            </td>
                                            <td class="shoping__cart__item__close">
                                                    <a href="CarritoControl?accion=eliminar&indice=${loop.index}" title="Eliminar" class="btn-danger" btn-sm>
                                                        <i class="icon_close"></i>
                                                    </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${!(carrito !=null && carrito.size() > 0)}">
                                        <tr class="text-center">
                                            <td colspan="6">Carrito vacio!</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="shoping__continue">
                            <div class="shoping__cart__btns">
                            <a href="productos.jsp" class="primary-btn cart-btn">CONTINUAR COMPRANDO</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <form action="PedidoControlador" method="post">
                            <div class="shoping__checkout">
                            <h5>RESUMEN DE COMPRA</h5>
                            <ul>
                                <li>TOTAL <span>s./${total}</span></li>
                            </ul>
                            <input type="hidden" name="accion" value="procesar">
                            
                            <button ${carrito.size()==0?'disabled':''} type="submit" class="btn btn-block btn-lg">
                                <a href="PedidoControlador?accion=procesar" class="primary-btn">PROCESAR LA COMPRA</a>
                            </button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->


        <jsp:include page="components/Footer.jsp" />

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
