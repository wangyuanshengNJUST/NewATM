package com.text.dao;

import com.text.po.History;
import com.text.po.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * @author 王元圣
 */
@Repository
public interface HistoryDao {
//    @Insert("insert into history values (#{username},#{type},#{money},#{time})")
   // @Insert("insert into atm.history values (#{username},#{type},#{money},#{time})")
    public void insertAddHistory(@Param("username") String username, @Param("type") int type, @Param("money") BigDecimal money, @Param("time") Timestamp time);
    public List<History> selectHistory (User user);
}
