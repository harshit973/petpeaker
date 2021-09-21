package homepackage;

import java.io.IOException;
import java.util.*;
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
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends controller {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String q=String.valueOf(request.getParameter("q"));			
			PreparedStatement ps=new database().connect().prepareStatement("SELECT * FROM products where category=(select id from category where name=?) || pname like '%"+q+"%'");
			ps.setString(1,q);
			ResultSet rs=ps.executeQuery();
			HashMap<String,ArrayList<String>> searchdata=new HashMap<String,ArrayList<String>>();
			while(rs.next()) {
				ArrayList<String> data=new ArrayList<String>();
				data.add(rs.getString("thumbnail"));
				data.add(rs.getString("pname"));
				data.add(rs.getString("brand"));				
				data.add(rs.getString("price"));
				data.add(rs.getString("rating"));				
				searchdata.put(rs.getString("id"),data);
			}
			request.setAttribute("searchdata",searchdata);
			request.getSession().setAttribute("services",getservices());			
			new response("searchresult.jsp","searchresult-mobile.jsp").forward(request,response);			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}