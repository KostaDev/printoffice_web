package org.example.printoffice.security;


import com.google.common.hash.Hashing;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;

public class SecurityUtils {

	public static boolean verifyLogin(User user, String password) {
		if (user == null || password == null) {
			return false;
		}
		return user.getPassword().equals(getSha256(password));
	}

	public static String getSha256(String string) {
		return Hashing.sha256().hashString(string, StandardCharsets.UTF_8).toString();
	}

	public static boolean isLoggedIn(HttpServletRequest request) {
		return request.getSession().getAttribute("user") != null;
	}
}
