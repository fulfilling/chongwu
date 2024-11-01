package org.nz.demo3.service;


import org.nz.demo3.Dao.Userdao;
import org.nz.demo3.Dao.lingyangddao;
import org.nz.demo3.Dao.tuijiandao;
import org.nz.demo3.domain.lingyangdomain;
import org.nz.demo3.domain.tuijiandomain;
import org.nz.demo3.domain.zhuyedomain;
import org.nz.demo3.utils.C3p0Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

public class lingyangservice implements lingyangddao {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;
    @Override
    public ArrayList<lingyangdomain> SelectAll(int age,String sex,String species,String modelnumber) {
        ArrayList<lingyangdomain> as = new ArrayList<>();
        ArrayList<lingyangdomain> as1 = new ArrayList<>();
        conn =  C3p0Utils.getConnection();
        try {
            String sql = "select * from pet where age=? and sex=? and species=? and modelnumber=?";
            ps =  conn.prepareStatement(sql);
            ps.setInt(1,age);
            ps.setString(2,sex);
            ps.setString(3,species);
            ps.setString(4,modelnumber);
            rs =  ps.executeQuery();
            while (rs.next()) { // 移动 ResultSet 指针到第一行
                lingyangdomain ks = new lingyangdomain();
                String username = rs.getString("name");
                byte[] avatar = rs.getBytes("photo");
                int age1=rs.getInt("age");
                int id=rs.getInt("id");
                String sex1 = rs.getString("sex");
                String species1 = rs.getString("species");
                String modelnumber1 = rs.getString("modelnumber");
                String base64Image = Base64.getEncoder().encodeToString(avatar);
                ks.setPhoto(base64Image);
                ks.setName(username);
                ks.setAge(age1);
                ks.setSex(sex1);
                ks.setId(id);
                ks.setSpecies(species1);
                ks.setModelnumber(modelnumber1);
                as.add(ks);
            }
            C3p0Utils.closeConnection(conn);
            if(as.equals(as1)){
                return null;
            }else {
            return  as;}
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

