package com.text.controller;

import com.text.po.User;
import com.text.service.BalanceService;
import com.text.service.UserService;
import com.text.utils.JDBCUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author 王元圣
 */
@Controller

public class CheckBalanceController {
    @Autowired
    private BalanceService balanceService;
    @Autowired
    private UserService userService;

    @RequestMapping("/Check")
    @ResponseBody
    public BigDecimal demo1(String userid) {
        int userid1 = Integer.parseInt(userid);
        BigDecimal balance = balanceService.selectBalanceByUserid(userid1);
        return balance;
    }
}
