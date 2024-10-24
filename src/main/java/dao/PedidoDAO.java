package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Cliente;
import modelo.DetallePedido;
import modelo.Pago;
import modelo.Pedido;
import modelo.Producto;
import util.Conexion;

public class PedidoDAO {

    // Método para generar un nuevo pedido
    public String generarPedido(Pedido pedido) {
        String msg = "";
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            cn.setAutoCommit(false); // Deshabilitar el autocommit

            // Insertar el pedido
            st = cn.prepareStatement("{call sp_insertar_pedido(?,?,?,?)}");
            st.setInt(1, pedido.getCliente().getIdCliente());
            st.setString(2, pedido.getFechaPedido());
            st.setDouble(3, pedido.getPago().getMonto());
            st.setString(4, pedido.getEstado());
            
            rs = st.executeQuery();
            
            if (rs.next()) {
                int idPedido = rs.getInt(1); // ID del pedido generado
                msg = "Pedido generado con éxito, ID: " + idPedido;
                // Puedes agregar aquí más lógica si es necesario (detalles del pedido, etc.).
            }
            cn.commit();
        } catch (SQLException ex) {
            try {
                if (cn != null) {
                    cn.rollback(); // Realizar rollback en caso de error
                }
            } catch (SQLException e) {
                System.out.println("Aplicando [ROLLBACK]: " + e.getMessage());
            }
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) cn.close();
                if (st != null) st.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return msg;
    }
    
    // Método para listar pedidos por estado
    public List<Pedido> listarPedidosPorEstado(String estado) {
        List<Pedido> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT p.id_pedido, c.nombre AS nombre_cliente, p.fecha_pedido, p.total " +
                         "FROM pedido p " +
                         "INNER JOIN cliente c ON c.id_cliente = p.id_cliente " +
                         "WHERE p.estado_pedido = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, estado);
            rs = st.executeQuery();

            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setIdPedido(rs.getInt("id_pedido"));
                pedido.setCliente(new Cliente(rs.getString("nombre_cliente")));
                pedido.setFechaPedido(rs.getString("fecha_pedido"));
                pedido.setPago(new Pago(rs.getDouble("total")));
                lista.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    
    
//    public List<Pedido> listarPorFecha(String inicio, String fin, String estado) {
//        List<Pedido> lista = new ArrayList<>();
//        Connection cn = null;
//        PreparedStatement st = null;
//        ResultSet rs = null;
//        try {
//            cn = Conexion.getConexion();
//            String sql = "select p.pedido_id , c.nombre as nombre_cliente, m2.nombre as nombre_mozo ,"
//                    + "m1.numero_mesa,p2.monto_total , p.fecha_pedido,p2.metodo_pago \n"
//                    + "from pedido p \n"
//                    + "inner join cliente c ON c.cliente_id = p.cliente_id\n"
//                    + "inner join mesa m1 ON m1.mesa_id = p.mesa_id\n"
//                    + "inner join mozo m2 ON m2.mozo_id = p.mozo_id\n"
//                    + "inner join pago p2 ON p2.pedido_id = p.pedido_id\n"
//                    + "where p.estado = ? and (DATE_FORMAT( p.fecha_pedido,'%Y-%m-%d') between ? and ? )";
//            st = cn.prepareStatement(sql);
//            st.setString(1, estado);
//            st.setString(2, inicio);
//            st.setString(3, fin);
//
//            rs = st.executeQuery();
//            while (rs.next()) {
//                Pedido objPedido = new Pedido();
//                objPedido.setIdPedido(rs.getInt("pedido_id"));
//                objPedido.setCliente(new Cliente(rs.getString("nombre_cliente")));
//                objPedido.setMozo(new Mozo(rs.getString("nombre_mozo")));
//                objPedido.setMesa(new Mesa(rs.getString("numero_mesa")));
//                    objPedido.setPago(new Pago(rs.getDouble("monto_total"),rs.getString("metodo_pago")));
//                objPedido.setFechaPedido(rs.getString("fecha_pedido"));
//                lista.add(objPedido);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (st != null) {
//                    st.close();
//                }
//                if (cn != null) {
//                    cn.close();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//        return lista;
//    }
    
    // Método para buscar un pedido por ID
    public Pedido buscarPedidoPorId(int idPedido) {
        Pedido pedido = null;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT p.id_pedido, c.nombre AS nombre_cliente, p.fecha_pedido, p.total, p.estado_pedido " +
                         "FROM pedido p " +
                         "INNER JOIN cliente c ON c.id_cliente = p.id_cliente " +
                         "WHERE p.id_pedido = ?";
            st = cn.prepareStatement(sql);
            st.setInt(1, idPedido);
            rs = st.executeQuery();

            if (rs.next()) {
                pedido = new Pedido();
                pedido.setIdPedido(rs.getInt("id_pedido"));
                pedido.setCliente(new Cliente(rs.getString("nombre_cliente")));
                pedido.setFechaPedido(rs.getString("fecha_pedido"));
                pedido.setPago(new Pago(rs.getDouble("total")));
                pedido.setEstado(rs.getString("estado_pedido"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return pedido;
    }

    // Método para eliminar un pedido
    public int eliminarPedido(int idPedido) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;
        try {
            cn = Conexion.getConexion();
            String sql = "{call sp_eliminar_pedido(?)}";
            st = cn.prepareStatement(sql);
            st.setInt(1, idPedido);
            result = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (st != null) st.close();
                if (cn != null) cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public String PagarPedido(int idPedido, String metodoPago) {

        String msg = "";
        int result = 0;

        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            st = cn.prepareStatement("{call sp_pagar_pedido(?,?)}");
            st.setInt(1, idPedido);
            st.setString(2, metodoPago);
            rs = st.executeQuery();

            if (rs.next()) {
                result = rs.getInt(1);
                msg = result > 0 ? "OK" : rs.getString(2);
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
            } catch (SQLException ex) {
            }
        }

        return msg;
    }

    public List<DetallePedido> listarDetallePedido(int idPedido) {
        List<DetallePedido> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "select categoria, descripcion , p_nombre, d.precio, cantidad\n"
                    + "from detalle_pedido d \n"
                    + "inner join producto p on p.producto_id = d.producto_id\n"
                    + "where pedido_id = ?";
            st = cn.prepareStatement(sql);
            st.setInt(1, idPedido);

            rs = st.executeQuery();
            while (rs.next()) {
                DetallePedido objPedido = new DetallePedido();
                Producto objProducto = new Producto();

                objProducto.setCategoria(rs.getString("categoria"));
                objProducto.setDescripcion(rs.getString("descripcion"));
                objProducto.setpNombre(rs.getString("p_nombre"));
                objProducto.setPrecio(rs.getDouble("precio"));
                objPedido.setCantidad(rs.getInt("cantidad"));
                objPedido.setProducto(objProducto);
                lista.add(objPedido);
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
