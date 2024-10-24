package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import modelo.Cliente;
import util.Conexion;

public class ClienteDAO {
      public Cliente login(String correo, String password) {
        Cliente obj = null;
          Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cn = Conexion.getConexion();
            String sql = "select * from cliente where correo=? and password=?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                obj = new Cliente();
                obj.setIdCliente(rs.getInt("id_cliente"));
                obj.setNombre(rs.getString("nombre"));
                obj.setApellido(rs.getString("apellido"));
                obj.setCorreo(rs.getString("correo"));
                obj.setDireccion(rs.getString("direccion"));
                obj.setFechaRegistro(rs.getString("fecha_registro"));
                obj.setTelefono(rs.getString("telefono"));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return obj;
    }
      
      //registro
      public boolean registrarCliente(Cliente cliente) {
        Connection cn = null;
        PreparedStatement ps = null;

        try {
            cn = Conexion.getConexion();
            String sql = "INSERT INTO cliente (nombre, apellido, correo, password, direccion, fecha_registro, telefono) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = cn.prepareStatement(sql);
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getApellido());
            ps.setString(3, cliente.getCorreo());
            ps.setString(4, cliente.getPassword());
            ps.setString(5, cliente.getDireccion());
            ps.setString(6, cliente.getFechaRegistro());
            ps.setString(7, cliente.getTelefono());

            return ps.executeUpdate() > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
      
      public int actualizar(Cliente obj) {
        int result = 0;
        Connection cn = null;
        PreparedStatement st = null;
        try {
            cn = Conexion.getConexion();
            String sql = "UPDATE cliente SET nombre = ?, apellido = ?, correo = ?, password=?, direccion=?, fecha_registro=?, telefono = ? "
                    + " WHERE cliente_id = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, obj.getNombre());
            st.setString(2, obj.getApellido());
            st.setString(3, obj.getCorreo());
            st.setString(4, obj.getPassword());
            st.setString(5, obj.getDireccion());
            st.setString(6, obj.getFechaRegistro());
            st.setString(7, obj.getTelefono());
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
            String sql = "DELETE FROM cliente WHERE cliente_id = ?";
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
      
      public List<Cliente> listarTodos() {
        List<Cliente> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT id_cliente, nombre, apellido, correo, direccion, telefono, fecha_registro FROM cliente";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Cliente obj = new Cliente();
                obj.setIdCliente(rs.getInt("id_cliente"));
                obj.setNombre(rs.getString("nombre"));
                obj.setApellido(rs.getString("apellido"));
                obj.setCorreo(rs.getString("correo"));
                obj.setDireccion(rs.getString("direccion"));
                obj.setTelefono(rs.getString("telefono"));
                obj.setFechaRegistro("fecha_registro");
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
      
      public List<Cliente> listarTodosOrdAsc() {
        List<Cliente> lista = new ArrayList<>();
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT id_cliente, nombre, apellido, correo, direccion, telefono, fecha_registro FROM cliente order by nombre asc";
            st = cn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Cliente obj = new Cliente();
                obj.setIdCliente(rs.getInt("id_cliente"));
                obj.setNombre(rs.getString("nombre"));
                obj.setApellido(rs.getString("apellido"));
                obj.setCorreo(rs.getString("correo"));
                obj.setDireccion(rs.getString("direccion"));
                obj.setTelefono(rs.getString("telefono"));
                obj.setFechaRegistro("fecha_registro");
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
      
      
      public Cliente buscarPorId(int id) {
        Cliente obj = null;
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            cn = Conexion.getConexion();
            String sql = "SELECT cliente_id, nombre, correo, telefono, fecha_registro FROM cliente WHERE cliente_id = ?";
            st = cn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                obj = new Cliente();
                obj.setIdCliente(rs.getInt("cliente_id"));
                obj.setNombre(rs.getString("nombre"));
                obj.setCorreo(rs.getString("correo"));
                obj.setTelefono(rs.getString("telefono"));
                obj.setFechaRegistro("fecha_registro");
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
