<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CompuSystem | Productos</title>

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
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <jsp:include page="components/Navegacion.jsp" />
     
    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Categorías</h4>
                            <ul>
                                <li><a href="#">Accesorios</a></li>
                                <li><a href="#">Computo</a></li>
                                <li><a href="#">Impresoras</a></li>
                                <li><a href="#">Laptops</a></li>
                                <li><a href="#">Monitores</a></li>
                                <li><a href="#">Perifericos</a></li>
                                <li><a href="#">Proyectores</a></li>
                                <li><a href="#">Redes</a></li>
                                <li><a href="#">Software</a></li>
                                <li><a href="#">Piezas</a></li>
                                <li><a href="#">Suministros</a></li>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Precio</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="5000">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="product__linked__title">
                                    <a href="#">Productos</a>
                                    <span class="delimiter"><i class="fa fa-angle-right"></i></span>
                                </div>
                                
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>16</span> Productos encontrados</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <c:forEach items="${producto}" var="item">
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <form action="CarritoControl" method="get">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${item.imagen}">
                                    <ul class="product__item__pic__hover">
                                        <button type="button" class="btn btn-sm">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        </button>
                                        <button type="submit" class="btn btn-sm">
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </button>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">${item.pNombre}</a></h6>
                                    <input type="hidden" name="accion" value="agregar">
                                    <input type="hidden" name="id" value="${item.idProducto}">
                                    <h5>s./${item.precio}</h5>
                                </div>
                            </div>
                            </form>
                        </div>
                        </c:forEach>
                    </div>
                        
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

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