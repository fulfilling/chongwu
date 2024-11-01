package org.nz.demo3.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.nz.demo3.domain.juanzengdomain;
import org.nz.demo3.service.juanzengservice;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/juanzeng")
@MultipartConfig
public class juanzengcontroller extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        添加   写数据 到数据库
        req.setCharacterEncoding("UTF-8");

        resp.setContentType("text/html;charset=UTF-8");



        juanzengservice ks = new juanzengservice();
        juanzengdomain kq = new juanzengdomain();

        Part avatarPart = req.getPart("photo");
// 获取输入流
        InputStream avatarInputStream = avatarPart.getInputStream();
// 从输入流中读取数据到字节数组
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int bytesRead;
        byte[] data = new byte[1024];

        while ((bytesRead = avatarInputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, bytesRead);
        }

        buffer.flush();
        byte[] avatarBytes = buffer.toByteArray();
// 关闭输入流
        avatarInputStream.close();
        if (avatarBytes != null) {
            kq.setPhoto(avatarBytes);
        }
        kq.setName(req.getParameter("pet_name"));
        kq.setAge(Integer.parseInt(req.getParameter("age")));
        kq.setSex(req.getParameter("gender"));
        kq.setSpecies(req.getParameter("species"));
        kq.setModelnumber(req.getParameter("type"));

        boolean flag =  ks.KqAdd(kq);

        if (flag){
            resp.getWriter().println("<script>alert('捐赠成功');window.location.href=document.referrer;</script>");
        } else {
            resp.getWriter().println("<script>alert('捐赠失败');window.location.href=document.referrer;</script>");
        }





    }
}