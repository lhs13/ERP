package org.project.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	private static final Logger log = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		log.warn("Login Success");
		
		List<String> roleNames = new ArrayList<String>();
		
		auth.getAuthorities().forEach(authority -> {
			
			roleNames.add(authority.getAuthority());
			
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		
		if(roleNames.contains("ROLE_ADMIN")) {
			System.out.println("admin");
			response.sendRedirect("/");
			return;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			System.out.println("membmer");
			response.sendRedirect("/");
			return;
		}
		System.out.println("all");
		response.sendRedirect("/");
		
		
	}
	

}
