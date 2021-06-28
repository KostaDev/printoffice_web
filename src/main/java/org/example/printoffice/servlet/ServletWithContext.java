package org.example.printoffice.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public abstract class ServletWithContext extends HttpServlet {
	protected String servletContext;

	@Override
	public final void init(ServletConfig servletConfig) throws ServletException {
		servletContext = servletConfig.getServletContext().getContextPath();
	}
}
