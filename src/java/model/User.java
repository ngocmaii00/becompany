/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.UserDAO;

/**
 *
 * @author zeryus
 */




public class User {
    private String userId;
    private String email;
    private String username;
    private String password;
    private String status;
    private String image;
    private String resetPasswordToken;
    private UserDetail userDetail;

    public User() {
    }

    
    public User(String userId,String email, String username, String status){
        this.userId = userId;
        this.email = email;
        this.username = username;
        
        this.status = status;
    }
    
    public User(String userId,String email, String username, String password, String status){
        this.userId = userId;
        this.email = email;
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public UserDetail getUserDetail() {
        return userDetail;
    }

    public String getEmail() {
        return email;
    }
    
   
    

    public String getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getStatus() {
        return status;
    }

    public String getResetPasswordToken() {
        return resetPasswordToken;
    }
    

    public void setUserDetail(UserDetail userDetail) {
        this.userDetail = userDetail;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   
    

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
        this.resetPasswordToken = null;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void updateResetPasswordToken(String token){
        this.resetPasswordToken = token;
        
            
    }
    
    
}
