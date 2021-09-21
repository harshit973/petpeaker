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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import databasepackage.database;

/**
 * Servlet implementation class getpetdata
 */
@WebServlet("/getpetdata")
public class getpetdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PreparedStatement ps=new database().connect().prepareStatement("select * from petdata");
			ResultSet rs=ps.executeQuery();
			JSONObject data=new JSONObject();
			while(rs.next()) {
				if(data.isEmpty() || !data.containsKey(rs.getString(1))) {
					JSONObject petdetails=new JSONObject();
					petdetails.put("name", rs.getString(2));
					petdetails.put("pic", rs.getString(3));					
					JSONObject breeddetails=new JSONObject();					
					breeddetails.put("bname",rs.getString(5));
					breeddetails.put("bid",rs.getString(4));					
					JSONArray breeds=new JSONArray();
					breeds.add(breeddetails);
					petdetails.put("breeds",breeds);
					data.put(rs.getString(1),petdetails);
				}else if(data.containsKey(rs.getString(1))) {
					JSONObject petdata=(JSONObject)data.get(rs.getString(1));
					JSONArray bdata=(JSONArray)petdata.get("breeds");
					JSONObject breeddetails=new JSONObject();					
					breeddetails.put("bname",rs.getString(5));
					breeddetails.put("bid",rs.getString(4));										
					bdata.add(breeddetails);
					petdata.put("breeds",bdata);
				}
			}
			response.getWriter().write(data.toJSONString());				
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
