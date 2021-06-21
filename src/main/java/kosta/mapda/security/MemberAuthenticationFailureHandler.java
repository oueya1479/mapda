package kosta.mapda.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;


/**
 * Spring security내부에서 인증에 실패했을때 호출되어지는 클래스
 * */
@Service //id="memberAuthenticationFailureHandler"
public class MemberAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
//		String msg = "Invaild Username or Password";
		  
		request.setAttribute("errorMessage", exception.getMessage());
		request.getRequestDispatcher("/WEB-INF/views/member/loginForm.jsp").forward(request, response);
		

	}

}
