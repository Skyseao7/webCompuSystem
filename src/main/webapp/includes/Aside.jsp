<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">

        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <i class="mdi mdi-circle-outline menu-icon"></i>
                <span class="menu-title">Gestión</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="ProductoControl?accion=listar">Producto</a></li>
                    <li class="nav-item"> <a class="nav-link" href="ClienteControl?accion=listar">Cliente</a></li>
                    <li class="nav-item"> <a class="nav-link" href="MesaControl?accion=listar">Mesa</a></li>
                    <li class="nav-item"> <a class="nav-link" href="MozoControl?accion=listar">Mozo</a></li>
                </ul>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#pedidos" aria-expanded="false" aria-controls="auth">
                <i class="mdi mdi-chart-pie menu-icon"></i>
                <span class="menu-title">Pedidos</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="pedidos">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="PedidoControl?accion=nuevo"> Nuevo Pedido </a></li>
                    <li class="nav-item"> <a class="nav-link" href="PedidoControl?accion=listar"> Mis Pedidos </a></li>
                    <li class="nav-item"> <a class="nav-link" href="PedidoControl?accion=historial"> Consulta Historial por fecha</a></li>
                    <li class="nav-item"> <a class="nav-link" href="PedidoControl?accion=historial_por_mozo"> Consulta historial por mozo</a></li>

                </ul>
            </div>
        </li>


        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#reporte" aria-expanded="false" aria-controls="auth">
                <i class="mdi mdi-chart-pie menu-icon"></i>
                <span class="menu-title">Reporte</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="reporte">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="ReporteControl?accion=total_x_annio"> Total Por año </a></li>
                    <li class="nav-item"> <a class="nav-link" href="ReporteControl?accion=productos_x_annio"> Productos Por año </a></li>
                  </ul>
            </div> 
        </li>

    </ul>
</nav>