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
import usermanagement.accesscheck;

/**
 * Servlet implementation class adminseller
 */
@WebServlet("/admin/seller")
public class adminseller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			if(request.getSession().getAttribute("staffdata")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user").equals(true) && new accesscheck(((HashMap)request.getSession().getAttribute("staffdata"))).isaccessable(request.getRequestURI().toString())) {		
			PreparedStatement ps=new database().connect().prepareStatement("select * from userdata where mode=1");
			ResultSet rs=ps.executeQuery();
			HashMap<String,Object> data=new HashMap<String,Object>();
			data.put("selectable","0");
			ArrayList<String[]> vals=new ArrayList<String[]>(); 
			while(rs.next()) {
				String[] d=new String[6];
				d[0]=rs.getString(1);
				d[1]=rs.getString(2);
				d[2]=rs.getString(3);
				d[3]=rs.getString(4);
				d[4]=rs.getString(5);				
				d[5]=(rs.getString(6).equals("0"))?"Male":"Female";								
				vals.add(d);
			}
			data.put("vals", vals);
			data.put("cols", new String[] {"First name","Last Name","Email address","Address","Gender"});
			request.setAttribute("data",data);
			request.setAttribute("modal", "seller");
			new response("admin-list.jsp","admin-list.jsp").forward(request,response);			
			}else {
				response.sendRedirect("/admin");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
