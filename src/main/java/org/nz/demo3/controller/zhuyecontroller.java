package org.nz.demo3.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.nz.demo3.domain.zhuyedomain;
import org.nz.demo3.service.zhuyeservice;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/zhuyeList")
public class zhuyecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        zhuyeservice ks = new zhuyeservice();
        ArrayList<zhuyedomain> as = ks.SelectAll(req.getSession().getAttribute("username").toString());
        System.out.println("找到页面了");
        req.getSession().setAttribute("kss", as);
        resp.sendRedirect("/index.jsp");
    }
}