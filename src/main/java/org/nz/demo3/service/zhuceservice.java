package org.nz.demo3.service;



import org.nz.demo3.Dao.zhucedao;
import org.nz.demo3.controller.zhucecontroller;
import org.nz.demo3.domain.zhucedomain;
import org.nz.demo3.utils.C3p0Utils;
import java.sql.*;
import java.util.ArrayList;


public class zhuceservice  implements zhucedao {
    private static final long serialVersionUID = 1L;
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;

    @Override
    public boolean KqAdd(zhucedomain kq) {
        conn = C3p0Utils.getConnection();
        ArrayList<zhucedomain> as = new ArrayList<>();
        String sql1 = "select * from users";
        try {
            rs = conn.prepareStatement(sql1).executeQuery();
            String newUsername = kq.getUsername();
            boolean isDuplicate = false;
            while (rs.next()) {
                zhucedomain ks = new zhucedomain();
                String username = rs.getString("username");
                String password = rs.getString("password");
                String hobby = rs.getString("hobby");
                String home = rs.getString("home");
                if (username.equals(newUsername)) {
                    // 如果找到重复的用户名
                    isDuplicate = true;
                    break;
                }
            }
                if (isDuplicate) {
                    System.out.println("用户名重复");
                } else {
                    String sql = "INSERT INTO users (username, password,`hobby`,home,avatar) values (?, ?,?,?,?);";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, kq.getUsername());
                    ps.setString(2, kq.getPassword());
                    ps.setString(3, kq.getHobby());
                    ps.setString(4, kq.getHome());
                    ps.setBytes(5, kq.getAvatar());
                    int result = ps.executeUpdate();
                    if (result > 0) {
                        System.out.println("这个数据添加成功");
                    } else {
                        System.out.println("这个数据添加成功");
                    }
                }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }
}
