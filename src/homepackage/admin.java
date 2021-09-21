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

import org.json.simple.JSONObject;

import databasepackage.database;
import responsehandler.response;
import usermanagement.accesscheck;
import usermanagement.getuser;
import usermanagement.login_log;

/**
 * Servlet implementation class admin
 */
@WebServlet("/admin")
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getSession().getAttribute("staffdata")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user")!=null && ((HashMap)request.getSession().getAttribute("staffdata")).get("user").equals(true) && new accesscheck(((HashMap)request.getSession().getAttribute("staffdata"))).isaccessable(request.getRequestURI().toString())) {		
				PreparedStatement ps=new database().connect().prepareStatement("select * from instance_accessibility where mode between 100 and ?");
				ps.setInt(1,Integer.parseInt(((HashMap)request.getSession().getAttribute("staffdata")).get("mode").toString()));
				ResultSet rs=ps.executeQuery();
				HashMap<String,ArrayList<String[]>> data=new HashMap<String,ArrayList<String[]>>();
				while(rs.next()) {
					if(data.containsKey(rs.getString(1))) {
						ArrayList<String[]> d=data.get(rs.getString(1));
						d.add(new String[] {rs.getString(2),rs.getString(3)});
						data.put(rs.getString(1), d);
					}else{
						ArrayList<String[]> d=new ArrayList<String[]>();
						d.add(new String[] {rs.getString(2),rs.getString(3)});
						data.put(rs.getString(1), d);
					}
				}
				request.setAttribute("data", data);
				new response("admin-dashboard.jsp","admin-dashboard.jsp").forward(request,response);					
			}else {
				new response("admin-login.jsp","admin-login.jsp").forward(request,response);			
			}
		} catch (ClassNotFoundException | SQLException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        try{
            HashMap<String,Object> userdata=getuser.fetchadmin(request.getParameter("email"),request.getParameter("password"));
        	JSONObject res=new JSONObject();            
            if(userdata.get("user")!=null && userdata.get("user").equals(true) && Integer.valueOf(userdata.get("mode").toString())>=100){
            	request.getSession().setAttribute("staffdata",userdata);            	
            	Thread t=new Thread(new login_log(request.getParameter("email")));
            	t.start();        	            	
            	res.put("code","200");
            }
            else{
            	res.put("code","100");            	
            }
        	response.getWriter().write(res.toJSONString());            	            
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.print(e);
            response.getWriter().write(e.getMessage());
        }		
	}

}
