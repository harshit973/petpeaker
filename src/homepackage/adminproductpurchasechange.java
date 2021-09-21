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
@WebServlet("/admin/products/purchase/change")
public class adminproductpurchasechange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap h1,h2,h3,h4;       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getSession().getAttribute("staffdata")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user").equals(true) && new accesscheck(((HashMap)request.getSession().getAttribute("staffdata"))).isaccessable(request.getRequestURI().toString())) {		
			h1=new HashMap<String,Object>();
			h2=new HashMap<String,Object>();
			h3=new HashMap<String,Object>();
			h4=new HashMap<String,Object>();
			ArrayList<HashMap<String,Object>> data=new ArrayList<HashMap<String,Object>>();					
			data.add(h1);
			data.add(h2);			
			data.add(h3);
			data.add(h4);			
			PreparedStatement ps=new database().connect().prepareStatement("select * from purchase where id=?");
			PreparedStatement ps2=new database().connect().prepareStatement("select id,email from user");
			PreparedStatement ps3=new database().connect().prepareStatement("select id,pname from products");			
			ps.setString(1,request.getParameter("eid"));			
			ResultSet rs=ps.executeQuery();
			ResultSet rs2=ps2.executeQuery();						
			ResultSet rs3=ps3.executeQuery();									
			ArrayList<String[]> user=new ArrayList<String[]>();
			ArrayList<String[]> products=new ArrayList<String[]>();			
			String uid="";
			String pid="";
			while(rs.next()) {
				uid=rs.getString(2);
				pid=rs.getString(3);				
				h3.put("value",rs.getString(4));				
				h4.put("value",rs.getString(5));
			}
			while(rs2.next()) {
				if(rs2.getString(1).equals(uid)) {
					user.add(new String[] {rs2.getString(1),rs2.getString(2),"1"});					
				}else {
					user.add(new String[] {rs2.getString(1),rs2.getString(2),"0"});										
				}
			}			
			while(rs3.next()) {
				if(rs3.getString(1).equals(uid)) {
					products.add(new String[] {rs3.getString(1),rs3.getString(2),"1"});					
				}else {
					products.add(new String[] {rs3.getString(1),rs3.getString(2),"0"});										
				}
			}						
			String[] names=new String[] {"user","product","purchase date","delivery date"};
			for(int i=0;i<data.size();i++) {
				data.get(i).put("name",names[i]);									
				data.get(i).put("key",names[i]);
				switch(i) {
					case 0:
						data.get(i).put("options",user);
						data.get(i).put("mode","1");
						break;
					case 1:
						data.get(i).put("options",products);
						data.get(i).put("mode","1");
						break;					
					default:
						data.get(i).put("mode","0");					
						data.get(i).put("type","datetime-local");										
						data.get(i).put("value",(data.get(i).get("value")==null)?"":data.get(i).get("value").toString().replace(" ","T"));																
						break;
				}
			}
			request.setAttribute("modal","Product Purchase");			
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
			PreparedStatement ps=new database().connect().prepareStatement("update purchase set uid=?,pid=?,purchasedate=?,deliverydate=? where id=?");
			String[] names=new String[] {"user","product","purchase date","delivery date","eid"};
			int i=1;
			for(String j:names) {
				ps.setString(i,request.getParameter(j));				
				i++;
			}
			ps.execute();
			response.sendRedirect("/admin/products/purchase");			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
