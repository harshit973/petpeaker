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
import usermanagement.getuser;
import usermanagement.login_log;

/**
 * Servlet implementation class sossignin
 */
@WebServlet("/sossignin")
public class sossignin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 HashMap<String,Object> data=getuser.fetchuser(request.getParameter("email"));
			 if(data!=null) {
				 request.getSession().setAttribute("userdata",data);
	             new Thread(new login_log(request.getParameter("email"))).start();
				 response.getWriter().write("1");
			 }else {
				 response.getWriter().write("0");
			 }
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
