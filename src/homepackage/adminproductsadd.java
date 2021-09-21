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
@WebServlet("/admin/products/add")
public class adminproductsadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap h1,h2,h3,h4,h5,h6,h7,h8;       
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
			h5=new HashMap<String,Object>();
			h6=new HashMap<String,Object>();					
			h7=new HashMap<String,Object>();
			h8=new HashMap<String,Object>();								
			ArrayList<HashMap<String,Object>> data=new ArrayList<HashMap<String,Object>>();					
			data.add(h1);
			data.add(h2);			
			data.add(h3);
			data.add(h4);			
			data.add(h5);
			data.add(h6);						
			data.add(h7);
			data.add(h8);									
			PreparedStatement ps2=new database().connect().prepareStatement("select * from brands");
			PreparedStatement ps3=new database().connect().prepareStatement("select * from category");			
			ResultSet rs2=ps2.executeQuery();						
			ResultSet rs3=ps3.executeQuery();									
			ArrayList<String[]> branddata=new ArrayList<String[]>(),categorydata=new ArrayList<String[]>();			
			String brand="",category="";
			while(rs2.next()) {
				if(rs2.getString(1).equals(brand)) {
					branddata.add(new String[] {rs2.getString(1),rs2.getString(2),"1"});					
				}else {
					branddata.add(new String[] {rs2.getString(1),rs2.getString(2),"0"});										
				}
			}			
			while(rs3.next()) {
				if(rs3.getString(1).equals(category)) {
					categorydata.add(new String[] {rs3.getString(1),rs3.getString(2),"1"});					
				}else {
					categorydata.add(new String[] {rs3.getString(1),rs3.getString(2),"0"});										
				}
			}						
			String[] names=new String[] {"category","brand","Product","thumbnail","price","rating","note","stock"};
			for(int i=0;i<data.size();i++) {
				data.get(i).put("name",names[i]);									
				data.get(i).put("key",names[i]);
				switch(i) {
					case 0:
						data.get(i).put("options",categorydata);
						data.get(i).put("mode","1");
						break;
					case 1:
						data.get(i).put("options",branddata);
						data.get(i).put("mode","1");
						break;					
					case 4:
						data.get(i).put("mode","0");					
						data.get(i).put("type","number");																
						break;
					case 5:
						data.get(i).put("mode","0");					
						data.get(i).put("type","text");																
						break;						
					case 7:
						data.get(i).put("mode","0");					
						data.get(i).put("type","number");																
						break;												
					default:
						data.get(i).put("mode","0");					
						data.get(i).put("type","text");										
						break;
				}
			}
			request.setAttribute("modal","Products");			
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
			PreparedStatement ps=new database().connect().prepareStatement("insert into products(category,brand,pname,thumbnail,price,rating,note,qty) values(?,?,?,?,?,?,?,?)");
			String[] names=new String[] {"category","brand","Product","thumbnail","price","rating","note","stock"};
			int i=1;
			for(String j:names) {
				ps.setString(i,request.getParameter(j));				
				i++;
			}
			ps.execute();
			response.sendRedirect("/admin/products");			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
