package usermanagement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import databasepackage.database;

public class getuser {
	static String sql="";
    private static ResultSet adminfetcher(String email,String password) throws SQLException, ClassNotFoundException {
    	sql="SELECT * FROM userdata WHERE email=? and mode>=100";
        PreparedStatement st2=new database().connect().prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);            
        st2.setString(1,email);
        return st2.executeQuery();    	    	
    }    			
    private static ResultSet datafetcher2(String email,String password) throws SQLException, ClassNotFoundException {
    	sql="SELECT * FROM userdata WHERE email=? and mode between 0 and 99";
        PreparedStatement st2=new database().connect().prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);            
        st2.setString(1,email);
        return st2.executeQuery();    	    	
    }    		
    private static ResultSet datafetcher(String email) throws SQLException, ClassNotFoundException {
    	sql="SELECT * FROM userdata WHERE email=? and mode between 0 and 99";    	
        PreparedStatement st2=new database().connect().prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);            
        st2.setString(1,email);
        return st2.executeQuery();    	    	
    }        
    public static HashMap<String,Object> fetchuser(String text) throws ClassNotFoundException,SQLException {        
        HashMap<String,Object> data=new HashMap<String,Object>();        
        ArrayList<String> address=new ArrayList<String>();        
        ResultSet rs=datafetcher(text);
        if(rs.first()){
            data.put("uid",rs.getInt("id"));                                	
            data.put("firstname",rs.getString("firstname"));
            data.put("lastname",rs.getString("lastname"));            
            data.put("gender",rs.getBoolean("gender"));            
            data.put("mode",rs.getString("mode"));                        
            data.put("accnumber",rs.getInt("accnumber"));                                    
            data.put("ifsc",rs.getInt("ifsc"));                                    
            data.put("bank",rs.getInt("bank"));                                    
            data.put("email",text);            
            address.add(rs.getString("address"));
            while(rs.next()) {
	            address.add(rs.getString("address"));	            	
            }
            data.put("address",address);
            data.put("user",true);            
        }
        else{
            data=null;
        }
        return data;
    }	    
	public static HashMap<String,Object> fetchuser(String text,String password) throws ClassNotFoundException,SQLException {        
	    HashMap<String,Object> data=new HashMap<String,Object>();        
	    ResultSet rs;
	    ArrayList<String> address=new ArrayList<String>();
	   	rs=datafetcher2(text,password);        	
	    if(rs.first()){
	        if(authenticator.authenticate(password,rs.getString("password"))){
	            data.put("uid",String.valueOf(rs.getInt("id")));                                	
	            data.put("firstname",rs.getString("firstname"));
	            data.put("lastname",rs.getString("lastname"));            
	            data.put("gender",rs.getBoolean("gender"));            
	            data.put("mode",rs.getString("mode"));                        
	            data.put("accnumber",rs.getInt("accnumber"));                                    
	            data.put("ifsc",rs.getInt("ifsc"));                                    
	            data.put("bank",rs.getInt("bank"));                                    
	            data.put("email",text);            
	            address.add(rs.getString("address"));
	            while(rs.next()) {
		            address.add(rs.getString("address"));	            	
	            }
	            data.put("address",address);
	            data.put("user",true);            
	        }
	        else{
	            data.put("user",false);
	        }
	    }
	    else{
	        data.put("user",null);
	    }
	    return data;
	}
	public static HashMap<String,Object> fetchadmin(String text,String password) throws ClassNotFoundException,SQLException {        
	    HashMap<String,Object> data=new HashMap<String,Object>();        
	    ResultSet rs;
	    ArrayList<String> address=new ArrayList<String>();
	   	rs=adminfetcher(text,password);        	
	    if(rs.first()){
	        if(authenticator.authenticate(password,rs.getString("password"))){
	            data.put("uid",String.valueOf(rs.getInt("id")));                                	
	            data.put("firstname",rs.getString("firstname"));
	            data.put("lastname",rs.getString("lastname"));            
	            data.put("email",text);            	            
	            data.put("gender",rs.getBoolean("gender"));            
	            data.put("mode",rs.getString("mode"));                        
	            data.put("accnumber",rs.getInt("accnumber"));                                    
	            data.put("ifsc",rs.getInt("ifsc"));                                    
	            data.put("bank",rs.getInt("bank"));                                    
	            address.add(rs.getString("address"));
	            while(rs.next()) {
		            address.add(rs.getString("address"));	            	
	            }
	            data.put("address",address);
	            data.put("user",true);            
	        }
	        else{
	            data.put("user",false);
	        }
	    }
	    else{
	        data.put("user",null);
	    }
	    return data;
	}
	
}