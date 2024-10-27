<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CompuSystem | Inicio</title>

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
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                    </div>
                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>OFERTA</span>
                            <h2>Laptop <br />Asus ExpertBook B2</h2>
                            <h3>Intel Core I5-10210U</h3>
                            <h2>S/3,700.00</h2>
                            <a href="#" class="primary-btn">COMPRAR</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

        <!-- Categories Section Begin -->
        <section class="categories">
            <div class="container">
                <div class="row">
                    <div class="categories__slider owl-carousel">
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg">
                                <h5><a href="#">LAPTOPS</a></h5>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg">
                                <h5><a href="#">COMPUTO</a></h5>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg">
                                <h5><a href="#">IMPRESORAS</a></h5>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg">
                                <h5><a href="#">KIT GAMER</a></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Categories Section End -->

    <!-- Ofertas begin -->
    <section class="latest-product spad">
        <div class="container">
                <div class="section-title product__discount__title">
                    <h2>Ofertas</h2>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="product__discount__item">
                            <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-1.jpg">
                                <div class="product__discount__percent">-15%</div>
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__discount__item__text">
                                <span>Monitores</span>
                                <h5><a href="#">MONITOR LED 27" LG 27BK550Y-B 1920x1080 HDMI DP VGA 5MS/75Hz</a></h5>
                                <div class="product__item__price">s/580.00 <span>s/682.00</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="product__discount__item">
                            <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-2.jpg">
                                <div class="product__discount__percent">-20%</div>
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__discount__item__text">
                                <span>Periféricos</span>
                                <h5><a href="#">TECLADO EVGA Z12 RGB BLACK MEMBRANA CONEXIÓN WIRED USB</a></h5>
                                <div class="product__item__price">s/136.00 <span>s/170.00</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="product__discount__item">
                            <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-3.jpg">
                                <div class="product__discount__percent">-20%</div>
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__discount__item__text">
                                <span>Computo</span>
                                <h5><a href="#">FUENTE COOLER MASTER GX II 850W 80 PLUS GOLD FULL MODULAR</a></h5>
                                <div class="product__item__price">s/409.00 <span>s/511.00</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <div class="product__discount__item">
                            <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-4.jpg">
                                <div class="product__discount__percent">-20%</div>
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__discount__item__text">
                                <span>Computo</span>
                                <h5><a href="#">ZOTAC GAMING GEFORCE RTX 4060 8GB GDDR6 128BITS TWIN EDGE OC</a></h5>
                                <div class="product__item__price">s/1,116.00 <span>s/1,395.00</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Fin de sección de ofertas -->
    
    <!-- Banner begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>Blog</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-1.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> Octubre 2024</li>
                            </ul>
                            <h5><a href="#">Guía de Compra: ¿Qué Monitor es el Mejor para Ti?</a></h5>
                            <p>Elegir el monitor adecuado puede marcar una gran diferencia en tu vida diaria. Con tantas opciones en el mercado, puede resultar abrumador, en esta guía te ayudaremos a seleccionar el que mejor se adapte a tus necesidades.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-2.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> Agosto 2024</li>
                            </ul>
                            <h5><a href="#">Tutoriales y Trucos: Optimiza tu Laptop y Mejora su Rendimiento</a></h5>
                            <p>¿Tu laptop se siente lenta y obsoleta? Antes de pensar en reemplazarla, existen varios trucos que pueden devolverle la velocidad y el rendimiento de sus primeros días.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-3.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> Setiembre 2024</li>
                            </ul>
                            <h5><a href="#">Tecnología para el Hogar Inteligente: La Revolución del Hogar Automatizado</a></h5>
                            <p>Imagina llegar a casa y que las luces se enciendan automáticamente, la calefacción esté a la temperatura perfecta y la música de tu lista de reproducción favorita comience a sonar.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
    
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
