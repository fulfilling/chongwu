package org.nz.demo3.service;

import org.nz.demo3.domain.MessageDomain;
import org.nz.demo3.utils.C3p0Utils;
import org.nz.demo3.Dao.messagedao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MessageService implements messagedao {
    private Connection conn;
    private PreparedStatement ps;
    public ArrayList<MessageDomain> selectAll() {
        ArrayList<MessageDomain> messages = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = C3p0Utils.getConnection();
            String sql = "SELECT name, message FROM messages";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                MessageDomain message = new MessageDomain();
                String name = rs.getString("name");
                String messageContent = rs.getString("message");
                message.setName(name);
                message.setMessage(messageContent);
                messages.add(message);
            }
            return messages;
        } catch (SQLException e) {
            // Handle exceptions
            throw new RuntimeException("Error retrieving messages", e);
        } finally {
            // Close resources in finally block
            C3p0Utils.closeConnection(conn, ps, rs);
        }
    }

    @Override
    public boolean KqAdd(MessageDomain kq) {
        conn = C3p0Utils.getConnection();
        try {
            String sql = "INSERT INTO messages (name, message) VALUES (?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, kq.getName());
            ps.setString(2, kq.getMessage());

            int result = ps.executeUpdate();
            if (result > 0) {
                System.out.println("数据添加成功");
            } else {
                System.out.println("数据添加失败");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // 关闭连接和声明
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

}


