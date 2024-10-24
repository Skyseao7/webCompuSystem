package controlador;

import com.google.gson.Gson;
import dao.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;

public class ProductoControl extends HttpServlet {

    private ProductoDAO productoDao = new ProductoDAO();
    private final String pagListar = "pagGestProducto.jsp";
    private final String pagNuevo = "pagNuevoProducto.jsp";
    private final String pagRedirectListar = "ProductoControl?accion=listar";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "listar":
                listar(request, response);
                break;
            case "nuevo":
                nuevo(request, response);
                break;
            case "guardar":
                guardar(request, response);
                break;
            case "editar":
                editar(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
            case "listarJson":
                listarJson(request, response);
                break;
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        int result = productoDao.eliminar(id);

        if (result > 0) {
            request.getSession().setAttribute("success", "Producto eliminado!");
        } else {
            request.getSession().setAttribute("error", "No se pudo eliminar el producto.");
        }
        response.sendRedirect(pagRedirectListar);
    }

    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Producto obj = productoDao.buscarPorId(id);

        if (obj != null) {
            request.setAttribute("producto", obj);
            request.getRequestDispatcher(pagNuevo).forward(request, response);
        } else {
            request.getSession().setAttribute("error", "No se encontro producto con ID " + id);
            response.sendRedirect(pagRedirectListar);
        }
    }

    private void guardar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto obj = new Producto();
        obj.setIdProducto(Integer.parseInt(request.getParameter("id")));
        obj.setpNombre(request.getParameter("nombre"));
        obj.setDescripcion(request.getParameter("descripcion"));
        obj.setPrecio(Double.parseDouble(request.getParameter("precio")));
        obj.setStock(Integer.parseInt(request.getParameter("stock")));
        obj.setMarca(request.getParameter("marca"));
        obj.setCategoria(request.getParameter("categoria"));

        int result;
        if (obj.getIdProducto()== 0) {
            result = productoDao.agregar(obj);
        } else {
            result = productoDao.actualizar(obj);
        }

        if (result > 0) {
            request.getSession().setAttribute("success", "Producto guardado con éxito!");
            response.sendRedirect(pagRedirectListar);
        } else {
            request.getSession().setAttribute("error", "Error al guardar producto.");
            request.setAttribute("producto", obj);
            request.getRequestDispatcher(pagNuevo).forward(request, response);
        }
    }

     private void nuevo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("producto", new Producto());
        request.getRequestDispatcher(pagNuevo).forward(request, response);
    }

    protected void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("productos", productoDao.listarTodos());
        request.getRequestDispatcher(pagListar).forward(request, response);
    }

    protected void listarJson(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        List<Producto> lista = productoDao.listarTodosOrderAsc();
        out.print(new Gson().toJson(lista));
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
