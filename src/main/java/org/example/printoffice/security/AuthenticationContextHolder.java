package org.example.printoffice.security;

import org.example.printoffice.database.dao.EmployeeDAO;
import org.example.printoffice.database.entity.Employee;
import org.example.printoffice.exception.InvalidUsernameOrPasswordException;

import javax.servlet.http.HttpServletRequest;

public class AuthenticationContextHolder {
	private static User contextUser;

	public static void authenticate(final User requestUser, HttpServletRequest req){
		Employee employee = new EmployeeDAO().findByUsername(requestUser.getUsername());
		User user = new User(employee);

		if (!SecurityUtils.verifyLogin(user, requestUser.getPassword())){
			throw new InvalidUsernameOrPasswordException();
		}

		req.getSession(true).setAttribute("user", user);
		contextUser = user;
	}

	public static void logout(HttpServletRequest req){
		req.getSession().invalidate();
		contextUser = null;
	}

	public static User getUser(){
		return contextUser;
	}

	public static void setUser(final User user){
		contextUser = user;
	}
}
