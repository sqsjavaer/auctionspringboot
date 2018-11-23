package com.baizhi.ssm.dao;

import com.baizhi.ssm.entity.User;


public interface UserDao {
   
	   User selectOneByNameAndPwd(User user);
	    void insertOne(User user); 
}
