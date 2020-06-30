package com.emergon.service;

import com.emergon.model.MyUser;
import com.emergon.model.Role;
import com.emergon.repos.UserRepo;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepo urepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MyUser myuser = urepo.findByUsername(username);
        if (myuser == null) {
            throw new UsernameNotFoundException("Invalid username");
        }
        User springSecurityUser
                = new User(myuser.getUsername(), myuser.getPassword(), mapRolesToAuthorities(myuser.getRoles()));
        return springSecurityUser;
    }

    private List<SimpleGrantedAuthority> mapRolesToAuthorities(List<Role> roles) {
        List<SimpleGrantedAuthority> authorities = new ArrayList();
        for(Role role:roles){
            SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getRname());
            authorities.add(authority);
        }
        return authorities;
    }

}
