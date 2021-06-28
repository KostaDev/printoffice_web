package org.example.printoffice.filter;

import org.example.printoffice.security.AuthenticationContextHolder;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "authenticationFilter")
public class AuthenticationFilter implements Filter {
	private String servletContext;

	@Override
	public void init(FilterConfig filterConfig) {
		servletContext = filterConfig.getServletContext().getContextPath();
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
		HttpServletResponse resp = (HttpServletResponse) servletResponse;
		if (AuthenticationContextHolder.getUser() == null) {
			resp.sendRedirect(servletContext + "/index.jsp");
		} else {
			filterChain.doFilter(servletRequest, servletResponse);
		}
	}
}
