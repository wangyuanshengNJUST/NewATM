package com.text.service.impl;

import com.text.dao.BalanceDao;
import com.text.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * @author 王元圣
 */
@Service
public class BalanceServiceImpl implements BalanceService {
    @Autowired
    private BalanceDao balanceDao;

    @Override
    public BigDecimal selectBalanceByUserid(int userid) {
        return balanceDao.selectBalanceByUserid(userid);
    }

    @Override
    public void UpdateAddBalance(int userid, BigDecimal money) {
        balanceDao.updateAddBalance(userid, money);
    }

    @Override
    public void UpdateDrawBalance(int userid, BigDecimal money) {
        balanceDao.updateDrawBalance(userid, money);
    }


}

