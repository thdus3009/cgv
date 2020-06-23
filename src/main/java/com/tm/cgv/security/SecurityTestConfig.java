package com.tm.cgv.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.tm.cgv.user.UserService;


@Configuration
@EnableWebSecurity
public class SecurityTestConfig extends WebSecurityConfigurerAdapter {
    
	@Autowired
	private UserService userService;
	
	@Autowired
	private CustomLoginSuccessHandler loginSuccessHandler;
	
	@Autowired
	private CustomLogoutHandler logoutHandler;

	// 암호화 모듈
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    // 중복 로그인 제한을 위해 필요
    @Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }// Register HttpSessionEventPublisher

    // 중복 로그인 제한을 위해 필요
    @Bean
    public static ServletListenerRegistrationBean httpSessionEventPublisher() {
        return new ServletListenerRegistrationBean(new HttpSessionEventPublisher());
    }
    
    @Override
    public void configure(WebSecurity web) throws Exception
    {
        // static 디렉터리의 하위 파일 목록은 인증 무시 ( = 항상통과 )
        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        
    	http.authorizeRequests()
                // 페이지 권한 설정 (순서 위에서 아래로, 제한할 경로를 위로, 제한 없는 경로를 아래로)
        		.antMatchers("/admin/**").hasRole("ADMIN")
        		.antMatchers("/user/info").hasRole("MEMBER")
        		.antMatchers("/user/**").permitAll()
                .antMatchers("/**").permitAll()
            .and() // 로그인 설정
                .formLogin()
                .loginPage("/user/login")
                .successHandler(loginSuccessHandler)
                //.defaultSuccessUrl("/")	// successHandler를 안쓸거면 사용
                .permitAll()
        	.and() // 로그아웃 설정 (핸들러 있어야 session 지워짐(아무것도 수행안해도 그런듯))
        		.logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/user/logout"))
                .addLogoutHandler(logoutHandler)
                .logoutSuccessUrl("/user/logoutResult")		// controller내의 결과 경로 매핑
                .invalidateHttpSession(true)
                //.deleteCookies("JSESSIONID")
            .and()
                // 403 예외처리 핸들링
                .exceptionHandling().accessDeniedPage("/user/denied");
        
        // 중복 접속 제한
        http.sessionManagement()
        	.maximumSessions(1)
        	.maxSessionsPreventsLogin(true)
        	.expiredUrl("/duplicated-login")
            .sessionRegistry(sessionRegistry());
    }

    // 로그인시, userService.loadUserByUsername로 user인증 진행, return User type
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
    	auth.userDetailsService(userService).passwordEncoder(passwordEncoder());
    }
}
