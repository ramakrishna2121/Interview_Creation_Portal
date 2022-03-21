package com.srccodes.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginVerification
 */
public class LoginVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginVerification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("user");
		String password=request.getParameter("password");
		String usertype=request.getParameter("com");
		out.println("<script type=\"text/javascript\">");
		if(usertype.equals("Admin"))
		{
			if(name.equals("rama") && password.equals("2121"))
			{
				
				out.println("alert('Login Successful');");
				out.println("location.replace('upcominginterviews.jsp')");
			}
			else
			{
				out.println("alert('InCorrect Credentials');");
				out.println("location.replace('login.jsp')");
			}
				
		}
		if(usertype.equals("Participant"))
		{
			if(name.equals("rama") && password.equals("2121"))
			{
				
				out.println("alert('Login Successful');");
				out.println("location.replace('admin.jsp')");
			}
			else
			{
				out.println("alert('InCorrect Credentials');");
				out.println("location.replace('login.jsp')");
			}
				
		}
		
		out.println("</script>");
			
		
				
				
	}
	

}