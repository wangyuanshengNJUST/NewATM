package com.text.utils;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/*
Druid连接池的工具类
 */
public class JDBCUtils {
    //1.定义成员变量 DataSource
    private static DataSource ds;
    static {
        //1.加载配置文件
        Properties pro = new Properties();
        try {
            pro.load(JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties"));
            //获取DataSource
            ds = DruidDataSourceFactory.createDataSource(pro);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //获取连接
    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
    //释放资源
    public static void close(Statement stmt,Connection conn){
        if (stmt!=null) {
            try {
                stmt.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        if (conn!=null){
            try {
                conn.close();//归还连接
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }
    public static void close(ResultSet rs, Statement stmt, Connection conn){
        if (rs!=null) {
            try {
                rs.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        if (stmt!=null) {
            try {
                stmt.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        if (conn!=null){
            try {
                conn.close();//归还连接
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }
    //获取连接池
    public static DataSource getDataSource(){
        return ds;
    }
}