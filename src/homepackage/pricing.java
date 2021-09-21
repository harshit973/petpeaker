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
 * Servlet implementation class pricing
 */
@WebServlet("/pricing")
public class pricing extends controller {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PreparedStatement ps=new database().connect().prepareStatement("select * from charges where service=?");
			PreparedStatement ps2=new database().connect().prepareStatement("select name,thumbnail from services where id=?");			
			ps.setString(1,request.getParameter("sid"));
			ps2.setString(1,request.getParameter("sid"));			
			ResultSet rs=ps.executeQuery();
			ResultSet rs2=ps2.executeQuery();			
			HashMap<String,HashMap> cdata=new HashMap<String,HashMap>();
			while(rs2.next()) {
				request.setAttribute("name", rs2.getString(1));				
				request.setAttribute("thumbnail", rs2.getString(2));
			}
			while(rs.next()) {
				if(cdata.isEmpty()) {
					ArrayList<String> feature=new ArrayList<String>();
					HashMap<String,Object> temp=new HashMap<String,Object>();					
					feature.add(rs.getString(6));					
					temp.put("plan", rs.getString(3));
					temp.put("discount",rs.getString(4));
					temp.put("about",rs.getString(7));					
					temp.put("price",(request.getParameter("yr")!=null && request.getParameter("yr").equals("1"))?rs.getInt(5)*12:rs.getInt(5));
					temp.put("features",feature);					
					cdata.put(rs.getString(1),temp);
				}else if(cdata.containsKey(rs.getString(1))) {
					HashMap<String,Object> data=(HashMap<String,Object>)cdata.get(rs.getString(1));
					ArrayList<String> arr=(ArrayList<String>)data.get("features");
					arr.add(rs.getString(6));					
					cdata.put(rs.getString(1),data);					
				}else {
					ArrayList<String> feature2=new ArrayList<String>();
					HashMap<String,Object> temp2=new HashMap<String,Object>();										
					feature2.add(rs.getString(6));															
					temp2.put("plan", rs.getString(3));
					temp2.put("discount",rs.getString(4));
					temp2.put("about",rs.getString(7));										
					temp2.put("price",(request.getParameter("yr")!=null && request.getParameter("yr").equals("1"))?rs.getInt(5)*12:rs.getInt(5));
					temp2.put("features",feature2);										
					cdata.put(rs.getString(1),temp2);
				}
			}
			request.setAttribute("plans",cdata);
			request.getSession().setAttribute("services",getservices());		
			new response("charges.jsp","charges-mobile.jsp").forward(request, response);			
		}catch (ClassNotFoundException | SQLException e) {

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
