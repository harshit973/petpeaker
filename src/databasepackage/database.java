package databasepackage;

import java.sql.*;
interface databasecredentials {
    
    final String connstring="jdbc:mysql://bc5b8ca0441399:d49c7d73@us-cdbr-east-04.cleardb.com/heroku_cc5b5b374324113";
    
    final String username="bc5b8ca0441399";

    final String password="d49c7d73";

}
public class database implements databasecredentials{
	public Connection connect() throws SQLException,ClassNotFoundException {
	    Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection(connstring,username,password);
	}
}
