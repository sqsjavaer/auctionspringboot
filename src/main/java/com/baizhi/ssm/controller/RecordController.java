package com.baizhi.ssm.controller;

import com.baizhi.ssm.entity.Record;
import com.baizhi.ssm.entity.User;
import com.baizhi.ssm.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;



@Controller
public class RecordController {
     @Autowired
	private  RecordService recordService;
     
     @RequestMapping("/addRecord")
     public String  addRecord(Record   record,HttpSession session){
    	 User user = (User) session.getAttribute("user");
    	 record.setUser_id(user.getUser_id());
    	 recordService.add(record);
    	 
    	 return "redirect:/getAllOrder.do?id="+record.getAuction_id();
     }
}
