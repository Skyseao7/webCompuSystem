<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav>
    <!-- Header cel Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <div class="header__cart">
                <ul>
                    <li><a href="#"><i class="fa fa-heart"></i> <span>0</span></a></li>
                    <li><a href="CarritoControl?accion=listar"><i class="fa fa-shopping-bag"></i> <span>0</span></a></li>
                </ul>
                <div class="header__cart__price">item: <span>s/0.00</span></div>
            </div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li><a href="./index.html">Inicio</a></li>
                <li><a href="./shop-grid.html">Productos</a></li>
                <li><a href="#">Información</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Sobre nosotros</a></li>
                        <li><a href="./shoping-cart.html">Ubicación</a></li>
                        <li><a href="./checkout.html">Delivery</a></li>
                        <li><a href="./blog-details.html">Preguntas frecuentes</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Soporte técnico</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-whatsapp"></i></a>
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> compusystem@gmail.com</li>
                <li>Envío gratis a partir de s/99.00</li>
            </ul>
        </div>
    </div>
    <!-- Header cel End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> compusystem@gmail.com</li>
                                <li>Envío gratis a partir de s/99.00</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-whatsapp"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./index.html">Inicio</a></li>
                            <li><a href="./shop-grid.html">Productos</a></li>
                            <li><a href="#">Información</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Sobre nosotros</a></li>
                                    <li><a href="./shoping-cart.html">Ubicación</a></li>
                                    <li><a href="./checkout.html">Delivery</a></li>
                                    <li><a href="./blog-details.html">Preguntas frecuentes</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Soporte técnico</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>0</span></a></li>
                            <li><a href="CarritoControl?accion=listar"><i class="fa fa-shopping-bag"></i> <span>0</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>s/0.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>Categorías</span>
                        </div>
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
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    Todo
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="Busca tu producto">
                                <button type="submit" class="site-btn">BUSCAR</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+51 995-655-898</h5>
                                <span>Soporte 12h</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
</nav>
