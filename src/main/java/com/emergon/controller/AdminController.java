package com.emergon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {

    @RequestMapping
    public String showAdminHome(){
        return "admin-home";
    }
    
    @GetMapping("/create")
    public String createUser(){
        return "createForm";
    }
    
}
