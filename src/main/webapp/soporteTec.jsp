<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>CompuSystem | Soporte Técnico</title>

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

        <div class="container">
            <h2 class="section-title">Soporte Técnico</h2>
            <p class="section-description">
                Estamos comprometidos con brindarte el mejor servicio para resolver cualquier inconveniente que puedas tener con nuestros productos o servicios.
            </p>

            <div class="card-container">
                <!-- Card 1 -->
                <div class="card">
                    <h4 class="card-title">Problemas Comunes</h4>
                    <ul class="card-list">
                        <li><b>Configuración de Equipos:</b> Ayuda con la instalación y configuración de tus dispositivos.</li>
                        <li><b>Actualización de Software:</b> Guías para mantener tus programas y drivers al día.</li>
                        <li><b>Resolución de Errores:</b> Soluciones a problemas comunes relacionados con hardware y software.</li>
                    </ul>
                </div>

                <!-- Card 2 -->
                <div class="card">
                    <h4 class="card-title">Medios de Contacto</h4>
                    <ul class="card-list">
                        <li><b>Correo Electrónico:</b> soporte@compusystem.com</li>
                        <li><b>Teléfono:</b> +51 995-655-898</li>
                        <li><b>Horario de Atención:</b> Lunes a Viernes, 9:00 AM - 6:00 PM</li>
                    </ul>
                </div>

                <!-- Card 3 -->
                <div class="card">
                    <h4 class="card-title">Opciones de Soporte Adicional</h4>
                    <ul class="card-list">
                        <li><b>Soporte Remoto:</b> Nuestros técnicos pueden acceder a tu equipo de forma segura para resolver problemas en tiempo real.</li>
                        <li><b>Asistencia Presencial:</b> Visítanos en nuestras oficinas para ayuda más personalizada.</li>
                        <li><b>Garantías y Devoluciones:</b> Gestiona cambios y reparaciones de productos bajo garantía.</li>
                    </ul>
                </div>

                <!-- Card 4 -->
                <div class="card">
                    <h4 class="card-title">Preguntas Frecuentes</h4>
                    <ul class="card-list">
                        <li><b>¿Cómo puedo descargar los drivers más recientes?</b><br>
                            Visita la página oficial del fabricante de tu dispositivo y busca en la sección de descargas.</li>
                        <li><b>Mi equipo no enciende, ¿qué hago?</b><br>
                            Verifica las conexiones de corriente y asegúrate de que el interruptor esté activado. Si persiste, contáctanos.</li>
                        <li><b>¿Cuentan con servicios de mantenimiento preventivo?</b><br>
                            Sí, ofrecemos planes de mantenimiento para prolongar la vida útil de tus equipos.</li>
                    </ul>
                </div>
                <p> </p>
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
        <script src="js/pregFrec.js"></script>
    </body>
</html>
