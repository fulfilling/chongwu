package org.nz.demo3.service;

import org.nz.demo3.Dao.Userdao;
import org.nz.demo3.Dao.tuijiandao;
import org.nz.demo3.domain.tuijiandomain;
import org.nz.demo3.domain.zhuyedomain;
import org.nz.demo3.utils.C3p0Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

public class tuijianservice implements tuijiandao {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;
    @Override
    public ArrayList<tuijiandomain> SelectAll() {
       ArrayList<tuijiandomain> as = new ArrayList<>();
     conn =  C3p0Utils.getConnection();
        try {
            String sql = "select * from pet";
            rs = conn.prepareStatement(sql).executeQuery();
            while (rs.next()) { // 移动 ResultSet 指针到第一行
                tuijiandomain ks = new tuijiandomain();
                String username = rs.getString("name");
                byte[] avatar = rs.getBytes("photo");
                int age=rs.getInt("age");
                String sex = rs.getString("sex");
                String species = rs.getString("species");
                String modelnumber = rs.getString("modelnumber");
                String base64Image = Base64.getEncoder().encodeToString(avatar);
                ks.setPhoto(base64Image);
                ks.setName(username);
                ks.setAge(age);
                ks.setSex(sex);
                ks.setSpecies(species);
                ks.setModelnumber(modelnumber);
                as.add(ks);
            }
            C3p0Utils.closeConnection(conn);
              return  as;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    }

