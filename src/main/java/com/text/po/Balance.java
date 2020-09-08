package com.text.po;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author 王元圣
 */
public class Balance implements Serializable {
    private int userid;
    private BigDecimal balance;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }
}
