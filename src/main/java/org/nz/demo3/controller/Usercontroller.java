package org.nz.demo3.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.nz.demo3.domain.zhuyedomain;
import org.nz.demo3.service.Userservice;
import org.nz.demo3.utils.C3p0Utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Objects;

@WebServlet("/login")
public class Usercontroller extends HttpServlet
{
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;
    private Userservice us = new Userservice();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//       我们需要拿到前端的账号密码
        conn =  C3p0Utils.getConnection();
        try {
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            System.out.println(username+password);
            String x =   us.login(username,password);
            if(Objects.equals(x, username)){
//               登录成功
//               做一个页面重定向 index.jsp
                String sql = "select * from users where username= ?";
                    ps = conn.prepareStatement(sql);
                    ps.setString(1,x);
                    rs = ps.executeQuery();
                    if (rs.next()) { // 移动 ResultSet 指针到第一行
                        byte[] avatar1 = rs.getBytes("avatar");
                        String hobby =rs.getString("hobby");
                        String home =rs.getString("home");
                        int id=rs.getInt("id");
                        String pet =rs.getString("pet");
                        String base64Image = Base64.getEncoder().encodeToString(avatar1);
                        req.getSession().setAttribute("username", username);
                        req.getSession().setAttribute("hobby", hobby);
                        req.getSession().setAttribute("home", home);
                        req.getSession().setAttribute("password", password);
                        req.getSession().setAttribute("avatar",base64Image);
                        req.getSession().setAttribute("id",id);
                        req.getSession().setAttribute("pet",pet);


                        resp.sendRedirect("/view/static/views/index.jsp");
                    } else {
                        // 没有找到匹配的记录，可能需要进行相应的处理
                    }

            }else {
//               登录失败
//                做一个页面重定向 error.jsp
                resp.sendRedirect("/login.jsp");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
