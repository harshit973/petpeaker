package homepackage;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databasepackage.database;

/**
 * Servlet implementation class addwish
 */
@WebServlet("/addcart")
public class addcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if( request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) ) {
				CallableStatement ps=new database().connect().prepareCall("select addcart(?,?,?,?,?)");			
				ps.setInt(1,Integer.valueOf(String.valueOf(((HashMap)request.getSession().getAttribute("userdata")).get("uid"))));
				ps.setString(2,request.getParameter("pid"));
				ps.setString(3,null);
				ps.setString(4,request.getParameter("size"));
				ps.setString(5,request.getParameter("color"));				
				ResultSet rs=ps.executeQuery();
				response.sendRedirect("/mycart");
			}else {
				response.sendRedirect("/login");								
			}
		} catch (SQLException | ClassNotFoundException e) {
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
