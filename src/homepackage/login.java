package homepackage;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databasepackage.database;
import usermanagement.authenticator;
import usermanagement.getuser;
import usermanagement.login_log;

import java.util.*;
import java.sql.*;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            HashMap userdata=getuser.fetchuser(request.getParameter("email"),request.getParameter("password"));
            if(userdata.get("user")!=null && userdata.get("user").equals(true)){
            	Thread t=new Thread(new login_log(request.getParameter("email")));
            	t.start();        	            	
    			request.getSession().setMaxInactiveInterval(-1);
                request.getSession().setAttribute("userdata",userdata);
                response.sendRedirect("/");
            }
            else{
                request.setAttribute("user",userdata);            
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.print(e);
            response.getWriter().write(e.getMessage());
        }
	}

}
