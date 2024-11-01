package org.nz.demo3.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class C3p0Utils {
    private static ComboPooledDataSource dataSource;
    static {
        dataSource = new ComboPooledDataSource();
        // 设置数据库连接相关配置，如数据库URL、用户名、密码等
    }
    public static ComboPooledDataSource getDataSource() {
        return dataSource;
    }


    // 初始化连接池
    static {
        try {
            dataSource = new ComboPooledDataSource();
            dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/chongwu");
            dataSource.setUser("root");
            dataSource.setPassword("root");
            dataSource.setDriverClass("com.mysql.jdbc.Driver");
            // 其他数据源配置
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
    }

    // 获取数据库连接
    public static Connection getConnection() {
        try {
            System.out.println(dataSource.getUser());
            System.out.println(dataSource.getPassword());
            return dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // 关闭数据库连接
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void closeConnection(Connection conn, PreparedStatement ps, ResultSet rs) {
    }
}



