package homepackage;

import java.io.IOException;
import java.sql.Connection;
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
 * Servlet implementation class description
 */
@WebServlet("/description")
public class description extends controller {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ResultSet rs;			
			HashMap<String,Object> pdata=new HashMap<String,Object>();
			Connection c = new database().connect();
			PreparedStatement ps=c.prepareStatement("select * from pdata where id=?");			
			PreparedStatement ps2=c.prepareStatement("select id,flavor from flavor where pid=?");			
			PreparedStatement ps3=c.prepareStatement("select highlight from highlights where pid=?");			
			PreparedStatement ps4=c.prepareStatement("select fname,lname,rating,review from radata where pid=?");			
			PreparedStatement ps5=c.prepareStatement("select id,color from color where pid=?");			
			PreparedStatement ps6=c.prepareStatement("select id,size from size where pid=?");						
        	PreparedStatement ps7=new database().connect().prepareStatement("select id from wishlist where uid=?");			
			ps.setString(1,String.valueOf(request.getParameter("pid")));
			ps2.setString(1,String.valueOf(request.getParameter("pid")));
			ps3.setString(1,String.valueOf(request.getParameter("pid")));
			ps4.setString(1,String.valueOf(request.getParameter("pid")));
			ps5.setString(1,String.valueOf(request.getParameter("pid")));
			ps6.setString(1,String.valueOf(request.getParameter("pid")));			
			rs=ps.executeQuery();
			while(rs.next()) {
				pdata.put("name",rs.getString(2));
				pdata.put("brand",rs.getString(3));
				pdata.put("thumbnail",rs.getString(4));				
				pdata.put("price",rs.getInt(5));
				pdata.put("rating",rs.getFloat(6));
				pdata.put("note",rs.getString(7));
				pdata.put("qty",rs.getInt(8));				
				ArrayList<HashMap<String,String>> flavor=new ArrayList<HashMap<String,String>>();
				ArrayList<String> highlights=new ArrayList<String>();				
				rs=ps2.executeQuery();
				while(rs.next()) {
					HashMap<String,String> data=new HashMap<String,String>();
					data.put("id",String.valueOf(rs.getInt(1)));
					data.put("name",rs.getString(2));
					flavor.add(data);
				}
				if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true) ){ 			
		        	ps7.setInt(1,Integer.parseInt(String.valueOf(((HashMap)request.getSession().getAttribute("userdata")).get("uid"))));							
		        	ResultSet rs2=ps7.executeQuery();	        	
		        	HashMap<String,Object> wdata=new HashMap<String,Object>();
		        	ArrayList<HashMap<String,Object>> wishlist=new ArrayList<HashMap<String,Object>>();
		        	while(rs2.next()) {
		        		wdata.put("pid",rs2.getInt(1));
		        		wishlist.add(wdata);
		        	}						
		        	request.setAttribute("wishlist", wishlist);	        	
				}				
				pdata.put("flavor",flavor);				
				rs=ps3.executeQuery();				
				while(rs.next()) {
					highlights.add(rs.getString(1));
				}				
				pdata.put("highlights",highlights);
				HashMap<String,String> rating=new HashMap<String,String>();
				ArrayList<HashMap<String,String>> ratingarr=new ArrayList<HashMap<String,String>>();
				rs=ps4.executeQuery();				
				while(rs.next()) {
					rating.put("fname",rs.getString(1));
					rating.put("lname",rs.getString(2));					
					rating.put("rating",rs.getString(3));					
					rating.put("review",rs.getString(4));										
					ratingarr.add(rating);
				}
				pdata.put("ratings",ratingarr);				
				ArrayList<HashMap<String,String>> color=new ArrayList<HashMap<String,String>>();
				rs=ps5.executeQuery();
				while(rs.next()) {
					HashMap<String,String> data=new HashMap<String,String>();
					data.put("id",String.valueOf(rs.getInt(1)));
					data.put("name",rs.getString(2));					
					color.add(data);
				}
				pdata.put("color",color);				
				ArrayList<HashMap<String,String>> size=new ArrayList<HashMap<String,String>>();
				rs=ps6.executeQuery();
				while(rs.next()) {
					HashMap<String,String> data=new HashMap<String,String>();
					data.put("id",String.valueOf(rs.getInt(1)));
					data.put("name",rs.getString(2));					
					size.add(data);
				}
				pdata.put("size",size);								
			}
			rs.close();
			c.close();
			request.setAttribute("pdata",pdata);
	 		request.getSession().setAttribute("services",getservices());			 		
			new response("description.jsp","description-mobile.jsp").forward(request, response);			
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
