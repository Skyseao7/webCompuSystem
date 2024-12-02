package controlador;

import dao.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;

public class ClienteControlador extends HttpServlet {

    private final String pagNuevo = "PagRegistrarCliente.jsp";
    private ClienteDAO cliDao = new ClienteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "nuevo":
                Nuevo(request, response);
                break;
            case "guardar":
                Guardar(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    protected void Nuevo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("cliente", new Cliente()); //recibe un objeto nuevo de tipo modelo Cliente
        request.getRequestDispatcher(pagNuevo).forward(request, response);
    }

    protected void Guardar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Cliente obj = new Cliente();
        obj.setNombre(request.getParameter("nombre"));
        obj.setApellido(request.getParameter("apellido"));
        obj.setTelefono(request.getParameter("telefono"));
        obj.setDireccion(request.getParameter("direccion"));
        obj.setCorreo(request.getParameter("correo"));
        obj.setPassword(request.getParameter("password"));

        if (cliDao.ExisteCorreo(obj.getCorreo().trim()) == false) {
            int result = cliDao.Guardar(obj);

            if (result > 0) {
                request.getSession().setAttribute("success", "Cuenta registrada!");
                response.sendRedirect("ClienteControlador?accion=nuevo");
                return;
            } else {
                request.getSession().setAttribute("error", "No se pudo registrar la cuenta.");
            }
        }else{
            request.getSession().setAttribute("error", "El correo"+obj.getCorreo()+"ya se encuentra registrado.");
        }

        request.setAttribute("cliente", obj); //recibe un objeto nuevo de tipo modelo Cliente
        request.getRequestDispatcher(pagNuevo).forward(request, response);

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
