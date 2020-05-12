package org.project.security;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

public class CsrfSecurityRequestMathcer  implements RequestMatcher 
{
	
	private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");
	
	private RegexRequestMatcher unprotectedMatcher = new RegexRequestMatcher("/sign/jusoPopup", null);

	@Override
	public boolean matches(HttpServletRequest request) {
		// TODO Auto-generated method stub
		if(allowedMethods.matcher(request.getMethod()).matches())
		{

            return false;
		}
		return !unprotectedMatcher.matches(request);
	}
	
}
