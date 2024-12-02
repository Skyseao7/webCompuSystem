
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Cliente;
import util.Conexion;

public class AuthDAO {
    public Cliente Login(String correo, String password) {
        Connection cn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        
        Cliente obj = null;
        try{
            cn=Conexion.getConexion();
            String sql = "select * from Cliente where correo = ? and password = ?";
            st=cn.prepareStatement(sql);
            st.setString(1, correo);
            st.setString(2, password);
            rs = st.executeQuery();
            
            if(rs.next()){ //valida la info
                obj = new Cliente();
                obj.setIdCliente(rs.getInt("id_cliente"));
                obj.setNombre(rs.getString("nombre"));
                obj.setApellido(rs.getString("apellido"));
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
        return obj;
    }
}
