package homepackage;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databasepackage.database;

class registeruser extends Thread{
	Map<String,String[]> p;
	HttpSession session;
	registeruser(HttpSession session){
		this.session=session;
		this.p=(Map<String,String[]>)session.getAttribute("rdata");
		this.setDaemon(true);
	}
	String hashgenerator(String password) throws NoSuchAlgorithmException{
        MessageDigest mg=MessageDigest.getInstance("SHA-256");
        byte[] hashobj=mg.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hashobj);
        
    }	
	@Override
	public void run() {
		try {
			Connection conn=new database().connect();
			CallableStatement stmt=conn.prepareCall("call register(?,?,?,?,?,?)");
			stmt.setString(1,p.get("firstname")[0]);
			stmt.setString(2,p.get("lastname")[0]);
			stmt.setString(3,p.get("email")[0]);
			stmt.setString(4,p.get("gender")[0]);
			stmt.setString(5,hashgenerator(p.get("password")[0]));			
			stmt.setString(6,p.get("address")[0]);						
			stmt.execute();
			session.removeAttribute("rdata");
		} catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
}

/**
 * Servlet implementation class verifyinfo
 */
@WebServlet("/verifyinfo")
public class verifyinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("verificationcomplete.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("rdata")!=null) {
			new registeruser(request.getSession()).start();
			response.getWriter().write("1");			
		}else {
			response.getWriter().write("0");						
		}
	}

}
