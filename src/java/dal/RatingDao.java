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
import java.sql.Date;
import java.time.LocalDate;

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
                        result.getString("username"),
                        result.getString("image"),
                        result.getInt("stars"));
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void insertRating(String userId, String productId, String comment, int stars) {
        String sql = "insert into Rating(userId, productId, comment, stars, date) values (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);            
            st.setString(1, userId);
            st.setString(2, productId);
            st.setString(3, comment);
            st.setInt(4, stars);
            Date date = Date.valueOf(LocalDate.now());
            st.setDate(5, date);
            System.out.println(sql);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
}
