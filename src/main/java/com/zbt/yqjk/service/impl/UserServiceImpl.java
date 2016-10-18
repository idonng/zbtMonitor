package com.zbt.yqjk.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zbt.yqjk.dao.IUserDao;
import com.zbt.yqjk.pojo.User;
import com.zbt.yqjk.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;
	@Override
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}

}
