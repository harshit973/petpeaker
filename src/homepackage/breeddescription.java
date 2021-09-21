package homepackage;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databasepackage.database;
import responsehandler.response;

/**
 * Servlet implementation class breeddescription
 */
@WebServlet("/breeddescription")
public class breeddescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PreparedStatement stmt=new database().connect().prepareStatement("select breed,gender,thumbnail,price,stock from breeds where id=?");
			PreparedStatement stmt2=new database().connect().prepareStatement("select id,color from breedcolor where breed=?");
			PreparedStatement stmt3=new database().connect().prepareStatement("select highlight from breedhighlights where breed=?");			
			stmt.setString(1,request.getParameter("bid"));
			stmt2.setString(1,request.getParameter("bid"));
			stmt3.setString(1,request.getParameter("bid"));			
			ResultSet rs=stmt.executeQuery();
			ResultSet rs2=stmt2.executeQuery();
			ResultSet rs3=stmt3.executeQuery();			
			HashMap<String,String> bdata=new HashMap<String,String>();
			ArrayList<String[]> colors=new ArrayList<String[]>();
			ArrayList<String> highlights=new ArrayList<String>();			
			while(rs.next()) {
				bdata.put("breed" , rs.getString(1));
				bdata.put("gender" , rs.getString(2));
				bdata.put("thumbnail" , rs.getString(3));
				bdata.put("price" , rs.getString(4));				
				bdata.put("qty" , rs.getString(5));								
			}
			while(rs2.next()) {
				colors.add(new String[] {rs2.getString(1),rs2.getString(2)});
			}
			while(rs3.next()) {
				highlights.add(rs3.getString(1));
			}			
			rs.close();
			rs2.close();
			rs3.close();			
			stmt.close();
			stmt2.close();
			stmt3.close();			
			request.setAttribute("bdata",bdata);
			request.setAttribute("colors",colors);
			request.setAttribute("highlights",highlights);			
			new response("breeddescription.jsp","breeddescription-mobile.jsp").forward(request,response);						
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
