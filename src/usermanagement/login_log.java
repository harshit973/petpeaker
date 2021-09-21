package usermanagement;

import java.sql.CallableStatement;
import java.sql.Connection;

import databasepackage.database;

public class login_log implements Runnable {
    String email="";
    public login_log(String email){
        this.email=email;
    }
    @Override
    synchronized public void run() {
        try{
        	Connection conn=new database().connect();
        	CallableStatement st=conn.prepareCall("call storelogs(?)");
            st.setString(1, email);            
            st.execute();                
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
}