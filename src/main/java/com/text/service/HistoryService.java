package com.text.service;

import com.text.po.History;
import com.text.po.User;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * @author 王元圣
 */
public interface HistoryService {
    public void insertAddHistory(String username, int type, BigDecimal money, Timestamp time);

    public List<History> selectHistory(User user);
}