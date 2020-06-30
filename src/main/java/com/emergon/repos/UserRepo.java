package com.emergon.repos;

import com.emergon.model.MyUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<MyUser, Integer>{

    public MyUser findByUsername(String username);

    
}
