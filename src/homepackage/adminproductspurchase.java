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
 * Servlet implementation class adminpets
 */
@WebServlet("/admin/products/purchase")
public class adminproductspurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getSession().getAttribute("staffdata")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user").equals(true) && new accesscheck(((HashMap)request.getSession().getAttribute("staffdata"))).isaccessable(request.getRequestURI().toString())) {		
			PreparedStatement ps=new database().connect().prepareStatement("select * from `admin-purchase`");
			ResultSet rs=ps.executeQuery();
			HashMap<String,Object> data=new HashMap<String,Object>();
			data.put("selectable","1");
			ArrayList<String[]> vals=new ArrayList<String[]>(); 
			while(rs.next()) {
				String[] d=new String[5];
				d[0]=rs.getString(1);
				d[1]=rs.getString(4);
				d[2]=rs.getString(5);
				d[3]=rs.getString(6);
				d[4]=rs.getString(7);				
				vals.add(d);
			}
			PreparedStatement ps2=new database().connect().prepareStatement("select url,type from actions a inner join accessmodes am on (a.action=am.id) where instance=(select id from accessmodes where url=?) and mode between 100 and ?");
			ps2.setString(1,request.getRequestURI());
			ps2.setInt(2, Integer.parseInt( ((HashMap)request.getSession().getAttribute("staffdata")).get("mode").toString() ) );			
			ResultSet rs2=ps2.executeQuery();
			while(rs2.next()) {
				if(rs2.getString(2).equals("0")) {
					data.put("url2",rs2.getString(1));						
				}else if(rs2.getString(2).equals("1")) {
					data.put("url",rs2.getString(1));												
				}else if(rs2.getString(2).equals("2")) {
					data.put("delete",true);												
				}
			}
			data.put("vals", vals);
			data.put("cols", new String[] {"user","product","purchase date","delivery date"});
			request.setAttribute("modal","Product purchase");			
			request.setAttribute("data",data);
			new response("admin-list.jsp","admin-list.jsp").forward(request,response);			
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
			String[] data=request.getParameter("data").split(",");
			for(String i:data) {
				PreparedStatement ps=new database().connect().prepareStatement("delete from purchase where id=?");
				ps.setString(1,i);
				ps.execute();
			}
			response.sendRedirect("/admin/products/size");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

}
