package homepackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databasepackage.database;

class logoutthread extends Thread{
	String email;
	logoutthread(String email){
		this.email=email;
	}
	@Override
	public void run() {
        try {
        	Connection conn=new database().connect();
            PreparedStatement st=conn.prepareStatement("UPDATE user SET loginstatus=0 WHERE email=?");                            	
			st.setString(1, email);
	        st.executeUpdate();            				
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}

@WebServlet("/logout")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("userdata")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user")!=null && ((HashMap)request.getSession().getAttribute("userdata")).get("user").equals(true)) {
			if(request.getParameter("admin")!=null) {
				HashMap<String,Object> h=(HashMap<String,Object>)request.getSession().getAttribute("staffdata");
				new logoutthread(String.valueOf(h.get("email"))).start();
				request.getSession().invalidate();
				response.sendRedirect("/admin");			
			}else {
				HashMap<String,Object> h=(HashMap<String,Object>)request.getSession().getAttribute("userdata");			
				new logoutthread(String.valueOf(h.get("email"))).start();
				request.getSession().invalidate();
				response.sendRedirect("/");						
			}		
		}else {
			response.sendRedirect("/login");									
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
