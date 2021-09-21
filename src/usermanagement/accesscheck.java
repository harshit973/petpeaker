package usermanagement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import databasepackage.database;

public class accesscheck {
	String mode;
	PreparedStatement ps;
	ResultSet rs;
	public accesscheck(HashMap<String,Object> udata) throws ClassNotFoundException, SQLException {
		mode=udata.get("mode").toString();						
	}
	public boolean isaccessable(String url) throws ClassNotFoundException, SQLException {
		ps=new database().connect().prepareStatement("select mode from accessmodes where url=? && mode between 100 and ?");		
		ps.setInt(2,Integer.valueOf(mode));						
		ps.setString(1, url);
		rs=ps.executeQuery();
		return rs.isBeforeFirst();
	}
}