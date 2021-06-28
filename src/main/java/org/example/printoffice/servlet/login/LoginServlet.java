package org.example.printoffice.servlet.login;

import org.example.printoffice.exception.InvalidUsernameOrPasswordException;
import org.example.printoffice.security.AuthenticationContextHolder;
import org.example.printoffice.security.User;
import org.example.printoffice.servlet.ServletWithContext;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends ServletWithContext {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = new User(username, password);
		try {
			AuthenticationContextHolder.authenticate(user, req);
			resp.sendRedirect(servletContext + "/user/dashboard.jsp");
			return;
		} catch (InvalidUsernameOrPasswordException ex) {
			req.setAttribute("errors", new String[]{"Invalid username or password"});
		} catch (Exception ex) {
			req.setAttribute("errors", new String[]{"Something went wrong", ex.getMessage()});
		}
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
