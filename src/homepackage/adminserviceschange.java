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
 * Servlet implementation class adminpetschange
 */
@WebServlet("/admin/services/change")
public class adminserviceschange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap h1,h2,h3;       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getSession().getAttribute("staffdata")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user").equals(true) && new accesscheck(((HashMap)request.getSession().getAttribute("staffdata"))).isaccessable(request.getRequestURI().toString())) {		
				h1=new HashMap();
				h2=new HashMap();
				h3=new HashMap();					
				PreparedStatement ps=new database().connect().prepareStatement("select * from services where id=?");
				ps.setString(1,request.getParameter("eid"));
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					h1.put("value",rs.getString(2));
					h2.put("value",rs.getString(3));				
					h3.put("value",rs.getString(4));								
				}
				h1.put("key","Service");
				h1.put("mode", "0");
				h1.put("name","sname");
				h1.put("type","text");		
				h2.put("key","thumbnail");
				h2.put("mode", "0");
				h2.put("name","sthumb");
				h2.put("type","text");				
				h3.put("key","description");
				h3.put("mode", "0");
				h3.put("name","desc");
				h3.put("type","text");							
				ArrayList<HashMap> data=new ArrayList<HashMap>();		
				data.add(h1);
				data.add(h2);
				data.add(h3);			
				request.setAttribute("modal","Services");			
				request.setAttribute("data", data);
				new response("change-list.jsp","change-list.jsp").forward(request,response);								
			}else {
				response.sendRedirect("/admin");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PreparedStatement ps=new database().connect().prepareStatement("update services set name=?,thumbnail=?,description=? where id=?");
			ps.setString(1,request.getParameter("sname"));
			ps.setString(2,request.getParameter("sthumb"));			
			ps.setString(3,request.getParameter("desc"));						
			ps.setString(4,request.getParameter("eid"));						
			ps.execute();
			response.sendRedirect("/admin/services");			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
