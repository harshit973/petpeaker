package homepackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databasepackage.database;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("rdata")!=null) {
			Map<String,String[]> p=(Map<String,String[]>)request.getSession().getAttribute("rdata");
			if(p.get("mail")!=null && p.get("exists")[0].equals("0")) {
				request.setAttribute("email",p.get("email")[0]);
				p.put("mail",null);
				request.getSession().setAttribute("rdata",p);
				request.getRequestDispatcher("verifymail.jsp").forward(request,response);
			}else {
				if(p.get("exists")[0].equals("1")) {
					request.getSession().removeAttribute("rdata");
					request.setAttribute("exists","1");
				}
				request.getRequestDispatcher("registerpage.jsp").forward(request,response);				
			}
		}else {
			request.getRequestDispatcher("registerpage.jsp").forward(request,response);			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Map<String,String[]> temp=request.getParameterMap();			
			Map<String,String[]> data=new HashMap<String,String[]>();
			data.put("firstname",temp.get("firstname"));
			data.put("lastname",temp.get("lastname"));			
			data.put("address",temp.get("address"));						
			data.put("email",temp.get("email"));
			data.put("gender",temp.get("gender"));
			data.put("password",temp.get("password"));			
			Connection conn=new database().connect();
			PreparedStatement stmt=conn.prepareStatement("select id from user where email=?");
			stmt.setString(1,data.get("email")[0]);			
			ResultSet result=stmt.executeQuery();
			if(result.isBeforeFirst()) {
				data.put("exists",new String[]{"1"});
			}else {
				data.put("exists",new String[]{"0"});				
			}
			data.put("mail",new String[] {"0"});
			request.getSession().setAttribute("rdata",data);			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("/register");
	}

}
