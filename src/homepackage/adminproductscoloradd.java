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
@WebServlet("/admin/products/color/add")
public class adminproductscoloradd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap h1,h2;       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getSession().getAttribute("staffdata")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user").equals(true) && new accesscheck(((HashMap)request.getSession().getAttribute("staffdata"))).isaccessable(request.getRequestURI().toString())) {		
			h1=new HashMap<String,Object>();
			h2=new HashMap<String,Object>();
			ArrayList<HashMap<String,Object>> data=new ArrayList<HashMap<String,Object>>();					
			PreparedStatement ps=new database().connect().prepareStatement("select id,pname from products");
			ResultSet rs=ps.executeQuery();
			ArrayList<String[]> eles=new ArrayList<String[]>();
			String id="";
			while(rs.next()) {
				if(rs.getString(1).equals(id)) {
					eles.add(new String[] {rs.getString(1),rs.getString(2),"1"});					
				}else {
					eles.add(new String[] {rs.getString(1),rs.getString(2),"0"});										
				}
			}			
			h1.put("mode","1");
			h1.put("name","pdata");			
			h1.put("key","Product");
			h1.put("options",eles); 
			h2.put("mode","0");
			h2.put("name","color");			
			h2.put("key","color");
			h2.put("type","text");			
			data.add(h1);
			data.add(h2);						
			request.setAttribute("modal","Product color");			
			request.setAttribute("data", data);
			new response("insert-list.jsp","insert-list.jsp").forward(request,response);								
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
			PreparedStatement ps=new database().connect().prepareStatement("insert into color(pid,color) values(?,?) ");
			String[] names=new String[] {"pdata","color"};
			int i=1;
			for(String j:names) {
				ps.setString(i,request.getParameter(j));				
				i++;
			}
			ps.execute();
			response.sendRedirect("/admin/products/color");			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
