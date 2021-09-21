package homepackage;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databasepackage.database;

/**
 * Servlet implementation class addbreedcart
 */
@WebServlet("/addbreedcart")
public class addbreedcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) ){
				PreparedStatement ps=new database().connect().prepareStatement("insert into breedcart(uid,breed,color) values(?,?,?)");			
				ps.setString(1,String.valueOf(((HashMap)request.getSession().getAttribute("userdata")).get("uid")));
				ps.setString(2,String.valueOf(request.getParameter("breed")));
				ps.setString(3,(String.valueOf(request.getParameter("color")).isEmpty())?null:String.valueOf(request.getParameter("color")));					
				ps.execute();
			}else {
				response.sendRedirect("/login");									
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			response.sendRedirect("/mycart");					
		}
	}

}
