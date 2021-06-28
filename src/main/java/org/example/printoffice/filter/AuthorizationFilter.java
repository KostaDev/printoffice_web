package org.example.printoffice.filter;

import org.example.printoffice.security.AuthenticationContextHolder;
import org.example.printoffice.security.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "authorizationFilter")
public class AuthorizationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filter) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) req).getSession();
		User user = (User) session.getAttribute("user");
		AuthenticationContextHolder.setUser(user);
		filter.doFilter(req, resp);
	}

}
