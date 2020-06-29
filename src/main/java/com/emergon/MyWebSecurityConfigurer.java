package com.emergon;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class MyWebSecurityConfigurer extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("user").password("{noop}1234").roles("USER")
                .and()
                .withUser("admin").password("{noop}4321").roles("ADMIN", "USER")
                .and()
                .withUser("teacher").password("{noop}1234").roles("TEACHER");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()//Restrict access based on the HttpServletRequest
                .antMatchers("/").hasAnyRole("ADMIN", "USER", "TEACHER")
                .antMatchers("/admin").hasRole("ADMIN")
                .antMatchers("/teacher").hasRole("TEACHER")
                .and()
                .formLogin()//We are customizing the form login process
                .loginPage("/loginPage")//This is the url to show the login page
                .permitAll()//Allow everyone to see login page. Don't have to be logged in.
                .and()
                .logout()
                .and()
                .exceptionHandling().accessDeniedPage("/access-denied");

    }

}
