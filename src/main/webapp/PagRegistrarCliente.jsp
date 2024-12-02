<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>CompuSystem | Login</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <!-- Css Styles -->
        <link rel="stylesheet" href="css/login.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body>
        <jsp:include page="components/Mensaje.jsp"/>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="ClienteControlador" method="post">
                    <h1>Crea una cuenta</h1>
                    <span>Usa tu correo para registrarte</span>
                    <div class="form-group">
                        <input value="${cliente.nombre}" type="text" required="" name="nombre" placeholder="Nombre*" />
                        <input value="${cliente.apellido}" type="text" required="" name="apellido" placeholder="Apellido*" />
                    </div>
                    <div class="form-group">
                        <input value="${cliente.telefono}" type="tel" name="telefono" placeholder="Teléfono" />
                        <input value="${cliente.direccion}" type="text" name="direccion" placeholder="Dirección" />
                    </div>
                    <input value="${cliente.correo}" type="email" required="" name="correo" placeholder="Correo*" />
                    <input value="${cliente.password}" type="password" required="" name="password" placeholder="Contraseña*" />

                    <span class="obligatorio">*Obligatorio</span>

                    <input type="hidden" name="accion" value="guardar"/>
                    <button type="submit">Registrarse</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="#">
                    <h1>Accede a tu cuenta</h1>
                    <span>Usa tu correo</span>
                    <input type="email" placeholder="Correo" />
                    <input type="password" placeholder="Contraseña" />
                    <a href="#">Olvidaste tu contraseña?</a>
                    <button>Acceder</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Inicia sesión</h1>
                        <p>Bienvenido! Inicia sesión con tu cuenta.</p>
                        <button class="ghost" id="signIn">Login</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Crea una cuenta</h1>
                        <p>Crea una nueva cuenta para aprovechar los beneficios de una experiencia de compra personalizada.</p>
                        <button class="ghost" id="signUp">Registrarse</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Js Plugins -->
        <script src="js/login.js"></script>

    </body>
</html>
