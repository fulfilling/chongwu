package org.nz.demo3.service;

import org.nz.demo3.Dao.gerenzhongxindao;
import org.nz.demo3.domain.gerenzhongxindomain;
import org.nz.demo3.domain.zhucedomain;
import org.nz.demo3.utils.C3p0Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class gerenzhongxinservice implements gerenzhongxindao {
    private static final long serialVersionUID = 1L;
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;
    @Override
    public Boolean KqAdd(gerenzhongxindomain kq,int id) {
            conn = C3p0Utils.getConnection();
            try {
                    String sql = "UPDATE users SET username = ?, `hobby` = ?, home = ?, password = ? WHERE id = ?";

                    ps = conn.prepareStatement(sql);
                    ps.setString(1, kq.getUsername());
                    ps.setString(2, kq.getLike());
                    ps.setString(3, kq.getHome());
                    ps.setString(4, kq.getPassword());
                    ps.setInt(5, id);
                    int result = ps.executeUpdate();
                    if (result > 0) {
                        System.out.println("这个数据修改成功");
                    } else {
                        System.out.println("这个数据修改失败");
                    }


            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return true;
        }
    }
