package com.text.service.impl;

import com.text.dao.UserDao;
import com.text.po.User;
import com.text.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 王元圣
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User selectUser(User user) {
        return userDao.selectUser(user);
    }
    @Override
    public void updateType(User user) {
        userDao.updateType(user);
    }
}
