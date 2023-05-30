package jp.co.aforce.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.beans.User;
import jp.co.aforce.dao.UserDAO;

@WebServlet(urlPatterns={"/servlet/login"})
public class Login extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		try {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			
			UserDAO dao = new UserDAO();
			User user = dao.search(id);
			
			if(password.equals(user.getPassword())) {
				session.setAttribute("user", user);
				request.getRequestDispatcher("../jsp/logging.jsp")
					.forward(request, response);
			}else {
				String error = "IDもしくは、パスワードが違います。";
				request.setAttribute("id", id);
				request.setAttribute("error", error);
				request.getRequestDispatcher("../jsp/login.jsp")
					.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace(out);
		}
	}

}
