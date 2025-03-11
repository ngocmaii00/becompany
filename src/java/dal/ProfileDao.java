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
    
    public Customer getProfile(String userId) {
        
        String sql = "select * from UserDetail ud join [User] u on ud.userId = u.userId where u.userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {///public CustomerDetail( String firstName, String lastName, boolean gender, String phone, String address, Date dob) {
                CustomerDetail userDetail = new CustomerDetail(rs.getString("firstName"),rs.getString("lastName"), rs.getBoolean("gender"), rs.getString("phone"), rs.getString("address"), rs.getDate("dob"));
                Customer c = new Customer(rs.getString("auth_provider"),rs.getString("image"), rs.getString("reset_password_token"),
                        userDetail,userId, rs.getString("email"), rs.getString("username"), rs.getString("password"),rs.getString("status"),rs.getString("role"));
                return c;
                
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void updateImage(Customer c){
        String sql = "update [User] set image = ? where userId = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getImage());
            st.setString(2, c.getId());
            st.executeUpdate();
        }catch(SQLException e){
            System.err.println(e);
        }
    }
    
    public static void main(String []args){
        ProfileDao pd = new ProfileDao();
        Customer cs = pd.getProfile("S00001");
        System.err.println(cs.toString());
    }
}
