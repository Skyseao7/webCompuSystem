<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>CompuSystem | Sobre Nosotros</title>

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


        <div class="about-container">
            <h1>Sobre Nosotros</h1>
            <h2>Compu System - Perú S.A.C.</h2>
            <p>
                <strong>Compu System</strong> es una empresa peruana dedicada a la venta de productos y servicios electrónicos,
                comprometida con brindar soluciones tecnológicas de alta calidad y al alcance de todos. Con una sólida experiencia
                en el sector, nuestro objetivo es ofrecer productos de última generación y un servicio al cliente excepcional,
                para que cada compra sea una experiencia satisfactoria y confiable.
            </p>

            <p>
                Nos especializamos en una amplia gama de productos electrónicos que incluyen:
            </p>

            <ul>
                <li>Computadoras y laptops de las mejores marcas</li>
                <li>Dispositivos móviles y accesorios</li>
                <li>Componentes de hardware y software</li>
                <li>Servicios de mantenimiento y soporte técnico especializado</li>
            </ul>

            <p>
                En <strong>Compu System</strong>, la innovación y el compromiso con nuestros clientes son nuestra prioridad. Nos
                esforzamos por estar siempre a la vanguardia de la tecnología, ofreciendo soluciones personalizadas y adaptadas
                a cada cliente.
            </p>

            <p class="thanks">Gracias por confiar en nosotros para todas tus necesidades tecnológicas.</p>

            <div class="contact-info">
                <p><strong>Contáctanos:</strong></p>
                <p>Email: compusystem@gmail.com</p>
                <p>Teléfono: +51 995-655-898</p>
                <p>Dirección: Calle las Camelias #710, San Isidro 15046, Lima, Perú</p>
                <p>Envío gratis a partir de s/99.00</p>
            </div>
        </div>

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
