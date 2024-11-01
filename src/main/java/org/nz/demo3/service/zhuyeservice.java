package org.nz.demo3.service;

import org.nz.demo3.Dao.zhuye;
import org.nz.demo3.domain.zhuyedomain;
import org.nz.demo3.utils.C3p0Utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;


public class zhuyeservice implements zhuye {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;
    @Override
    public ArrayList<zhuyedomain> SelectAll(String name) {
        ArrayList<zhuyedomain> as = new ArrayList<>();
        conn =  C3p0Utils.getConnection();
        String sql = "select * from users where username= ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            if (rs.next()) { // 移动 ResultSet 指针到第一行
                zhuyedomain ks = new zhuyedomain();
                String username = rs.getString("username");
                byte[] avatar = rs.getBytes("avatar");
                String base64Image = Base64.getEncoder().encodeToString(avatar);
                ks.setAvatar(base64Image);
                ks.setUsername(username);
                as.add(ks);
            } else {
                // 没有找到匹配的记录，可能需要进行相应的处理
            }
            C3p0Utils.closeConnection(conn);
            return  as;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
}
}
