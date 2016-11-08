package com.zbt.yqjk.dao;

import com.zbt.yqjk.pojo.User;

public interface IUserDao {
	int deleteByPrimaryKey(Long userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User selectUser(User record);
}