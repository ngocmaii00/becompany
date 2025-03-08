/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Teddy;

/**
 *
 * @author PC
 */
public class HeaderDao extends DBConnect {
    public List<String> getAll() {
        List<String> list = new ArrayList<>();
        String sql = "select distinct p.type from Product p";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                list.add(result.getString("type"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
