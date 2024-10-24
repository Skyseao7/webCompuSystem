package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.Producto;
import util.Conexion;

public class ProductoDAO {

    public int agregar(Producto obj) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;
        try {
            cn = Conexion.getConexion();
            String sql = "INSERT INTO producto (p_nombre, descripcion, precio, stock, marca, categoria) VALUES (?, ?, ?, ?, ?, ?)";
            st = cn.prepareStatement(sql);
            st.setString(1, obj.getpNombre());
            st.setString(2, obj.getDescripcion());
            st.setDouble(3, obj.getPrecio());
            st.setInt(4, obj.getStock());
            st.setString(5, obj.getMarca());
            st.setString(6, obj.getCategoria());
            result = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
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
        return result;
    }

    public int actualizar(Producto obj) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;
        try {
            cn = Conexion.getConexion();
            String sql = "UPDATE producto SET p_nombre = ?, descripcion = ?, precio = ?, stock = ?, marca = ?, categoria = ? WHERE id_producto = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, obj.getpNombre());
            st.setString(2, obj.getDescripcion());
            st.setDouble(3, obj.getPrecio());
            st.setInt(4, obj.getStock());
            st.setString(5, obj.getMarca());
            st.setString(6, obj.getCategoria());
            st.setInt(7, obj.getIdProducto());
            result = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
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
        return result;
    }

    public int eliminar(int id) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;
        try {
            cn = Conexion.getConexion();
            String sql = "DELETE FROM producto WHERE id_producto = ?";
            st = cn.prepareStatement(sql);
            st.setInt(1, id);
            result = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
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
        return result;
    }

    public List<Producto> listarTodos() {
        List<Producto> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT id_producto, p_nombre, descripcion, precio, stock, marca, categoria FROM producto";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Producto obj = new Producto();
                obj.setIdProducto(rs.getInt("id_producto"));
                obj.setpNombre(rs.getString("p_nombre"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setStock(rs.getInt("stock"));
                obj.setMarca(rs.getString("marca"));
                obj.setCategoria(rs.getString("categoria"));
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
    
      public List<Producto> listarTodosOrderAsc() {
        List<Producto> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT id_producto, p_nombre, descripcion, precio, categoria, stock "
                    + " FROM producto"
                    + " ORDER By nombre asc";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Producto obj = new Producto();
                obj.setIdProducto(rs.getInt("id_producto"));
                obj.setpNombre(rs.getString("p_nombre"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setCategoria(rs.getString("categoria"));
                obj.setStock(rs.getInt("stock"));
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

    public Producto buscarPorId(int id) {
        Producto obj = null;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT id_producto, p_nombre, descripcion, precio, stock, marca, categoria FROM producto WHERE id_producto = ?";
            st = cn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                obj = new Producto();
                obj.setIdProducto(rs.getInt("id_producto"));
                obj.setpNombre(rs.getString("p_nombre"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setStock(rs.getInt("stock"));
                obj.setMarca(rs.getString("marca"));
                obj.setCategoria(rs.getString("categoria"));
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
        return obj;
    }
}
