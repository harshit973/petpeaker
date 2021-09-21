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

import java.util.*;
/**
 * Servlet implementation class account
 */
@WebServlet("/account")
public class account extends controller {
	private static final long serialVersionUID = 1L;       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {		
			if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true)) {
				if(request.getParameter("wishlist")!=null && request.getParameter("wishlist").equals("1") ) {
						PreparedStatement ps=new database().connect().prepareStatement("select * from wishlist where uid=?");					
						ps.setString(1,String.valueOf(((HashMap)request.getSession().getAttribute("userdata")).get("uid")));
						ResultSet rs=ps.executeQuery();					
						ArrayList<HashMap<String,String>> data=new ArrayList<HashMap<String,String>>();
						while(rs.next()) {
							HashMap<String,String> temp=new HashMap<String,String>();
							temp.put("pid",rs.getString(1));
							temp.put("category",rs.getString(3));
							temp.put("brand",rs.getString(4));
							temp.put("pname",rs.getString(5));
							temp.put("thumbnail",rs.getString(6));
							temp.put("price",rs.getString(7));
							temp.put("rating",rs.getString(8));
							temp.put("qty",rs.getString(10));						
							data.add(temp);
						}	
						request.setAttribute("wishlist",data);
						System.out.print(data);						
				}
				request.getSession().setAttribute("services",getservices());
				new response("account.jsp","account-mobile.jsp").forward(request,response);
			}
			else {
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
