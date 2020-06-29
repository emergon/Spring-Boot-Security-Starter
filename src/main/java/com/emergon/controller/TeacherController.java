package com.emergon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/teacher")
@Controller
public class TeacherController {
    
    @RequestMapping
    public String showTeacherHome(){
        return "teacher-home";
    }
    
}
