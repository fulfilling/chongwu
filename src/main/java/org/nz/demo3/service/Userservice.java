package org.nz.demo3.service;

import org.nz.demo3.Dao.Userdao;
import org.nz.demo3.utils.C3p0Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Userservice implements Userdao {

    @Override
    public String login(String username, String password) throws SQLException {
        Connection conn = C3p0Utils.getConnection();
        PreparedStatement ps;
        ResultSet rs;
//        登录是查询数据库
        String sql = "select * from users where username =? and password = ?";
        ps =  conn.prepareStatement(sql);
        ps.setString(1,username);
        ps.setString(2,password);
        rs =  ps.executeQuery();
        System.out.println(rs);
        if (rs.next()==true){
            return username;
        }else {
            return  password;
        }
    }
}

