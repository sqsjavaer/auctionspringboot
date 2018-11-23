
package com.baizhi.ssm.service;

import com.baizhi.ssm.entity.User;

public interface UserService {
    
	User login(User user);
	void addUser(User user);
}
