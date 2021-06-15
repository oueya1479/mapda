package kosta.mapda;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import kosta.mapda.security.MemberAuthenticationFailureHandler;
import kosta.mapda.security.MemberAuthenticationProvider;

@Configuration
@EnableWebSecurity //WebSecurityConfigurerAdapter 기본 클래스를 확장하고  개별 메소들을 재정의 해서 security관련 구성을 정의한다.
public class SecurityConfig  extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private MemberAuthenticationFailureHandler memberAuthenticationFailureHandler;
	
	@Autowired
	private MemberAuthenticationProvider memberAuthenticationProvider;
	
    public SecurityConfig() {
    	System.err.println("memberAuthenticationProvider = " + memberAuthenticationProvider);
    }
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception { // <security:authentication-manager> ���
		auth.authenticationProvider(memberAuthenticationProvider);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
		.antMatchers("/**").permitAll()
		.and()
		.csrf().disable() //csrf 중지
		.formLogin()
		.loginPage("/member/loginForm")
		.usernameParameter("id")
		.passwordParameter("password")
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/")
		.failureHandler(memberAuthenticationFailureHandler)
		.and()
		.logout()
		.logoutUrl("/member/logout")
		.logoutSuccessUrl("/")
		.deleteCookies("JSESSIONID")
		.invalidateHttpSession(true)
		.and();
		
	}	 
}

