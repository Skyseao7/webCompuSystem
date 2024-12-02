
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Cliente;
import util.Conexion;

public class ClienteDAO {
    public int Guardar(Cliente obj) {
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        
        int result = 0;
        try{
            cn=Conexion.getConexion();
            String sql = "insert into Cliente(nombre,apellido,correo,password,direccion,telefono) values(?,?,?,?,?,?)";
            st = cn.prepareStatement(sql);
            st.setString(1, obj.getNombre().trim());
            st.setString(2, obj.getApellido().trim());
            st.setString(3, obj.getCorreo().trim());
            st.setString(4, obj.getPassword());
            st.setString(5, obj.getDireccion());
            st.setString(6, obj.getTelefono().trim());
            
            result = st.executeUpdate();
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                if(cn!=null){
                    cn.close();
                }
                if(st!=null){
                    st.close();
                }
            }catch(Exception ex){
                
            }
        }
        return result;
    }
    
    public boolean ExisteCorreo(String correo) {
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        
        try{
            cn=Conexion.getConexion();
            String sql = "select count (1) from Cliente where correo = ?";
            st = cn.prepareStatement(sql);
            st.setString(1, correo);
            rs = st.executeQuery();
            
            if(rs.next()){
                return(rs.getInt(1)>0);
            }
            
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                if(cn!=null){
                    cn.close();
                }
                if(st!=null){
                    st.close();
                }
                if(rs!=null){
                    rs.close();
                }
            }catch(Exception ex){
                
            }
        }
        return false;
    }
}
