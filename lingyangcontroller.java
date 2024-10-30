package org.nz.demo3.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.nz.demo3.domain.lingyangdomain;
import org.nz.demo3.domain.tuijiandomain;
import org.nz.demo3.domain.zhuyedomain;
import org.nz.demo3.service.lingyangservice;
import org.nz.demo3.service.tuijianservice;
import org.nz.demo3.service.zhuyeservice;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/lingyangList")
public class lingyangcontroller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String sex = req.getParameter("sex");
        String ageParam = req.getParameter("age");
        int age = 0; // 默认年龄为0，您也可以选择其他默认值
        if (ageParam != null && !ageParam.isEmpty()) {
            try {
                age = Integer.parseInt(ageParam);
            } catch (NumberFormatException e) {
                // 可以在此处处理无法解析年龄的情况，例如给出默认值或者返回错误信息
                // 注意：这里的处理方式取决于您的业务逻辑
                e.printStackTrace(); // 在实际生产环境中，最好记录错误日志而不是直接打印栈轨迹
            }
        }
        String species = req.getParameter("species");
        String modelnumber = req.getParameter("modelnumber");
        lingyangservice ks = new lingyangservice();
        ArrayList<lingyangdomain> as = ks.SelectAll(age, sex, species, modelnumber);
        System.out.println("找到领养页面了");
        if(as!=null){
            req.getSession().setAttribute("kss2", as);
            System.out.println(as);
            resp.sendRedirect("/view/static/views/index4.jsp");
        }else {
            resp.getWriter().println("<script>alert('没有找到哦');window.location.href=document.referrer;</script>");
        }

    }
}