package jp.co.aforce.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.User;
import jp.co.aforce.dao.UserDAO;

@WebServlet(urlPatterns={"/servlet/register"})
public class Register extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		try {
			String error = "";
			
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String password2 = request.getParameter("password2");
			
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			
			int year = Integer.parseInt(request.getParameter("year"));
			int month = Integer.parseInt(request.getParameter("month"));
			int day = Integer.parseInt(request.getParameter("month"));
			String birthday = year + "-" + month + "-" + day;
			
			String email = request.getParameter("email");
			String email2 = request.getParameter("email2");
			
			String tel = request.getParameter("tel");
			
			UserDAO dao = new UserDAO();
			
			if(dao.search(id).getId() != null) {
				error += "このIDは既に使用されています。<br>";
			}
			if(!email.equals(email2)) {
				error += "メールアドレスが一致していません。<br>";
			}
			if(!password.equals(password2)) {
				error += "パスワードが一致していません。<br>";
			}
			
			if(error.length() == 0) {
				User user = new User();
				user.setId(id);
				user.setPassword(password);
				user.setName(name);
				user.setGender(gender);
				user.setBirthday(birthday);
				user.setEmail(email);
				user.setTel(tel);
				int line = dao.insert(user);
				if(line > 0) {
					request.getRequestDispatcher("../jsp/success.jsp")
						.forward(request, response);
				}else {
					out.println("<p>追加に失敗しました</p>");
					out.println("<p>最初からやり直してください</p>");
				}
			}else {
				request.setAttribute("name", name);
				request.setAttribute("gender", gender);
				request.setAttribute("year", year);
				request.setAttribute("month", month);
				request.setAttribute("day", day);
				request.setAttribute("email", email);
				request.setAttribute("email2", email2);
				request.setAttribute("tel", tel);
				request.setAttribute("id", id);
				request.setAttribute("password", password);
				request.setAttribute("password2", password2);
				request.setAttribute("error", error);
				request.getRequestDispatcher("../jsp/register.jsp")
					.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace(out);
		}
	}

}
