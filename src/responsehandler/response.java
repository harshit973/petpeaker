package responsehandler;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appstart.controller;

public class response{
	String desktop,mobile;
	public response(String desktop,String mobile) {
		this.desktop="/"+desktop;
		this.mobile="/"+mobile;
	}
	public void forward(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		String useragent=req.getHeader("user-agent").toLowerCase();		
		if(useragent.contains("android") || useragent.contains("iphone") || useragent.contains("ios")) {
			req.getRequestDispatcher(mobile).forward(req, res);
		}else {
			req.getRequestDispatcher(desktop).forward(req, res);			
		}
	}
	public boolean ismobile(HttpServletRequest req) throws ServletException, IOException {
		String useragent=req.getHeader("user-agent").toLowerCase();		
		return (useragent.contains("android") || useragent.contains("iphone") || useragent.contains("ios"));
	}
}
