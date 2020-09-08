package com.text.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

/**
 * @author 王元圣
 */
@Repository("balanceDao")
public interface BalanceDao {
    //    @Select("select balance from balance where username = #{username}")
//    public BigDecimal selectBalanceByUsername(String username);
    //  @Select("select balance from atm.balance where username = #{username} ")

    /**
     * @param username
     * @return
     */
    BigDecimal selectBalanceByUserid(int userid);

    //    @Update("update balance set balance = balance + #{money} where username = #{username}")
//    @Update("update atm.balance set balance = balance + #{money} where username = #{username}")
     void updateAddBalance(@Param("userid") int userid, @Param("money") BigDecimal money);

    //    @Update("update balance set balance = balance - #{money} where username = #{username}")
    //   @Update("update atm.balance set balance = balance - #{money} where username = #{username}")
     void updateDrawBalance(@Param("userid") int userid, @Param("money") BigDecimal money);

//    List<BalanceVO> selectBalanceByUsername(BalanceVO balanceVO);
}
