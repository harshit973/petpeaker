package homepackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appstart.controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import databasepackage.database;
import responsehandler.response;

class registerthread implements Runnable{
	String accnumber,ifsc,bank;
	int id;
	registerthread(String accnumber,String ifsc,String bank,int id){
		this.ifsc=ifsc;
		this.accnumber=accnumber;
		this.bank=bank;		
		this.id=id;
	}
	@Override
	public void run() {
		try {
			PreparedStatement ps=new database().connect().prepareStatement("INSERT INTO organization(id,accnumber,ifsc,bank) values(?,?,?,?)");
			ps.setInt(1,id);
			ps.setInt(2,Integer.valueOf(accnumber));
			ps.setInt(3,Integer.valueOf(ifsc));									
			ps.setInt(4,Integer.valueOf(bank));												
			ps.executeUpdate();					
		} catch (NumberFormatException | SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}						
	}
	
}

@WebServlet("/joinus")
public class joinus extends controller {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		if(request.getSession().getAttribute("userdata")!=null) {
			HashMap<String,Object> data=(HashMap<String,Object>)request.getSession().getAttribute("userdata");
			if(String.valueOf(data.get("mode")).equals("1")) {
				try {				
					if(request.getParameter("b1")!=null) {
						if(request.getSession().getAttribute("idverify")!=null) {
							request.getSession().removeAttribute("idverify");
						}else if(request.getSession().getAttribute("bankdetails")!=null) {
							request.getSession().removeAttribute("bankdetails");							
						}else if(request.getSession().getAttribute("sdetails")!=null) {
							request.getSession().removeAttribute("sdetails");							
						}
						response.getWriter().write("1");
					}else {
						ArrayList<String> banks=new ArrayList<String>();
						ArrayList<Integer> bankids=new ArrayList<Integer>();
						Connection conn=new database().connect();
						PreparedStatement ps=conn.prepareStatement("select * from bank");
						PreparedStatement ps2=conn.prepareStatement("select s.id as `sid`,s.state,c.id as `cid`,c.city from states s left outer join cities c on c.state=s.id;");					
						ResultSet rs=ps.executeQuery();						
						ResultSet rs2=ps2.executeQuery();											
						while(rs.next()) {
							banks.add(rs.getString(2).trim());
							bankids.add(rs.getInt(1));
						}	
						HashMap<String,ArrayList<String>> geodata=new HashMap<String,ArrayList<String>>();
						while(rs2.next()) {
							ArrayList<String> arr=null;						
							if(!geodata.containsKey(rs2.getString(2))) {
								arr=new ArrayList<String>();
							}else {
								arr=geodata.get(rs2.getString(2).trim());
							}
							if(rs2.getString(4)!=null) {
								arr.add(rs2.getString(4).trim());							
							}
							geodata.put(rs2.getString(2),arr);																											
						}															
						request.setAttribute("geodata",geodata);
						request.setAttribute("banks",banks.toArray());
						request.setAttribute("bankid",bankids.toArray());					
						if(request.getSession().getAttribute("bankdetails")!=null) {
							request.setAttribute("stage","3");
						}else {
							if(request.getSession().getAttribute("sdetails")!=null) {
								request.setAttribute("stage","2");						
							}else {
								request.setAttribute("stage","1");												
							}
						}
   					    request.getSession().setAttribute("services",getservices());						
						new response("joinus.jsp","joinus-mobile.jsp").forward(request,response);										
					}
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}				
			}else {
				response.getWriter().write("<h1>404 Page not found</h1>");
			}
		}else {
			response.sendRedirect("/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
