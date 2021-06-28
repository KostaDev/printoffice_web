package org.example.printoffice.servlet.logout;

import org.example.printoffice.security.AuthenticationContextHolder;
import org.example.printoffice.servlet.ServletWithContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends ServletWithContext {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AuthenticationContextHolder.logout(req);
		resp.sendRedirect(servletContext + "/index.jsp");
	}
}
