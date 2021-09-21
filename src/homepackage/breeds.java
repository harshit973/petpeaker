package homepackage;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appstart.controller;
import databasepackage.database;
import responsehandler.response;

/**
 * Servlet implementation class breeds
 */
@WebServlet("/breeds")
public class breeds extends controller {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String sql="select * from breeddata where pet=?";
			if(request.getParameter("gender")!=null && request.getParameter("pr1")!=null && request.getParameter("pr2")!=null) {
				sql+=" && gender="+request.getParameter("gender")+" && price between "+request.getParameter("pr1")+" and "+request.getParameter("pr2");
			}
			if(request.getParameter("plh")!=null) {
				sql+=" order by price";				
			}else if(request.getParameter("phl")!=null) {
				sql+=" order by price desc";								
			}else {
				sql+=" order by price";								
			}
			PreparedStatement ps=new database().connect().prepareStatement(sql);
			ps.setString(1, request.getParameter("pid"));
			ResultSet rs=ps.executeQuery();
			ArrayList<String> filtergender=new ArrayList<String>();
			ArrayList<String> prices=new ArrayList<String>();
			ArrayList<HashMap<String,String>> bdata=new ArrayList<HashMap<String,String>>();
			while(rs.next()) {
				HashMap<String,String> breed=new HashMap<String,String>();
				breed.put("id",rs.getString(1));
				breed.put("thumbnail",rs.getString(3));
				breed.put("gender",rs.getString(4));				
				breed.put("breed",rs.getString(5));
				breed.put("price",rs.getString(6));				
				if(!filtergender.contains(rs.getString(4))) {				
					filtergender.add(rs.getString(4));
				}
				if(!prices.contains(rs.getString(6))) {
					prices.add(rs.getString(6));
				}
				bdata.add(breed);
			}
			int max=-1;
			int min=-1;
			for(int i=0;i<prices.size();i++) {
				for(int j=i+1;j<prices.size();j++) {
					if(Integer.valueOf(prices.get(j))<Integer.valueOf(prices.get(i))) {
						String temp=prices.get(j);
						prices.set(j,prices.get(i));
						prices.set(i,temp);						
					}
				}
			}
			if(prices.size()>0) {
				min=Integer.valueOf(prices.get(0));				
				max=Integer.valueOf(prices.get(prices.size()-1));								
				request.setAttribute("max",max);						
				request.setAttribute("min",min);													
			}
			request.setAttribute("bdata",bdata);
			request.setAttribute("filtergender",filtergender);			
	 		request.getSession().setAttribute("services",getservices());			 					
			new response("breeds.jsp","breeds-mobile.jsp").forward(request,response);			
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
