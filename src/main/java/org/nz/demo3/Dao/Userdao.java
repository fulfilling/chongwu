package org.nz.demo3.Dao;

import java.sql.SQLException;

public interface Userdao {
    String login(String username, String password) throws SQLException;

}
