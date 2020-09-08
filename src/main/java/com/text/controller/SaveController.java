package com.text.controller;

import com.text.service.BalanceService;
import com.text.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.sql.*;
import java.util.Date;

/**
 * @author 王元圣
 */
@Controller

public class SaveController {
    @Autowired
    private BalanceService balanceService;
    @Autowired
    private HistoryService historyService;

    @RequestMapping("/save")
    @ResponseBody
    public String save(String userid, String money) {
        BigDecimal money1 = new BigDecimal(money);
        int userid1 = Integer.parseInt(userid);
        balanceService.UpdateAddBalance(userid1, money1);
      /*  Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        historyService.insertAddHistory(username, 0, money1, time);*/
        return money;
    }
}
