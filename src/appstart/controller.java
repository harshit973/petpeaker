package appstart;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databasepackage.database;

public class controller extends HttpServlet {
	private static HashMap<String,String[]> services;
	protected HashMap<String,String[]> getservices(){
		try {
			if(services==null) {
				services=new HashMap<String,String[]>();        			
				PreparedStatement st= new database().connect().prepareStatement("SELECT * FROM services");
				ResultSet rs=st.executeQuery();
				while(rs.next()) {
					services.put(rs.getString("id"),new String[] { rs.getString("name"),rs.getString("thumbnail"),rs.getString("description") });
				}			
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return services;
	}
	public controller() {
        super();
        getservices();
    }

}
