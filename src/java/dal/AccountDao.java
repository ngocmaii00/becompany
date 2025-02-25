/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Account;
import java.sql.*;

public class AccountDao extends DBConnect {
    public List<Account> getAllAccount (String userId) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from UserDetail where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userId);
            ResultSet result = st.executeQuery();
            while(result.next()) {
                Account account = new Account(result.getString("userId"), result.getString("username"), result.getString("password"), result.getBoolean("gender"), result.getDate("date"), result.getString("email"));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
