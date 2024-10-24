package controlador;

import dao.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;

public class ClienteControl extends HttpServlet {

    private ClienteDAO clienteDAO = new ClienteDAO();
    private final String pagListar = "pagGestCliente.jsp";
    private final String pagNuevo = "pagNuevoCliente.jsp";  
    private final String pagRedirectListar = "ClienteControl?accion=listar"; 

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "login":
                login(request, response);
                break;
            case "registro":
                registrarCliente(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    
    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        Cliente cliente = clienteDAO.login(correo, password);

        if (cliente != null) {
            request.getSession().setAttribute("cliente", cliente);
            response.sendRedirect("PedidoControl?accion=listar");
        } else {
            request.getSession().setAttribute("error", "Correo y/o contraseña incorrecto");
            request.setAttribute("correo", correo);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    
    protected void registrarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cliente cliente = new Cliente();
        cliente.setNombre(request.getParameter("nombre"));
        cliente.setApellido(request.getParameter("apellido"));
        cliente.setCorreo(request.getParameter("correo"));
        cliente.setPassword(request.getParameter("password"));
        cliente.setDireccion(request.getParameter("direccion"));
        cliente.setFechaRegistro(request.getParameter("fecha_registro"));
        cliente.setTelefono(request.getParameter("telefono"));

        boolean registrado = clienteDAO.registrarCliente(cliente);

        if (registrado) {
            request.getSession().setAttribute("cliente", cliente);
            response.sendRedirect("index.jsp");
        } else {
            request.getSession().setAttribute("error", "No se pudo registrar el cliente");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
    
    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("cliente");
        response.sendRedirect("index.jsp");
    }
    
    
    protected void Autentificarse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        Cliente obj = clienteDAO.login(correo, password);

        if (obj != null) {
            request.getSession().setAttribute("cliente", obj);

            response.sendRedirect("PedidoControl?accion=listar");
        } else {
            request.getSession().setAttribute("error", "Correo y/o contraseña incorrecto");
            request.setAttribute("correo", correo);
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
