/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author zeryus
 */
public class User {
    protected String Id;
    protected String email;
    protected String username;
    protected String password;
    protected String status;
    protected String role;

    public User() {
    }

    
    public User(String Id, String email, String username, String password, String status, String role) {
        this.Id = Id;
        this.email = email;
        this.username = username;
        this.password = password;
        this.status = status;
        this.role = role;
    }

    public User(String Id, String email, String username, String password) {
        this.Id = Id;
        this.email = email;
        this.username = username;
        this.password = password;
    }
    

    public String getId() {
        return Id;
    }

    public String getEmail() {
        return email;
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

    public String getRole() {
        return role;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
}
