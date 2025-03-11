/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import model.Customer;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CustomerDetail;
import model.User;
/**
 *
 * @author zeryus
 */
public class UserDAO extends DBConnect {
    
    
     public User getAuthentication(String usr){
        String sql = "select userId,email,username,password,status,role from [User] where username =?";
        
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,usr);
           
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User u = new Customer(rs.getString("userId"),rs.getString("email"),usr,rs.getString("password"),rs.getString("status"),rs.getString("role"));
                return u;
            }
            
        }catch(SQLException e){
            System.err.println(e);
        }
        
        return null;
    }
     
    public Customer getCustomerAuthentication(String usr){
        String sql = "select userId,email,username,password,status,role,auth_provider from [User] where username =?";
        
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,usr);
           
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                Customer u = new Customer(rs.getString("userId"),rs.getString("email"),usr,rs.getString("password"),rs.getString("status"),rs.getString("role"));
                return u;
            }
            
        }catch(SQLException e){
            System.err.println(e);
        }
        
        return null;
    }
    
    public String getSignUpUsername (String usr){
        String sql = "select username from [User] where username =?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, usr);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                
                return rs.getString("username");
            }
        }catch(SQLException e){
            System.err.println(e);
        }
        return null;
    }
    
    public String getSignUpEmail (String email){
        String sql = "select email from [User] where email = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                
                return rs.getString("email");
            }
        }catch(SQLException e){
            System.err.println(e);
        }
        return null;
    }
    
    public boolean searchUserId(String usrId){
        String sql = "select userId from user where userId = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, usrId);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                return true;
            
                
        }catch(SQLException e){
            System.err.println(e);
        }
        return false;
    }
    
    public void addUser(String usrId, String email, String username, String password){
        String sql = "insert into [User] (userId,email,username,password,status,auth_provider) values(?,?,?,?,'active','LOCAL)";
        
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,usrId);
            st.setString(2, email);
            st.setString(3,username);
            st.setString(4,password);
            st.executeUpdate();
           
            
        }catch(SQLException e){
            
        }
    }
    
    public void addUserGoogleFacebook(String usrId, String email, String username,String auth_provider,String role){
        String sql = """
                     INSERT INTO [User] (userId, email, username, [status], auth_provider,role) 
                     VALUES (?, ?, ?, 'active', ?,?)""";
        
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,usrId);
            st.setString(2, email);
            st.setString(3,username);
            st.setString(4,auth_provider);
            st.setString(5,role);
            st.executeUpdate();
           
            
        }catch(SQLException e){
            System.err.println(e);
        }
    }
    
    public Customer findByEmail(String email){
        String sql = "select * from [User] where email =? and role = 'USER'";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,email);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return new Customer(rs.getString("userId"),rs.getString("email"),rs.getString("username"),rs.getString("password"),rs.getString("status"),rs.getString("auth_provider"));
            }
        }catch(SQLException e){
            System.err.println(e);
        }
        return null;
    }
    
    public Customer findByResetPasswordToken(String token){
        String sql = "select userId,email,username,password from [User] where reset_password_token =? AND role ='USER'";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,token);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return new Customer(rs.getString("userId"),rs.getString("email"),rs.getString("username"),rs.getString("password"),rs.getString("reset_password_token"));
            }
        }catch(SQLException e){
            System.err.println(e);
        }
        return null;
    }
    public static void main(String []args){
        UserDAO ud = new UserDAO();
    }
    
    public void update(Customer user){
        String sql ="update [User] set reset_password_token = ? and role = 'USER'";
        
        if(user.getPassword() != null)
            sql += ", [password] = '" + user.getPassword() + "' ";
        
        sql += "where userId = '" + user.getId() + "'";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
           
            st.setString(1,user.getResetPasswordToken());
            
           
            st.executeUpdate();
        }catch(SQLException e){
            System.err.println(e);
        }
    }
    
    public void updateCustomerProfile(Customer c){
        String sql="update [User] set "
                + "password=?,"//1
                + "image=? " //1
                +"where userId = '" + c.getId()+"' ;"
                +"update UserDetail set "
                +"firstName = ?,"//3
                +"lastName = ?,"//4
                +"gender = ?,"//5
                +"address = ? ,"//6
                +"dob = ?, "//7
                +"phone = ? "//8
                +"where userId = '" + c.getId()+"' ";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getPassword());
            st.setString(2, c.getImage());  
            st.setString(3, c.getUserDetail().getFirstName());
            st.setString(4, c.getUserDetail().getLastName());
            st.setBoolean(5, c.getUserDetail().getGender());
            st.setString(6,c.getUserDetail().getAddress());
            st.setDate(7, c.getUserDetail().getDob());
            st.setString(8,c.getUserDetail().getPhone() );
            st.executeUpdate();
        }catch(SQLException e){
            System.err.println(e);
        }
    }
    
    public List<User> getAll() {
        String sql = "select * from [User] u join UserDetail ud on u.userId = ud.userId";
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while(result.next()) {
                Customer c = new Customer("", "", "", new CustomerDetail(result.getString("firstname"), result.getString("lastname"), result.getInt("gender") == 1 ? true : false, result.getString("phone"), result.getString("address"), result.getDate("dob")), result.getString("userId"), result.getString("email"), result.getString("username"), "", result.getString("status"), result.getString("role"));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
