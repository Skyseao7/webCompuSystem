package controlador;

import dao.ClienteDAO;
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
import modelo.Pago;
import modelo.Pedido;

public class PedidoControl extends HttpServlet {
    
    private PedidoDAO pedidoDao = new PedidoDAO();
    private ClienteDAO clienteDao = new ClienteDAO();
    
    private final String pagListar = "pagGestPedido.jsp";
    private final String pagRedirectListar = "PedidoControl?accion=listar";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String accion = request.getParameter("accion");
        
        switch (accion) {
            case "listar":
                listar(request, response);
            case "nuevo":
                nuevoPedido(request, response);
                break;
            case "guardar":
                guardar(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
            case "pagar_pedido":
                pagarPedido(request, response);
                break;
            case "buscar":
                buscarPedido(request, response);
                break;
            case "detalleHtml":
                detalleHtml(request, response);
                break;
        }
        
    }
    
    
    protected void detalleHtml(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        
        request.setAttribute("pedido", pedidoDao.buscarPedidoPorId(id));
        request.setAttribute("detalles", pedidoDao.listarDetallePedido(id));
        request.getRequestDispatcher("pagDetalleHistorial.jsp").forward(request, response);
    }
    
//    protected void historial(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        
//        if (request.getParameter("inicio") == null && request.getParameter("din") == null) {
//            request.setAttribute("lista", new ArrayList<>());
//        } else {
//            String inicio = request.getParameter("inicio");
//            String fin = request.getParameter("fin");
//            String estado = "Pagado";
//            request.setAttribute("lista", pedidoDao.listarPorFecha(inicio, fin, estado));
//            request.setAttribute("inicio", inicio);
//            request.setAttribute("fin", fin);
//        }
//        
//        request.getRequestDispatcher("pagHistorialPedido.jsp").forward(request, response);
//    }
    
    private void pagarPedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idPedido"));
        String metodo = request.getParameter("metodoPago");
        
        String result = pedidoDao.PagarPedido(id, metodo);
        
        if (result.equals("OK")) {
            request.getSession().setAttribute("success", "Pedido atendido y pagado correctamente!");
        } else {
            System.out.println(result);
            request.getSession().setAttribute("error", "No se pudo atender pago el pedido con id " + id);
        }
        response.sendRedirect(pagRedirectListar);
    }
    
    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        int result = pedidoDao.eliminarPedido(id);
        
        if (result > 0) {
            request.getSession().setAttribute("success", "Pedido con id " + id + " eliminado!");
        } else {
            request.getSession().setAttribute("error", "No se pudo eliminar el pedido con id " + id);
        }
        response.sendRedirect(pagRedirectListar);
    }
    
    protected void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        request.setAttribute("lista", pedidoDao.listarPedidosPorEstado("Pendiente"));
        request.getRequestDispatcher(pagListar).forward(request, response);
    }
    
    private void guardar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("INICIO GUARDADO");
        try {
            ArrayList<DetallePedido> detalles = (ArrayList<DetallePedido>) request.getSession().getAttribute("carrito");
            double monto = Double.parseDouble(request.getSession().getAttribute("total").toString());
            int idCliente = Integer.parseInt(request.getParameter("cliente"));
            
            Pedido objPedido = new Pedido();
            objPedido.setCliente(new Cliente(idCliente));
            objPedido.setPago(new Pago(monto));
            objPedido.setDetalles(detalles);
            
            String msg = pedidoDao.generarPedido(objPedido);
            
            if (msg.equals("OK")) {
                request.getSession().setAttribute("carrito", new ArrayList<>());
                request.getSession().setAttribute("total", 0);
                request.getSession().setAttribute("success", "Pedido generado correctamente");
            } else {
                request.getSession().setAttribute("error", msg);
            }
        } catch (Exception ex) {
            request.getSession().setAttribute("error", ex.getMessage());
        }
        
        response.sendRedirect("PedidoControl?accion=nuevo");
    }
    
    private void nuevoPedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pedido pedido = new Pedido();
        // Aquí obtén los datos del formulario
        // ...
        String msg = pedidoDao.generarPedido(pedido);
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("pagNuevoPedido.jsp").forward(request, response);
    }
    
    private void buscarPedido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idPedido = Integer.parseInt(request.getParameter("id"));
        Pedido pedido = pedidoDao.buscarPedidoPorId(idPedido);
        request.setAttribute("pedido", pedido);
        request.getRequestDispatcher("pagVerPedido.jsp").forward(request, response);
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
