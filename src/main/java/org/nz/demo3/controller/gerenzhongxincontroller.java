package org.nz.demo3.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.nz.demo3.domain.gerenzhongxindomain;
import org.nz.demo3.domain.lingyangdomain;
import org.nz.demo3.domain.tuijiandomain;
import org.nz.demo3.domain.zhuyedomain;
import org.nz.demo3.service.gerenzhongxinservice;
import org.nz.demo3.service.lingyangservice;
import org.nz.demo3.service.tuijianservice;
import org.nz.demo3.service.zhuyeservice;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/gerenzhongxinList")
public class gerenzhongxincontroller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

// 获取表单数据
        String username = req.getParameter("username1");
        String pass = req.getParameter("password");
        String like = req.getParameter("hobbies");
        String home = req.getParameter("address");
        int id = Integer.parseInt(req.getParameter("ID"));

// 创建服务对象
        gerenzhongxinservice ks = new gerenzhongxinservice();
        gerenzhongxindomain ad = new gerenzhongxindomain();
        ad.setUsername(username);
        ad.setHome(home);
        ad.setLike(like);
        ad.setPassword(pass);

// 调用服务方法更新记录
        Boolean as = ks.KqAdd(ad, id);
        System.out.println("找到个人中心页面了");

// 输出提示信息并进行页面跳转
        if (as) {
            resp.getWriter().println("<script>alert('修改成功,请重新登录');window.location.href='/login.jsp';</script>");
            } else {
            resp.getWriter().println("<script>alert('修改失败');window.location.href=document.referrer;</script>");
        }

    }
}