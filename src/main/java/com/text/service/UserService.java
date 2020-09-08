package com.text.service;

import com.text.po.User;

/**
 * @author 王元圣
 */
public interface UserService {
    public User selectUser(User user);

    public void updateType(User user);
}
