package org.nz.demo3.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.nz.demo3.domain.MessageDomain;
import org.nz.demo3.domain.MessageDomain;
import org.nz.demo3.service.MessageService;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/message")
public class MessageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        performAction(req, resp);
    }

    private void performAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MessageService ks = new MessageService();
        ArrayList<MessageDomain> as = ks.selectAll();
        System.out.println("找到留言页面了");
        req.getSession().setAttribute("kss3", as);
        System.out.println(as);
        // 不要重定向，直接返回页面
        req.getRequestDispatcher("/view/static/views/index3.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String content = req.getParameter("name");
        String sender = req.getParameter("message");

        MessageDomain message = new MessageDomain();
        message.setName(content);
        message.setMessage(sender);
        MessageService messageService=new MessageService();
        boolean success = messageService.KqAdd(message);

        if (success) {
            resp.getWriter().println("<script>alert('留言成功');window.location.href=document.referrer;</script>");
        } else {
            resp.getWriter().println("<script>alert('留言失败');window.location.href=document.referrer;</script>");
        }
    }
}
