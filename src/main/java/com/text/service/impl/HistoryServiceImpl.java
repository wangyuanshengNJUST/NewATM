package com.text.service.impl;

import com.text.dao.HistoryDao;
import com.text.po.History;
import com.text.po.User;
import com.text.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * @author 王元圣
 */
@Service
public class HistoryServiceImpl implements HistoryService {
    @Autowired
    private HistoryDao historyDao;

    @Override
    public void insertAddHistory(String username, int type, BigDecimal money, Timestamp time) {
        historyDao.insertAddHistory(username, type, money, time);
    }
    @Override
     public List<History> selectHistory(User user){
       return  historyDao.selectHistory(user);
    }
}
