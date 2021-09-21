package homepackage;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appstart.controller;
import databasepackage.database;
import responsehandler.response;

/**
 * Servlet implementation class servicecart
 */
@WebServlet("/servicecart")
public class servicecart extends controller {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PreparedStatement ps=new database().connect().prepareStatement("SELECT plan,price FROM splans where id=?");
			ps.setString(1,request.getParameter("plid"));
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				request.setAttribute("plan",rs.getString(1));
				request.setAttribute("price",rs.getString(2));				
			}
	 		request.getSession().setAttribute("services",getservices());			 		
			new response("servicecart.jsp","servicecart-mobile.jsp").forward(request, response);								
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
