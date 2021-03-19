package org.mera.config;


import lombok.Setter;
import org.mera.controller.UserController;
import org.mera.security.CustomAccessDeniedHandler;
import org.mera.security.CustomLoginSuccessHandler;
import org.mera.security.CustomUserDetailsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private static final Logger logger = LoggerFactory.getLogger(SecurityConfig.class);

    @Setter(onMethod_ = {@Autowired})
    private DataSource dataSource;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //super.configure(http);

        http.authorizeRequests()
                .antMatchers("/sample/all").permitAll()
                .antMatchers("/dashboard/*").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/statistics/*").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/report/*").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/webs/*").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/gyanking").access("hasAnyRole('ROLE_ADMIN', 'ROLE_GYANKING')")
                .antMatchers("/main").access("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
                .antMatchers("/user/*").access("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
                .antMatchers("/video/*").access("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
                .antMatchers("/board/*").access("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
                .antMatchers("/quiz/*").access("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
                .antMatchers("/testView/*").permitAll();


        http.formLogin()
                .loginPage("/customLogin")
                .loginProcessingUrl("/login")
                .successHandler(loginSuccessHandler()
                );

        http.logout()
                .logoutUrl("/logout")
                .invalidateHttpSession(true)
                .deleteCookies("remember-me", "JSESSION_ID");

        http.rememberMe()
                .key("wishmera")
                .tokenRepository(persistentTokenRepository())
                .tokenValiditySeconds(86400);

        http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());

        // Set the security settings
        //http.httpBasic().and().authorizeRequests().anyRequest().authenticated().and().csrf();
        http.exceptionHandling().authenticationEntryPoint(loginUrlAuthenticationEntryPoint());
    }

    @Bean
    public LoginUrlAuthenticationEntryPoint loginUrlAuthenticationEntryPoint(){

        LoginUrlAuthenticationEntryPoint entry = new LoginUrlAuthenticationEntryPoint("/customLogin"){
            @Override
            public void commence(final HttpServletRequest request, final HttpServletResponse response,
                                 final AuthenticationException authException) throws IOException, ServletException {

                String ajaxHeader = request.getHeader("X-Requested-With");
                if(ajaxHeader != null && "XMLHttpRequest".equals(ajaxHeader)){
                    //InsufficientAuthenticationException
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
                }
                else{
                    super.commence(request, response, authException);
                }
            }
        };
        return entry;
    }

    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler() {
        return new CustomLoginSuccessHandler();
    }

    @Bean
    public AccessDeniedHandler accessDeniedHandler() {
        return new CustomAccessDeniedHandler();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService customUserService() {
        return new CustomUserDetailsService();
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
        repo.setDataSource(dataSource);
        return repo;
    }
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        super.configure(auth);
//        logger.info("configure......................");
//        auth.inMemoryAuthentication().withUser("admin").password("{noop}admin").roles("ADMIN");
//        auth.inMemoryAuthentication().withUser("member").password("{noop}member").roles("MEMBER");
//    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //super.configure(auth);
        auth.userDetailsService(customUserService())
                .passwordEncoder(passwordEncoder());
    }
}
