package homepackage;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appstart.controller;
import databasepackage.database;
import responsehandler.response;

/**
 * Servlet implementation class shop
 */
@WebServlet("/shop")
public class shop extends controller {
	private static final long serialVersionUID = 1L;
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String sql="select c.name as `category`,p.pname,br.name as `brand`,p.thumbnail,p.price as `price`,p.id as `id`,p.rating as `rating` from category c inner join products p on p.category=c.id inner join brands br on p.brand=br.id ";			
			ArrayList<String> parameters=new ArrayList<String>();
			if(request.getParameter("br")!=null) {
				parameters.add("br.name='"+String.valueOf(request.getParameter("br"))+"'");
			}
			if(request.getParameter("cgy")!=null) {
				parameters.add("c.name='"+String.valueOf(request.getParameter("cgy"))+"'");
			}			
			if(request.getParameter("p1")!=null && request.getParameter("p2")!=null) {
				parameters.add("p.price between "+String.valueOf(request.getParameter("p1"))+" and "+String.valueOf(request.getParameter("p2")));
			}					
			String whereclause="";			
			if(!parameters.isEmpty()) {
				whereclause="where "+parameters.get(0);
				for(int i=1;i<parameters.size();i++) {
					whereclause+=" && "+parameters.get(i);
				}
				sql+=whereclause;
			}
			if(request.getParameterMap().size()==1 && request.getParameter("plh")!=null && request.getParameter("plh").equals("1") ) {
				sql+=" order by price asc";
			}
			if(request.getParameterMap().size()==1 && request.getParameter("phl")!=null && request.getParameter("phl").equals("1") ) {
				sql+=" order by price desc";
			}			
			if(request.getParameterMap().size()==1 && request.getParameter("srat")!=null && request.getParameter("srat").equals("1") ) {
				sql+=" order by rating desc";
			}		
			System.out.print(sql);
			PreparedStatement ps=new database().connect().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			ArrayList<String> brands=new ArrayList<String>();
			ArrayList<String> categories=new ArrayList<String>();			
			ArrayList<Integer> priceset=new ArrayList<Integer>();			
			ArrayList<String[]> prod=new ArrayList<String[]>();								
			while(rs.next()) {
				String category=rs.getString(1);
				String pname=rs.getString(2);
				String brand=rs.getString(3);				
				String thumb=rs.getString(4);
				String price=rs.getString(5);				
				String id=String.valueOf(rs.getInt(6));
				String rating=String.valueOf(rs.getFloat(7));				
				if(!priceset.contains(Integer.valueOf(price))) {
					priceset.add(Integer.valueOf(price));
				}
				prod.add(new String[] {id,pname,brand,thumb,price,rating});
				if(!brands.contains(brand)) {
					brands.add(brand);
				}
				if(!categories.contains(category)) {
					categories.add(category);
				}				
			}
			if(!priceset.isEmpty()) {
				Collections.sort(priceset);
				request.setAttribute("min",priceset.get(0));
				request.setAttribute("max",priceset.get(priceset.size()-1));				
			}
     		request.getSession().setAttribute("services",getservices());			
			request.setAttribute("brands",brands);     		
			request.setAttribute("categories",categories);     					
			request.setAttribute("product",prod);
			new response("shop.jsp","shop-mobile.jsp").forward(request, response);			
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
