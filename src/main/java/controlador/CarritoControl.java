package controlador;

import com.google.gson.Gson;
import dao.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DetallePedido;
import modelo.Producto;

public class CarritoControl extends HttpServlet {

    private ProductoDAO productoDao = new ProductoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "listar":
                Listar(request, response);
                break;
            case "agregar":
                Agregar(request, response);
                break;
            case "eliminar":
                Eliminar(request, response);
                break;
        }
    }

    protected void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HashMap<String, Object> data = new HashMap<>();
        try {
            int indice = Integer.parseInt(request.getParameter("indice"));
            ArrayList<DetallePedido> lista = ObtenerSesion(request);
            lista.remove(indice);
            GuardarSesion(request, lista);

            data.put("msg", "OK");
        } catch (Exception ex) {
            data.put("msg", ex.getMessage());
        }

        out.print(new Gson().toJson(data));
    }

    protected void Agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HashMap<String, Object> data = new HashMap<>();
        try {
            int idProd = Integer.parseInt(request.getParameter("id"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            DetallePedido objDet = new DetallePedido();
            Producto objProd = productoDao.buscarPorId(idProd);
            objDet.setCantidad(cantidad);
            objDet.setProducto(objProd);

            AgregarCarrito(request, objDet);

            data.put("msg", "OK");
        } catch (Exception ex) {
            data.put("msg", ex.getMessage());
        }

        out.print(new Gson().toJson(data));
    }

    protected void Listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HashMap<String, Object> data = new HashMap<>();
        ArrayList<DetallePedido> lista = ObtenerSesion(request);

        data.put("carrito", lista);
        data.put("total", ImporteTotal(lista));

        out.print(new Gson().toJson(data));
    }

    public void AgregarCarrito(HttpServletRequest request, DetallePedido detalle) {
        ArrayList<DetallePedido> lista = ObtenerSesion(request);
        int posc = ExisteProducto(lista, detalle.getProducto().getIdProducto());

        if (posc == -1) {
            lista.add(detalle);
        } else {
            DetallePedido objDet = lista.get(posc);
            objDet.AumentarCantidad(detalle.getCantidad());
        }

        GuardarSesion(request, lista);
    }

    public ArrayList<DetallePedido> ObtenerSesion(HttpServletRequest request) {
        ArrayList<DetallePedido> lista;

        if (request.getSession().getAttribute("carrito") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<DetallePedido>) request.getSession().getAttribute("carrito");
        }
        return lista;
    }

    public int ExisteProducto(ArrayList<DetallePedido> lista, int idProd) {

        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getProducto().getIdProducto()== idProd) {
                return i;
            }
        }
        return -1;
    }

    public double ImporteTotal(ArrayList<DetallePedido> lista) {
        double total = 0;
        for (DetallePedido item : lista) {
            total += item.Importe();
        }
        return total;
    }

    public void GuardarSesion(HttpServletRequest request, ArrayList<DetallePedido> lista) {
        request.getSession().setAttribute("carrito", lista);
        request.getSession().setAttribute("total", ImporteTotal(lista));
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
