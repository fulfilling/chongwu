package org.nz.demo3.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.nz.demo3.domain.tuijiandomain;
import org.nz.demo3.domain.zhuyedomain;
import org.nz.demo3.service.tuijianservice;
import org.nz.demo3.service.zhuyeservice;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/tuijianList")
public class tuijiancontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        performAction(req, resp);
    }

    private void performAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        tuijianservice ks = new tuijianservice();
        ArrayList<tuijiandomain> as = ks.SelectAll();
        System.out.println("找到页面了");
        req.getSession().setAttribute("kss1", as);
        System.out.println(as);
        // 不要重定向，直接返回页面
        req.getRequestDispatcher("/view/static/views/index.jsp").forward(req, resp);
    }
}