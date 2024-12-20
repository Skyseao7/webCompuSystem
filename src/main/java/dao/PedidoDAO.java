package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.DetallePedido;
import modelo.Pedido;
import modelo.Producto;
import util.Conexion;

public class PedidoDAO {

    public int GenerarPedido(Pedido obj) {
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        int result = 0;
        try {
            cn = Conexion.getConexion();
            cn.setAutoCommit(false);

            String sql = "INSERT INTO Pedido(id_cliente,fecha_pedido,monto,estado_pedido) VALUES(?,NOW(),?,?)";
            st = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, obj.getCliente().getIdCliente());
            st.setDouble(2, obj.getTotal());
            st.setString(3, obj.getEstado());
            result = st.executeUpdate();

            if (result > 0) {
                rs = st.getGeneratedKeys();

                if (rs.next()) {
                    int idPed = rs.getInt(1);

                    st = cn.prepareStatement("INSERT INTO Detalle_Pedido(id_pedido,id_producto,precio,cantidad) VALUES(?,?,?,?)");
                    for (DetallePedido carrito : obj.getDetalles()) {
                        st.setInt(1, idPed);
                        st.setInt(2, carrito.getProducto().getIdProducto());
                        st.setDouble(3, carrito.getProducto().getPrecio());
                        st.setInt(4, carrito.getCantidad());
                        st.executeUpdate();
                    }
                    cn.commit();
                }
            }

        } catch (Exception ex) {
            try {
                if (cn != null) {
                    cn.rollback();
                    result = 0;
                }
            } catch (SQLException ex1) {

            }
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (st != null) {
                    st.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ex) {

            }
        }
        return result;
    }

    public ArrayList<Pedido> ListarPorIdCliente(int id) {
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        ArrayList<Pedido> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT * FROM Pedido WHERE id_cliente = ?";
            st = cn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();

            while (rs.next()) {
                Pedido obj = new Pedido();
                obj.setIdPedido(rs.getInt("id_pedido"));
                obj.setFecha(rs.getString("fecha_pedido"));
                obj.setTotal(rs.getDouble("monto"));
                obj.setEstado(rs.getString("estado_pedido"));
                obj.setDetalles(ListarDetallePorIdPed(obj.getIdPedido()));
                lista.add(obj);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (st != null) {
                    st.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ex) {

            }
        }
        return lista;
    }

    public ArrayList<DetallePedido> ListarDetallePorIdPed(int idPed) {
        ArrayList<DetallePedido> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT p.imagen , p.p_nombre , d.precio, d.cantidad\n"
                    + "FROM `detalle_pedido` d INNER JOIN producto p ON p.id_producto = d.id_producto\n"
                    + "WHERE d.id_pedido = ?;";
            
            st = cn.prepareStatement(sql);
            st.setInt(1, idPed);
            rs = st.executeQuery();
            while(rs.next()){
                Producto p = new Producto();
                DetallePedido d = new DetallePedido();
                
                p.setImagen(rs.getString("imagen"));
                p.setpNombre(rs.getString("p_nombre"));
                p.setPrecio(rs.getDouble("precio"));
                d.setCantidad(rs.getInt("cantidad"));
                d.setProducto(p);
                lista.add(d);
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (st != null) {
                    st.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ex) {

            }
        }
        return lista;
    }
}
