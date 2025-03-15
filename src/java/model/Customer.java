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




public class Customer extends User {
    private String auth_provider;
    private String image;
    private String resetPasswordToken;
    private CustomerDetail userDetail;

    public Customer() {
        super();
    }

    public Customer(String Id, String email, String username, String password, String status, String role,String auth_provider, String image, String resetPasswordToken, CustomerDetail userDetail) {
        super(Id, email, username, password, status, role);
        this.auth_provider = auth_provider;
        this.image = image;
        this.resetPasswordToken = resetPasswordToken;
        this.userDetail = userDetail;
    }

    
    
   
   
    public Customer(String Id,String email, String username, String password, String status,String role){
        super(Id, email, username, password, status, role);
    }
    
   
    
    public Customer(String userId, String email, String username, String password, String resetPasswordToken) {
        super(userId,email,username,password);
        this.resetPasswordToken = resetPasswordToken;
    }
    
    
    
    public Customer(String userId,String email, String username, String password, String status,String role,String auth_provider){
        super(userId, email, username, password, status, role);
        this.auth_provider = auth_provider;
    }

    public Customer(String userId, String email, String username, String password, String status,String role,String auth_provider, String image, String resetPasswordToken) {
        super(userId, email, username, password, status, role);
        this.auth_provider = auth_provider;
        this.image = image;
        this.resetPasswordToken = resetPasswordToken;
        
    }

   
    
    


    public String getAuth_provider() {
        return auth_provider;
    }

    public String getImage() {
        return image;
    }
      
    public String getResetPasswordToken() {
        return resetPasswordToken;
    }
     
    public CustomerDetail getUserDetail() {
        return userDetail;
    }
    
    
    


    public void setAuth_provider(String auth_provider) {
        this.auth_provider = auth_provider;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
    public void updateResetPasswordToken(String token){
        this.resetPasswordToken = token;
        
            
    }
    
    public void setUserDetail(CustomerDetail userDetail) {
        this.userDetail = userDetail;
    }

    @Override
    public String toString() {
        return "Customer{" + "auth_provider=" + auth_provider + ", image=" + image + ", resetPasswordToken=" + resetPasswordToken + ", userDetail=" + userDetail.toString() + '}';
    }
    
    
}
