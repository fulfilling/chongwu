package org.nz.demo3.service;



import org.nz.demo3.Dao.juanzengdao;
import org.nz.demo3.Dao.zhucedao;
import org.nz.demo3.controller.zhucecontroller;
import org.nz.demo3.domain.juanzengdomain;
import org.nz.demo3.domain.zhucedomain;
import org.nz.demo3.utils.C3p0Utils;
import java.sql.*;
import java.util.ArrayList;


public class juanzengservice  implements juanzengdao {
    private static final long serialVersionUID = 1L;
    private Connection conn;
    private PreparedStatement ps;

    @Override
    public boolean KqAdd(juanzengdomain kq) {
        conn = C3p0Utils.getConnection();
        try {

                String sql = "INSERT INTO pet (name, age,sex,species,modelnumber,photo) values (?, ?,?,?,?,?);";

                ps = conn.prepareStatement(sql);
                ps.setString(1, kq.getName());
                ps.setInt(2, kq.getAge());
                ps.setString(3, kq.getSex());
                ps.setString(4, kq.getSpecies());
                ps.setString(5, kq.getModelnumber());
                ps.setBytes(6, kq.getPhoto());
                int result = ps.executeUpdate();
                if (result > 0) {
                    System.out.println("这个数据添加成功");
                } else {
                    System.out.println("这个数据添加成功");
                }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }
}
