<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generar Código QR</title>
    </head>
    <body>
        <h1>¡Gracias por su compra!</h1>
        <p>Se ha generado su código QR con los siguientes datos:</p>
        <pre>
            <%= request.getAttribute("qrData")%>
        </pre>

        <h2>Su código QR:</h2>
        <img 
            src="https://api.qrserver.com/v1/create-qr-code/?size=250x250&data=<%= java.net.URLEncoder.encode((String) request.getAttribute("qrData"), "UTF-8")%>" 
            alt="Código QR">

        <p>Serás redirigido a tus pedidos en 1 minuto...</p>
        <script>
            setTimeout(() => {
                window.location.href = "PedidoControlador?accion=mis_pedidos";
            }, 10000); // Redirige después de 5 segundos
        </script>
    </body>
</html>
