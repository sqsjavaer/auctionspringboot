
package com.baizhi.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baizhi.ssm.dao.UserDao;
import com.baizhi.ssm.entity.User;
import com.baizhi.ssm.service.UserService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    
	 
	@Autowired
	private  UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
   
	@Override
	public User login(User user) {
		return  userDao.selectOneByNameAndPwd(user);
	}

	@Override
	public void addUser(User user) {
		userDao.insertOne(user);
	}

}
