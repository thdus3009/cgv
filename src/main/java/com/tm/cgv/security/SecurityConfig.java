package com.tm.cgv.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.tm.cgv.member.MemberService;

@Configuration
@EnableWebSecurity	// 스프링 MVC와 스프링 Security 결합하는 Annotation
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private DataSource dataSource;
	
	@Bean
	public PasswordEncoder passwordEncoder() throws Exception {	
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}

	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
	
	@Bean
	public UserDetailsService customUserService() {
		return new MemberService();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		System.out.println("configure");
		auth.inMemoryAuthentication().withUser("admin").password("{noop}admin").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("member").password("{noop}member").roles("MEMBER");
		
		// mybatis를 가지고 값 가져오기
		
		auth.userDetailsService(customUserService())
		.passwordEncoder(passwordEncoder());
	}
	
	@Override
	public void configure(HttpSecurity http) throws Exception {
		
		// 아래 두 경로는 루트 경로로 취급함
		// src/main/resources
		// src/main/static
		
		http.authorizeRequests()
		.antMatchers("/css/**", "/images/**", "/js/**").permitAll()
		.antMatchers("/", "/member/**").permitAll()
        .antMatchers("/movie/**").hasRole("MEMBER")
        .antMatchers("/admin/**").hasRole("ADMIN") 
        .anyRequest().authenticated();
		
		http.formLogin()
		.loginPage("/member/memberLogin")
		.loginProcessingUrl("login")
		.usernameParameter("uid")
		.passwordParameter("pwd")
		.successHandler(loginSuccessHandler());
		
		http.logout()
		.logoutUrl("/customLogout")
		.invalidateHttpSession(true)
		.deleteCookies("remember-me", "JSESSION_ID");
		
		http.rememberMe()
		.key("cgvProject200618")
		.tokenRepository(persistentTokenRepository())
		.tokenValiditySeconds(60*60*24*7); // 7일
	}
}
