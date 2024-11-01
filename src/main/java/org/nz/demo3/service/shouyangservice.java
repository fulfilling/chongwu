package org.nz.demo3.service;

import org.nz.demo3.Dao.shouyangdao;
import org.nz.demo3.utils.C3p0Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class shouyangservice implements shouyangdao {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;
    @Override
    public boolean KqAdd(int userid, String petname) {
        String sql = "UPDATE users SET pet=? WHERE id=?";
        conn =  C3p0Utils.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, petname);
            ps.setInt(2, userid);
        int result = ps.executeUpdate();
        if (result > 0) {
            System.out.println("这个数据添加成功");
            return true;
        } else {
            System.out.println("这个数据添加失败");
            return false;
        }

        } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    }

    @Override
    public String upDate(int petid) {
        conn =  C3p0Utils.getConnection();
        String sql1 = "select name from pet where id =?";
        String sql = "DELETE FROM pet WHERE id=?";
        try {
            ps = conn.prepareStatement(sql1);
            ps.setInt(1,petid);
            rs = ps.executeQuery();
            String a=null;
            while (rs.next()) { // 移动 ResultSet 指针到第一行
                a=rs.getString("name");
               }

            ps = conn.prepareStatement(sql);
            ps.setInt(1, petid);
            int result = ps.executeUpdate();
            if (result > 0) {
                System.out.println("这个数据删除成功");
            } else {
                System.out.println("这个数据删除失败");
            }
            return a;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
