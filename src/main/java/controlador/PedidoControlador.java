package controlador;

import dao.PedidoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.DetallePedido;
import modelo.Pedido;
import util.Carrito;

public class PedidoControlador extends HttpServlet {

    private PedidoDAO pedidoDao = new PedidoDAO();
    private Carrito objCarrito = new Carrito();

    private final String pagLogin = "PagRegistrarCliente.jsp";
    private final String pagCarrito = "PagCarrito.jsp";
    private final String pagMisPedidos = "PagMisPedidos.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "procesar":
                Procesar(request, response);
                break;
            case "mis_pedidos":
                MisPedidos(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    protected void MisPedidos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getSession().getAttribute("usuario") != null) {
            Cliente objCli = (Cliente) request.getSession().getAttribute("usuario");
            ArrayList<Pedido> listaPed = pedidoDao.ListarPorIdCliente(objCli.getIdCliente());
            request.setAttribute("pedidos", listaPed);
            request.getRequestDispatcher(pagMisPedidos).forward(request, response);
        } else {
            request.getRequestDispatcher(pagLogin).forward(request, response);
        }
    }

    protected void Procesar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getSession().getAttribute("usuario") != null) {
            Pedido objPed = new Pedido();
            Cliente objCli = (Cliente) request.getSession().getAttribute("usuario");
            ArrayList<DetallePedido> lista = objCarrito.ObtenerSesion(request);

            double total = objCarrito.ImporteTotal(lista);

            objPed.setCliente(objCli);
            objPed.setDetalles(lista);
            objPed.setTotal(total);
            objPed.setEstado("Pendiente");

            int result = pedidoDao.GenerarPedido(objPed);

            if (result > 0) {
                // Limpiar el carrito de la sesión
                objCarrito.GuardarSesion(request, new ArrayList<DetallePedido>());
                // Generar factura o identificación del pedido
                String factura = "PED-" + objPed.getIdPedido();

                // Construir el mensaje para el QR
                String resultado = "Gracias por su compra " + objCli.getNombre() + ", " + objCli.getApellido();
                resultado += "\nFactura generada: " + factura;
                resultado += "\nTotal a pagar: " + total;

                // Redirigir al JSP que genera el QR
                request.setAttribute("qrData", resultado); // Pasar los datos al JSP
                request.getRequestDispatcher("generaQr.jsp").forward(request, response);

            } else {
                request.getSession().setAttribute("error", "No se pudo procesar el pedido.");
                request.getRequestDispatcher(pagCarrito).forward(request, response);
            }

        } else {
            request.getSession().setAttribute("error", "Debe autentificarse primero antes de procesar su compra");
            request.getRequestDispatcher(pagLogin).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
