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

import appstart.controller;
import databasepackage.database;
import responsehandler.response;

/**
 * Servlet implementation class mycart
 */
@WebServlet("/mycart")
public class mycart extends controller {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true)) {
				try {
					PreparedStatement citem=new database().connect().prepareStatement("select * from cart_item where uid=?");
					citem.setInt(1,Integer.valueOf(String.valueOf(((HashMap)request.getSession().getAttribute("userdata")).get("uid"))));
					ResultSet rs=citem.executeQuery();
					ArrayList<HashMap<String,String>> cartdata=new ArrayList<HashMap<String,String>>();
					while(rs.next()) {
						HashMap<String,String> cdata=new HashMap<String,String>();
						cdata.put("thumbnail",rs.getString("thumbnail"));
						if(rs.getString("color")!=null) {
							cdata.put("color",rs.getString("color"));
						}
						if(rs.getString("size")!=null) {
							cdata.put("size",rs.getString("size"));							
						}						
						if(rs.getString("flavor")!=null) {
							cdata.put("flavor",rs.getString("flavor"));							
						}												
						cdata.put("id",String.valueOf(rs.getInt("pid")));						
						cdata.put("name",rs.getString("name"));
						cdata.put("price",String.valueOf(rs.getInt("price")));
						cartdata.add(cdata);
					}					
					if(cartdata.size()>0) {
						request.setAttribute("cart",cartdata);
					}
					request.getSession().setAttribute("services",getservices());
					new response("cart.jsp","cart-mobile.jsp").forward(request,response);					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else {
			response.sendRedirect("/login");			
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
