package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.Producto;
import util.Conexion;

public class ProductoDAO {
    
    public ArrayList<Producto> listarTodos() {
        ArrayList<Producto> lista = new ArrayList<Producto>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "select*from producto";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Producto obj = new Producto();
                obj.setIdProducto(rs.getInt("id_producto"));
                obj.setpNombre(rs.getString("p_nombre"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setStock(rs.getInt("stock"));
                obj.setCategoria(rs.getString("categoria"));
                obj.setImagen(rs.getString("imagen"));
                lista.add(obj);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }
}
