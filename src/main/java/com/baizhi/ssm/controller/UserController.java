package com.baizhi.ssm.controller;

import com.baizhi.ssm.entity.User;
import com.baizhi.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;



@Controller
public class UserController {
    @Autowired
	private   UserService  userService;
    
    @RequestMapping("/login")
    public String login(String str,User user,HttpSession session){
    	
    	String strs = (String) session.getAttribute("img");
    	if(strs.equalsIgnoreCase(str)){
    		User u = userService.login(user);
    		session.setAttribute("user", u);
    		return "redirect:/getAll.do";
    	}else{
    		return"redirect:/login.jsp";
    	}

		/*User u = userService.login(user);
		if (u !=null){

			return "redirect:/getAll.do";
		}else{
			return "redirect:login.jsp";
		}*/

    }

    @Transactional
    @RequestMapping("/regist")
    public String regist(String str,User user,HttpSession session){
    	
    	String strs = (String) session.getAttribute("img");
    	if(strs.equalsIgnoreCase(str)){
    		userService.addUser(user);
    		return "login";    		
    	}else{
    		return"redirect:/regist.jsp";
    	}
    	
    }
}
