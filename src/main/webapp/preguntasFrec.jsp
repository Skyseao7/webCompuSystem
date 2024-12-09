<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>CompuSystem | Preguntas Frecuentes</title>

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
        <link rel="stylesheet" href="css/pregFrec.css" type="text/css">
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <jsp:include page="components/Navegacion.jsp" />
        <div class="about-container">
            <section class="faq">
            <h1>Preguntas Frecuentes</h1>
            <div class="faq-item">
                <button class="faq-question">¿Cuánto tiempo tarda en llegar mi pedido?</button>
                <div class="faq-answer">
                    <p>El tiempo de entrega depende de tu ubicación. Generalmente, demora entre 3 a 7 días hábiles.</p>
                </div>
            </div>
            <div class="faq-item">
                <button class="faq-question">¿Puedo pagar contra entrega?</button>
                <div class="faq-answer">
                    <p>Sí, el pago contra entrega está disponible en algunas zonas seleccionadas. Verifica la disponibilidad al realizar tu pedido.</p>
                </div>
            </div>
            <div class="faq-item">
                <button class="faq-question">¿Los productos tienen garantía?</button>
                <div class="faq-answer">
                    <p>Sí, todos nuestros productos tienen garantía mínima de un año. Consulta la descripción de cada producto para más detalles.</p>
                </div>
            </div>
            <div class="faq-item">
                <button class="faq-question">¿Cómo puedo rastrear mi pedido?</button>
                <div class="faq-answer">
                    <p>Para rastrear tu pedido, inicia sesión en tu cuenta y ve a la sección "Mis pedidos".</p>
                </div>
            </div>
            <div class="faq-item">
                <button class="faq-question">¿Qué métodos de pago aceptan?</button>
                <div class="faq-answer">
                    <p>Aceptamos tarjetas de crédito, débito, transferencias bancarias y pagos en efectivo a través de agentes autorizados.</p>
                </div>
            </div>
        </section>
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
        <script src="js/pregFrec.js"></script>
    </body>
</html>
