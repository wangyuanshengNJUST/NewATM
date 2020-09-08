package com.text.service;

import java.math.BigDecimal;

/**
 * @author 王元圣
 */
public interface BalanceService {
    public BigDecimal selectBalanceByUserid(int userid);

    public void UpdateAddBalance(int userid, BigDecimal money);

    public void UpdateDrawBalance(int userid, BigDecimal money);
}
