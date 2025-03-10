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
import model.Customer;
import model.CustomerDetail;

/**
 *
 * @author PC
 */
public class ProfileDao extends DBConnect {
    public CustomerDetail getProfile(String userId) {
        
        String sql = "select * from UserDetail ud join [User] u on ud.userId = u.userId where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userId);
            ResultSet result = st.executeQuery();
            if (result.next()) {
//                return new CustomerDetail();
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
