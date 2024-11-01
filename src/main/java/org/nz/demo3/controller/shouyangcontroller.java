package org.nz.demo3.controller;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.nz.demo3.domain.*;
import org.nz.demo3.service.lingyangservice;
import org.nz.demo3.service.shouyangservice;
import org.nz.demo3.service.tuijianservice;
import org.nz.demo3.service.zhuyeservice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/shouyangList")
public class shouyangcontroller extends HttpServlet {
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement ps;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        int userid = Integer.parseInt(req.getParameter("ID"));
        int petid = Integer.parseInt(req.getParameter("petId"));
        shouyangservice ae=new shouyangservice();
        String b=ae.upDate(petid);
        Boolean a=ae.KqAdd(userid,b);
        if (a){
            resp.getWriter().println("<script>alert('领养成功');window.location.href=document.referrer;</script>");
        } else {
            resp.getWriter().println("<script>alert('领养失败');window.location.href=document.referrer;</script>");
        }


    }
}