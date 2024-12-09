<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>CompuSystem | Blog</title>

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
                
                
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-4.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> Noviembre 2024</li>
                                </ul>
                                <h5><a href="#">¿Cómo Elegir el Mejor Software de Gestión para tu Negocio?</a></h5>
                                <p>Encuentra consejos clave para seleccionar el software que optimice la productividad y organización de tu empresa, ajustándose a tus necesidades específicas.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-5.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> Febrero 2024</li>
                                </ul>
                                <h5><a href="#">Ventajas de Actualizar los Componentes de tu PC Regularmente</a></h5>
                                <p>Explora los beneficios de mantener tu equipo actualizado para obtener un rendimiento óptimo en tareas diarias y gaming.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-6.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> Mayo 2024</li>
                                </ul>
                                <h5><a href="#">Cómo Elegir una Laptop para Gaming sin Gastar de Más</a></h5>
                                <p>Te damos tips para identificar las características necesarias en una laptop gaming sin exceder tu presupuesto.</p>
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
