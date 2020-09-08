package com.text.controller;

import com.text.service.BalanceService;
import com.text.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.logging.Logger;

/**
 * @author
 */
@Controller

public class DrawController {
    static Logger logger = Logger.getLogger(DrawController.class.getName());


    @Autowired
    private BalanceService balanceService;
    @Autowired
    private HistoryService historyService;


    @RequestMapping("/draw")
    @ResponseBody
    public String draw(String userid, String money) {
        BigDecimal money1 = new BigDecimal(money);
        int userid1 = Integer.parseInt(userid);
        BigDecimal banlance = balanceService.selectBalanceByUserid(userid1);
      /*  Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        historyService.insertAddHistory(username, 0, money1, time);*/
        if (banlance.compareTo(money1) < 0) {
            return String.valueOf(banlance);
        } else {
            balanceService.UpdateDrawBalance(userid1, money1);
            return money;
        }
    }
}



