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
import model.Rating;

/**
 *
 * @author PC
 */
public class RatingDao extends DBConnect {
    public List<Rating> getAll(String productId) {
        List<Rating> list = new ArrayList<>();
        String sql = "select * from Rating r join [User] u on r.userId = u.userId where r.productId = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productId);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Rating r = new Rating(result.getString("comment"),
                        result.getString("date"),
                        result.getString("username"),
                        result.getString("image"));
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    
}
